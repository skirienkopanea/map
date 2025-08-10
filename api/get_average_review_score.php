<?php
// Database config
$host = "localhost";
$dbname = "db";
$username = "user";
$password = "********";

// Allow CORS and set JSON content type
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

try {
    // Connect to the database using PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get marker username
    $marker = isset($_GET['marker']) ? trim($_GET['marker']) : '';

    if (empty($marker)) {
        http_response_code(400);
        echo json_encode(["error" => "Missing marker username"]);
        exit;
    }

    // Calculate average score and count
    $stmt = $pdo->prepare("
        SELECT 
            ROUND(AVG(rating), 2) AS average_score,
            COUNT(*) AS total_reviews
        FROM reviews
        WHERE wp_user_login_marker = :marker
    ");
    $stmt->execute([':marker' => $marker]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    // Default fallback if no reviews found
    if (!$result || $result['total_reviews'] == 0) {
        echo json_encode([
            "average_score" => null,
            "total_reviews" => 0
        ]);
    } else {
        echo json_encode($result);
    }

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
