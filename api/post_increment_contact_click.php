<?php
// Database config
$host = "localhost";
$dbname = "db";
$username = "user";
$password = "********";

// Allow CORS and set JSON content type
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

try {
    // Connect to the database using PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get marker ID from query string
    $markerId = isset($_GET['id']) ? intval($_GET['id']) : 0;

    if ($markerId <= 0) {
        http_response_code(400);
        echo json_encode(["error" => "Missing or invalid marker ID."]);
        exit;
    }

    // Increment contact_clicks by 1
    $stmt = $pdo->prepare("UPDATE markers SET contact_clicks = contact_clicks + 1 WHERE id = :markerId");
    $stmt->execute([':markerId' => $markerId]);

    if ($stmt->rowCount() > 0) {
        echo json_encode(["status" => "incremented", "marker_id" => $markerId]);
    } else {
        http_response_code(404);
        echo json_encode(["error" => "Marker not found."]);
    }

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
