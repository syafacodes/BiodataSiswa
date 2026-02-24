import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/api.dart';
import 'siswa_add.dart';
import 'siswa_detail.dart';

class SiswaPage extends StatefulWidget {
  const SiswaPage({Key? key}) : super(key: key);

  @override
  State<SiswaPage> createState() => _SiswaPageState();
}

class _SiswaPageState extends State<SiswaPage> {
  List<Siswa> listSiswa = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    try {
      final response = await http.get(Uri.parse('${Api.baseUrl}/list.php'));
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        setState(() {
          listSiswa = data.map((json) => Siswa.fromJson(json)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Gagal load data');
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Biodata Siswa'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: fetchData),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : listSiswa.isEmpty
              ? const Center(child: Text('Belum ada data siswa'))
              : ListView.builder(
                  itemCount: listSiswa.length,
                  itemBuilder: (context, index) {
                    final siswa = listSiswa[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(child: Text(siswa.nama[0].toUpperCase())),
                        title: Text(siswa.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('NIS: ${siswa.nis} | ${siswa.alamat}'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SiswaDetail(siswa: siswa)),
                          );
                          // Jika kembali dari detail/edit bawa nilai true, refresh data
                          if (result == true) fetchData();
                        },
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SiswaAdd()),
          );
          if (result == true) fetchData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}