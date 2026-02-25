# 🎓 BiodataSiswa App

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP" />
  <img src="https://img.shields.io/badge/MySQL-000000?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />
</p>

<p align="center">
  <b>Aplikasi mobile manajemen data siswa dengan implementasi Full CRUD.</b><br>
  Menghubungkan antarmuka modern Flutter dengan backend REST API PHP dan database MySQL.
</p>

---

## 📸 Galeri Aplikasi

Berikut adalah tampilan antarmuka aplikasi BiodataSiswa. Aplikasi dirancang dengan UI yang bersih untuk memudahkan navigasi pengguna.

<div align="center">
  <table>
    <tr>
      <td align="center"><b>Halaman Utama (List Data)</b></td>
      <td align="center"><b>Form Tambah Data</b></td>
      <td align="center"><b>Form Edit Data</b></td>
    </tr>
    <tr>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/433867c3-f3b4-407e-8528-9c22ca7bb63d" alt="Tampilan List Data Siswa" width="300px">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/ea674863-b439-4add-873a-1149fb6e8dbf" alt="Tampilan Form Tambah" width="300px">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/bdd5f3bb-b143-4775-be22-0eba6d3908e8" alt="Tampilan Form Edit" width="300px">
      </td>
    </tr>
  </table>
</div>

## ✨ Fitur Utama

Aplikasi ini mencakup operasi dasar pengolahan data (CRUD):

* 📖 **Read (Tampil Data):**
    * Mengambil data dari server dan menampilkannya dalam bentuk *list view*.
    * *Pull-to-refresh* untuk memperbarui data.
* ➕ **Create (Tambah Data):**
    * Form input interaktif dengan validasi sederhana.
    * Mengirim data siswa baru ke server via API.
* ✏️ **Update (Edit Data):**
    * Navigasi ke halaman detail untuk mengedit informasi siswa yang dipilih.
    * Memperbarui data yang sudah ada di database.
* 🗑️ **Delete (Hapus Data):**
    * Fitur untuk menghapus data siswa secara permanen dari database dengan konfirmasi dialog.

## 🛠️ Teknologi Stack

Project ini dibangun menggunakan kombinasi teknologi berikut:

| Kategori | Teknologi | Deskripsi |
| :--- | :--- | :--- |
| **Frontend** | ![Flutter](https://img.shields.io/badge/-Flutter-grey?logo=flutter) | Framework UI untuk membangun aplikasi mobile. |
| **Bahasa** | ![Dart](https://img.shields.io/badge/-Dart-grey?logo=dart) | Bahasa pemrograman yang digunakan oleh Flutter. |
| **Backend API** | ![PHP](https://img.shields.io/badge/-PHP-grey?logo=php) | Menangani *request* dari aplikasi dan berinteraksi dengan database. |
| **Database** | ![MySQL](https://img.shields.io/badge/-MySQL-grey?logo=mysql) | Menyimpan data biodata siswa. |
| **Komunikasi** | Package `http` | Digunakan di Flutter untuk melakukan HTTP request (GET, POST). |

---

## 🚀 Cara Menjalankan Project (Lokal)

Ikuti langkah-langkah berikut untuk menjalankan aplikasi di komputer lokal Anda.

### Langkah 1: Prasyarat (Backend Setup)

Sebelum menjalankan aplikasi Flutter, pastikan backend Anda sudah siap.

1.  Pastikan Anda telah menginstal **XAMPP** (Windows) atau **MAMP/Laragon** (Mac/Windows) untuk menjalankan server PHP dan MySQL lokal.
2.  Jalankan module **Apache** dan **MySQL** di XAMPP Anda.
3.  Buat database baru di phpMyAdmin (misal: `db_siswa`).
4.  Import file SQL yang disediakan di folder backend project ini (jika ada) ke database tersebut.
5.  Pastikan folder API PHP Anda dapat diakses melalui browser (contoh: `http://localhost/api_biodata/`).

### Langkah 2: Setup Frontend (Flutter)

1.  **Clone Repository:**
    Buka terminal/CMD, lalu kloning repositori ini:
    ```bash
    git clone [https://github.com/syafacodes/BiodataSiswa.git](https://github.com/syafacodes/BiodataSiswa.git)
    ```

2.  **Masuk ke Direktori Project:**
    ```bash
    cd BiodataSiswa
    ```

3.  **Install Dependencies:**
    Unduh semua package yang dibutuhkan oleh Flutter:
    ```bash
    flutter pub get
    ```

### Langkah 3: Konfigurasi Koneksi API

Ini adalah langkah krusial. Emulator Android tidak bisa mengakses `localhost` komputer secara langsung.

1.  Buka file konfigurasi API di source code Flutter Anda (biasanya di `lib/network/api.dart` atau sejenisnya).
2.  Ubah `BASE URL` atau endpoint API Anda.
    * **Jika menggunakan Emulator Android bawaan:** Gunakan IP `10.0.2.2`.
        ```dart
        // Contoh
        static const String baseUrl = "[http://10.0.2.2/folder_api_php_anda/](http://10.0.2.2/folder_api_php_anda/)";
        ```
    * **Jika menggunakan HP fisik (USB Debugging):** Gunakan alamat IP lokal komputer Anda (cek dengan `ipconfig` di CMD, misal `192.168.1.x`). pastikan HP dan Laptop di jaringan Wi-Fi yang sama.

### Langkah 4: Jalankan Aplikasi

Pastikan emulator sudah berjalan atau HP fisik sudah terhubung, lalu jalankan perintah:

```bash
flutter run
