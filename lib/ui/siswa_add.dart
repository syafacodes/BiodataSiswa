import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/api.dart';
import 'siswa_form.dart';

class SiswaAdd extends StatefulWidget {
  const SiswaAdd({Key? key}) : super(key: key);

  @override
  State<SiswaAdd> createState() => _SiswaAddState();
}

class _SiswaAddState extends State<SiswaAdd> {
  final _formKey = GlobalKey<FormState>();
  final _nisController = TextEditingController();
  final _namaController = TextEditingController();
  final _tplahirController = TextEditingController();
  final _tglahirController = TextEditingController();
  final _kelaminController = TextEditingController();
  final _agamaController = TextEditingController();
  final _alamatController = TextEditingController();

  Future<void> submitSiswa() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse('${Api.baseUrl}/create.php'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "nis": _nisController.text,
            "nama": _namaController.text,
            "tplahir": _tplahirController.text,
            "tglahir": _tglahirController.text,
            "kelamin": _kelaminController.text,
            "agama": _agamaController.text,
            "alamat": _alamatController.text,
          }),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data berhasil ditambahkan')),
          );
          Navigator.pop(context, true); // Kembali dan beri sinyal refresh
        } else {
          throw Exception('Gagal menyimpan data');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Data Siswa')),
      body: FormSiswa(
        formKey: _formKey,
        nisController: _nisController,
        namaController: _namaController,
        tplahirController: _tplahirController,
        tglahirController: _tglahirController,
        kelaminController: _kelaminController,
        agamaController: _agamaController,
        alamatController: _alamatController,
        onSubmit: submitSiswa,
        submitText: 'SIMPAN DATA',
      ),
    );
  }
}