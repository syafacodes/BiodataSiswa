<?php
//list.php
header('Content-Type: application/json');
include 'konekdb.php';

try {
    $stmt = $konekdb->prepare("SELECT * FROM siswa ORDER BY id DESC");
    $stmt->execute();
    $siswa = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($siswa);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
?>