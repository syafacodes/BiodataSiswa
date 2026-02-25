<?php
//detail.php
header('Content-Type: application/json');
include 'konekdb.php';

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

try {
    $stmt = $konekdb->prepare("SELECT * FROM siswa WHERE id = :id");
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();
    $siswa = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($siswa) {
        echo json_encode($siswa);
    } else {
        http_response_code(404);
        echo json_encode(['error' => 'Data Siswa tidak ditemukan']);
    }
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
?>