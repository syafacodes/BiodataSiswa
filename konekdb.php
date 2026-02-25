<?php
//konekdb.php
// 1. Izinkan semua request dari Flutter Web (CORS Bypass)
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");

// 2. Tangani Preflight Request dari browser (Wajib untuk Flutter Web)
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

$host = "localhost";
$user = "root";
$pass = "";
$database = "db_biodatasiswa"; 

try {
    $konekdb = new PDO("mysql:host=$host;dbname=$database", $user, $pass);
    $konekdb->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    $konekdb->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['error' => 'Koneksi database gagal: ' . $e->getMessage()]);
    exit();
}
?>