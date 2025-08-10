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

    // Get parameters (with defaults)
    $category_id = isset($_GET['category_id']) ? intval($_GET['category_id']) : 0;
    $iso2 = isset($_GET['lang']) ? substr($_GET['lang'], 0, 2) : 'es';

    // Prepare SQL query
    $stmt = $pdo->prepare("
    SELECT 
    m.id,
    m.name,
    m.wp_user_login,
    m.address,
    m.latitude,
    m.longitude,
    m.subcategory_id,
    c.id AS category_id,
    c.name as category_slug,
    m.icon,
    m.picture,
    m.language,
    m.website,
    m.email,
    m.phone,
    m.opening_hours,
    m.google_maps_url,
    dt.text_translation AS description,
    rs.average_score,
    rs.total_reviews
FROM markers m
LEFT JOIN description_translations dt 
    ON m.id = dt.marker_id AND dt.language_id = (SELECT id from languages WHERE iso2 = :iso2)
LEFT JOIN subcategories sc 
    ON m.subcategory_id = sc.id
LEFT JOIN categories c
    ON c.id = sc.category_id
LEFT JOIN (
    SELECT wp_user_login_marker, ROUND(AVG(rating), 2) AS average_score,
            COUNT(*) AS total_reviews
    FROM reviews
    GROUP BY wp_user_login_marker
) rs ON rs.wp_user_login_marker = m.wp_user_login
WHERE (c.id = :category_id OR :category_id = 0)

");


    $stmt->execute([
        ':category_id' => $category_id,
        ':iso2' => $iso2
    ]);

    // Fetch results
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Output JSON
    echo json_encode($results);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
