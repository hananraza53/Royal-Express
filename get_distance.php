<?php
session_start();
include 'server/inc/connection.php'; // ✅ correct relative path

if (isset($_POST['send_location'], $_POST['end_location'], $_POST['weight'])) {
    $send_location = intval($_POST['send_location']);
    $end_location = intval($_POST['end_location']);
    $weight = floatval($_POST['weight']); // ✅ Get weight from form

    // 1️⃣ Fetch distance_km from price_table
    $query = "SELECT distance_km 
              FROM price_table 
              WHERE start_area = '$send_location' 
                AND end_area = '$end_location' 
                AND is_deleted = 0 
              LIMIT 1";
    $result = mysqli_query($con, $query);

    if ($row = mysqli_fetch_assoc($result)) {
        $distance_km = isset($row['distance_km']) ? floatval($row['distance_km']) : 0;

        // 2️⃣ Calculate KM price
        $km_price = $distance_km * 5;

        // 3️⃣ Calculate weight price (150 + kg * 100)
        $weight_price = 150 + ($weight * 100);

        // 4️⃣ Combine
        $total_price = $km_price + $weight_price;

        // 5️⃣ Return both distance and total in JSON
        echo json_encode([
            "distance_km" => $distance_km,
            "total_price" => $total_price
        ]);
    } else {
        echo json_encode([
            "distance_km" => 0,
            "total_price" => 0
        ]);
    }
} else {
    echo json_encode([
        "distance_km" => 0,
        "total_price" => 0
    ]);
}
?>
