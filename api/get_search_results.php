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

    // Get parameters
    $iso2 = isset($_GET['lang']) ? substr($_GET['lang'], 0, 2) : 'en';
    $category_id  = isset($_GET['category_id']) ? intval($_GET['category_id']) : 0;
    $search_term  = isset($_GET['search_term']) ? trim($_GET['search_term']) : '';

    // Prepare SQL query
    $sql = "
    SELECT 
    m.id,
    m.name,
    m.wp_user_login,
    m.address,
    m.latitude,
    m.longitude,
    m.category_id,
    m.icon,
    m.picture,
    m.language,
    m.website,
    m.email,
    m.phone,
    m.opening_hours,
    m.google_maps_url,
    dt_target.text_translation AS description,
    ct_target.text_translation AS category_name,
    rs.average_score,
    rs.total_reviews
FROM markers m
LEFT JOIN description_translations dt_target
    ON m.id = dt_target.marker_id AND dt_target.language_id = (SELECT id from languages WHERE iso2 = :iso2)
LEFT JOIN description_translations dt_all
    ON m.id = dt_all.marker_id
LEFT JOIN category_translations ct_target
    ON m.category_id = ct_target.category_id AND ct_target.language_id = (SELECT id from languages WHERE iso2 = :iso2)
LEFT JOIN category_translations ct_all
    ON m.category_id = ct_all.category_id
LEFT JOIN search_terms st 
    ON m.id = st.marker_id
LEFT JOIN search_term_translations stt_all
    ON st.id = stt_all.search_term_id
LEFT JOIN (
    SELECT wp_user_login_marker, 
           ROUND(AVG(rating), 2) AS average_score,
           COUNT(*) AS total_reviews
    FROM reviews
    GROUP BY wp_user_login_marker
) rs ON rs.wp_user_login_marker = m.wp_user_login
WHERE (
    m.name LIKE :like_term
    OR dt_all.text_translation LIKE :like_term
    OR ct_all.text_translation LIKE :like_term
    OR stt_all.text_translation LIKE :like_term
)
AND (:category_id = 0 OR m.category_id = :category_id)
GROUP BY m.id

    ";

    // Prepare and bind parameters
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':iso2', $iso2, PDO::PARAM_STR);
    $stmt->bindValue(':like_term', '%' . $search_term . '%', PDO::PARAM_STR);
    $stmt->bindValue(':category_id', $category_id, PDO::PARAM_INT);

    // Execute and fetch results
    $stmt->execute();
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Output JSON
    echo json_encode($results);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
}
