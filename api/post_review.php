<?php
// Database config
$host = "localhost";
$dbname = "db";
$username = "user";
$password = "********";

// Allow CORS and set JSON content type
// At the top of submit_review.php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

try {
    // Connect to the database using PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get parameters
    $reviewer = isset($_GET['reviewer']) ? trim($_GET['reviewer']) : '';
    $marker = isset($_GET['marker']) ? trim($_GET['marker']) : '';
    $score = isset($_GET['score']) ? intval($_GET['score']) : 0;
    $comment = isset($_GET['comment']) ? trim($_GET['comment']) : '';

    if (empty($reviewer) || empty($marker) || $score < 1 || $score > 5) {
        http_response_code(400);
        echo json_encode(["error" => "Missing or invalid parameters."]);
        exit;
    }

    // Check if review already exists
    $checkStmt = $pdo->prepare("
        SELECT id FROM reviews 
        WHERE wp_user_login_reviewer = :reviewer AND wp_user_login_marker = :marker
    ");
    $checkStmt->execute([
        ':reviewer' => $reviewer,
        ':marker' => $marker
    ]);

    if ($checkStmt->rowCount() > 0) {
        // Update existing review
        $updateStmt = $pdo->prepare("
            UPDATE reviews 
            SET rating = :rating, comment = :comment, updated_at = CURRENT_TIMESTAMP
            WHERE wp_user_login_reviewer = :reviewer AND wp_user_login_marker = :marker
        ");
        $updateStmt->execute([
            ':rating' => $score,
            ':comment' => $comment,
            ':reviewer' => $reviewer,
            ':marker' => $marker
        ]);

        echo json_encode(["status" => "updated"]);
    } else {
        // Insert new review
        $insertStmt = $pdo->prepare("
            INSERT INTO reviews (wp_user_login_reviewer, wp_user_login_marker, rating, comment)
            VALUES (:reviewer, :marker, :rating, :comment)
        ");
        $insertStmt->execute([
            ':reviewer' => $reviewer,
            ':marker' => $marker,
            ':rating' => $score,
            ':comment' => $comment
        ]);

        echo json_encode(["status" => "inserted"]);
    }

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
