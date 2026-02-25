import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/api.dart';
import 'siswa_edit.dart';

class SiswaDetail extends StatelessWidget {
  final Siswa siswa;
  const SiswaDetail({Key? key, required this.siswa}) : super(key: key);

  Future<void> deleteSiswa(BuildContext context) async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Yakin ingin menghapus data ini?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Hapus', style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm) {
      try {
        final response = await http.post(
          Uri.parse('${Api.baseUrl}/delete.php'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": siswa.id}),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data dihapus')));
          Navigator.pop(context, true); // Kembali dan refresh
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Siswa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('NIS: ${siswa.nis}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Divider(),
                Text('Nama: ${siswa.nama}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('TTL: ${siswa.tplahir}, ${siswa.tglahir}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Kelamin: ${siswa.kelamin}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Agama: ${siswa.agama}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Alamat: ${siswa.alamat}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SiswaEdit(siswa: siswa)),
                      ),
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => deleteSiswa(context),
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}