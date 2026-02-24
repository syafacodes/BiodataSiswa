import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/api.dart';
import 'siswa_form.dart';

class SiswaEdit extends StatefulWidget {
  final Siswa siswa;
  const SiswaEdit({Key? key, required this.siswa}) : super(key: key);

  @override
  State<SiswaEdit> createState() => _SiswaEditState();
}

class _SiswaEditState extends State<SiswaEdit> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nisController;
  late TextEditingController _namaController;
  late TextEditingController _tplahirController;
  late TextEditingController _tglahirController;
  late TextEditingController _kelaminController;
  late TextEditingController _agamaController;
  late TextEditingController _alamatController;

  @override
  void initState() {
    super.initState();
    _nisController = TextEditingController(text: widget.siswa.nis);
    _namaController = TextEditingController(text: widget.siswa.nama);
    _tplahirController = TextEditingController(text: widget.siswa.tplahir);
    _tglahirController = TextEditingController(text: widget.siswa.tglahir);
    _kelaminController = TextEditingController(text: widget.siswa.kelamin);
    _agamaController = TextEditingController(text: widget.siswa.agama);
    _alamatController = TextEditingController(text: widget.siswa.alamat);
  }

  Future<void> updateSiswa() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse('${Api.baseUrl}/update.php'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": widget.siswa.id,
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
            const SnackBar(content: Text('Data berhasil diupdate')),
          );
          // Pop 2 kali untuk kembali ke halaman utama (melewati halaman detail)
          Navigator.pop(context, true); 
          Navigator.pop(context, true); 
        } else {
          throw Exception('Gagal mengupdate data');
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
      appBar: AppBar(title: const Text('Edit Data Siswa')),
      body: FormSiswa(
        formKey: _formKey,
        nisController: _nisController,
        namaController: _namaController,
        tplahirController: _tplahirController,
        tglahirController: _tglahirController,
        kelaminController: _kelaminController,
        agamaController: _agamaController,
        alamatController: _alamatController,
        onSubmit: updateSiswa,
        submitText: 'UPDATE DATA',
      ),
    );
  }
}