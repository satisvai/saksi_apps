class UserModel {
  String? nama;
  String? noTelefon;
  String? kabKota;
  String? kecamatan;
  String? kelurahanDesa;
  int? noTPS;
  bool? absen;

  UserModel({
    this.nama,
    this.noTelefon,
    this.kabKota,
    this.kecamatan,
    this.kelurahanDesa,
    this.noTPS,
    this.absen,
  });

  // Mengubah objek dart menjadi objek firebase
  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'noTelefon': noTelefon,
      'kabKota': kabKota,
      'kecamatan': kecamatan,
      'kelurahanDesa': kelurahanDesa,
      'noTPS': noTPS,
      'absen': absen ?? false,
    };
  }

  // Mengubah objek firebase menjadi objek dart
  UserModel.fromMap(Map<String, dynamic> map) {
    nama = map['nama'];
    noTelefon = map['noTelefon'];
    kabKota = map['kabKota'];
    kecamatan = map['kecamatan'];
    kelurahanDesa = map['kelurahanDesa'];
    noTPS = map['noTPS'];
    absen = map['absen'] ?? false;
  }
}
