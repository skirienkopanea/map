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

    // Get language_id (default to 1 if not set)
    $category_id = isset($_GET['category_id']) ? intval($_GET['category_id']) : 0;
    $iso2 = isset($_GET['lang']) ? substr($_GET['lang'], 0, 2) : 'es';

    // Prepare SQL query to fetch categories with translated names
    $stmt = $pdo->prepare("
        SELECT 
         
            c.id AS category_id,
            sc.id AS subcategory_id,
            sct.text_translation AS name,
            sc.icon_url
            
        FROM categories c
        LEFT JOIN subcategories sc
            ON sc.category_id = c.id
        
            
        LEFT JOIN subcategory_translations sct
            ON sct.subcategory_id = sc.id AND sct.language_id = (SELECT id from languages WHERE iso2 = :iso2)
        WHERE (c.id = :category_id or :category_id = 0)
        ORDER BY sc.id
        
    ");

    $stmt->execute([
        ':category_id' => $category_id,
        ':iso2' => $iso2
    ]);


    // Fetch and return results
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($results);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
