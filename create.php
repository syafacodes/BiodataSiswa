<?php
//create.php
header('Content-Type: application/json');
include 'konekdb.php';

$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['nis']) || !isset($data['nama']) || !isset($data['tplahir']) || !isset($data['tglahir']) || !isset($data['kelamin']) || !isset($data['agama']) || !isset($data['alamat'])) {
    echo json_encode(['error' => 'Data tidak lengkap']);
    exit;
}

try {
    $stmt = $konekdb->prepare("INSERT INTO siswa (nis, nama, tplahir, tglahir, kelamin, agama, alamat) VALUES (:nis, :nama, :tplahir, :tglahir, :kelamin, :agama, :alamat)");
    $stmt->bindParam(':nis', $data['nis']);
    $stmt->bindParam(':nama', $data['nama']);
    $stmt->bindParam(':tplahir', $data['tplahir']);
    $stmt->bindParam(':tglahir', $data['tglahir']);
    $stmt->bindParam(':kelamin', $data['kelamin']);
    $stmt->bindParam(':agama', $data['agama']);
    $stmt->bindParam(':alamat', $data['alamat']);
    $stmt->execute();

    echo json_encode(['Sukses' => 'Data Siswa Berhasil ditambahken', 'id' => $konekdb->lastInsertId()]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
?>