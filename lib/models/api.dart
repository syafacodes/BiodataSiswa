class Api {
  // URL telah diperbaiki sesuai dengan nama folder di htdocs
  static const String baseUrl = "http://localhost/BiodataSiswa"; 
}

class Siswa {
  final int? id;
  final String nis;
  final String nama;
  final String tplahir;
  final String tglahir;
  final String kelamin;
  final String agama;
  final String alamat;

  Siswa({
    this.id,
    required this.nis,
    required this.nama,
    required this.tplahir,
    required this.tglahir,
    required this.kelamin,
    required this.agama,
    required this.alamat,
  });

  factory Siswa.fromJson(Map<String, dynamic> json) {
    return Siswa(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      nis: json['nis'].toString(),
      nama: json['nama'].toString(),
      tplahir: json['tplahir'].toString(),
      tglahir: json['tglahir'].toString(),
      kelamin: json['kelamin'].toString(),
      agama: json['agama'].toString(),
      alamat: json['alamat'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nis': nis,
      'nama': nama,
      'tplahir': tplahir,
      'tglahir': tglahir,
      'kelamin': kelamin,
      'agama': agama,
      'alamat': alamat,
    };
  }
}