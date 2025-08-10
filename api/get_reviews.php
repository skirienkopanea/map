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

    // Fetch reviews for the given marker
    $stmt = $pdo->prepare("
        SELECT 
            wp_user_login_reviewer AS reviewer,
            rating,
            comment,
            created_at,
            updated_at
        FROM reviews
        WHERE wp_user_login_marker = :marker
        ORDER BY created_at DESC
    ");
    $stmt->execute([':marker' => $marker]);

    $reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($reviews);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
