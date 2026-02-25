<?php
//delete.php
header('Content-Type: application/json');
include 'konekdb.php';

$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['id'])) {
    echo json_encode(['pesan' => 'Butuh ID untuk menghapus']);
    exit;
}

try {
    $stmt = $konekdb->prepare("DELETE FROM siswa WHERE id = :id");
    $stmt->bindParam(':id', $data['id']);
    $stmt->execute();
    
    echo json_encode(['pesan' => 'Sukses hapus data siswa']);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['pesan' => 'Gagal hapus: ' . $e->getMessage()]);
}
?>