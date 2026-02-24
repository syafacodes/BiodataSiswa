import 'package:flutter/material.dart';
import 'ui/siswa_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Biodata Siswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 2,
          centerTitle: true,
        ),
      ),
      home: const SiswaPage(),
    );
  }
}