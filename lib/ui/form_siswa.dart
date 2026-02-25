import 'package:flutter/material.dart';

class FormSiswa extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nisController;
  final TextEditingController namaController;
  final TextEditingController tplahirController;
  final TextEditingController tglahirController;
  final TextEditingController kelaminController;
  final TextEditingController agamaController;
  final TextEditingController alamatController;
  final VoidCallback onSubmit;
  final String submitText;

  const FormSiswa({
    Key? key,
    required this.formKey,
    required this.nisController,
    required this.namaController,
    required this.tplahirController,
    required this.tglahirController,
    required this.kelaminController,
    required this.agamaController,
    required this.alamatController,
    required this.onSubmit,
    required this.submitText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextFormField(
            controller: nisController,
            decoration: const InputDecoration(labelText: 'NIS', border: OutlineInputBorder()),
            validator: (value) => value!.isEmpty ? 'NIS tidak boleh kosong' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: namaController,
            decoration: const InputDecoration(labelText: 'Nama Lengkap', border: OutlineInputBorder()),
            validator: (value) => value!.isEmpty ? 'Nama tidak boleh kosong' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: tplahirController,
            decoration: const InputDecoration(labelText: 'Tempat Lahir', border: OutlineInputBorder()),
            validator: (value) => value!.isEmpty ? 'Tempat Lahir tidak boleh kosong' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: tglahirController,
            decoration: const InputDecoration(labelText: 'Tanggal Lahir (YYYY-MM-DD)', border: OutlineInputBorder()),
            validator: (value) => value!.isEmpty ? 'Tanggal Lahir tidak boleh kosong' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: kelaminController,
            decoration: const InputDecoration(labelText: 'Jenis Kelamin (L/P)', border: OutlineInputBorder()),
            validator: (value) => value!.isEmpty ? 'Jenis Kelamin tidak boleh kosong' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: agamaController,
            decoration: const InputDecoration(labelText: 'Agama', border: OutlineInputBorder()),
            validator: (value) => value!.isEmpty ? 'Agama tidak boleh kosong' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: alamatController,
            maxLines: 3,
            decoration: const InputDecoration(labelText: 'Alamat', border: OutlineInputBorder()),
            validator: (value) => value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(submitText, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}