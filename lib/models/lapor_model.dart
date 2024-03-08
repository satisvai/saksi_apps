class LaporModel {
  String kabKota;
  String kecamatan;
  String kelurahanDesa;
  int noTps;

  int suaraPaslon1;
  int suaraPaslon2;
  int suaraPaslon3;

  String? imageCHasil;

  LaporModel({
    required this.kabKota,
    required this.kecamatan,
    required this.kelurahanDesa,
    required this.noTps,
    this.suaraPaslon1 = 0,
    this.suaraPaslon2 = 0,
    this.suaraPaslon3 = 0,
    this.imageCHasil,
  });

  Map<String, dynamic> toMap() {
    return {
      'kabKota': kabKota,
      'kecamatan': kecamatan,
      'kelurahanDesa': kelurahanDesa,
      'noTps': noTps,
      'suaraPaslon1': suaraPaslon1,
      'suaraPaslon2': suaraPaslon2,
      'suaraPaslon3': suaraPaslon3,
      'imageCHasil': imageCHasil,
    };
  }
}
