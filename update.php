<?php
//Update.php
header('Content-Type: application/json');
include 'konekdb.php';

$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['id'])) {
    echo json_encode(['pesan' => 'ID tidak ditemukan']);
    exit;
}

try {
    $stmt = $konekdb->prepare("UPDATE siswa SET nis = :nis, nama = :nama, tplahir = :tplahir, tglahir = :tglahir, kelamin = :kelamin, agama = :agama, alamat = :alamat WHERE id = :id");

    $stmt->bindParam(':id', $data['id']);
    $stmt->bindParam(':nis', $data['nis']);
    $stmt->bindParam(':nama', $data['nama']);
    $stmt->bindParam(':tplahir', $data['tplahir']);
    $stmt->bindParam(':tglahir', $data['tglahir']);
    $stmt->bindParam(':kelamin', $data['kelamin']);
    $stmt->bindParam(':agama', $data['agama']);
    $stmt->bindParam(':alamat', $data['alamat']);  
    $stmt->execute();

    echo json_encode(['pesan' => 'Sukses update data siswa']);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['pesan' => 'Gagal update: ' . $e->getMessage()]);
}
?>