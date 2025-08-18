<?php
session_start();
include 'server/inc/connection.php';

header('Content-Type: application/json');

if (isset($_POST['weight'], $_POST['send_location'], $_POST['end_location'])) {
    $weight = floatval($_POST['weight']);
    $send_location = intval($_POST['send_location']);
    $end_location = intval($_POST['end_location']);

    // Fetch price per kg and distance from DB
    $query = "SELECT price, distance_km FROM price_table WHERE start_area = '$send_location' AND end_area = '$end_location' AND is_deleted = 0 LIMIT 1";
    $result = mysqli_query($con, $query);

    if ($row = mysqli_fetch_assoc($result)) {
        $price_per_kg = floatval($row['price']);      // price per kg for route
        $distance_km = floatval($row['distance_km']);
        $price_per_km = 5;                             // fixed price per km

        // Calculate total price = (price per kg * weight) + (price per km * distance)
        $total_price = ($price_per_kg * $weight) + ($price_per_km * $distance_km);

        echo json_encode([
            'price_per_kg' => $price_per_kg,
            'price_per_km' => $price_per_km,
            'distance_km' => $distance_km,
            'total_price' => $total_price
        ]);
    } else {
        echo json_encode([
            'price_per_kg' => 0,
            'price_per_km' => 0,
            'distance_km' => 0,
            'total_price' => 0
        ]);
    }
} else {
    echo json_encode([
        'price_per_kg' => 0,
        'price_per_km' => 0,
        'distance_km' => 0,
        'total_price' => 0
    ]);
}
?>
