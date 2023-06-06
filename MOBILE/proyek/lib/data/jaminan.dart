class ItemJaminan {
  String? jenisAg;
  String? atasNama;
  String? nopol;
  String? merek;
  String? tahun;
  String? keterangan;
  String? namaSHM;
  String? noSertifikat;
  String? luasTanah;
  String? ket;

  ItemJaminan(
      {required this.jenisAg,
      required this.atasNama,
      required this.nopol,
      required this.merek,
      required this.tahun,
      required this.keterangan,
      required this.namaSHM,
      required this.noSertifikat,
      required this.luasTanah,
      required this.ket
  });

  factory ItemJaminan.fromJson(Map<String, dynamic> json){
    return ItemJaminan(
      jenisAg: json['jenisAg'],
      atasNama: json['atasNama'],
      nopol: json['nopol'],
      merek: json['merek'],
      tahun: json['tahun'],
      keterangan: json['keterangan'],
      namaSHM: json['namaSHM'],
      noSertifikat: json['noSertifikat'],
      luasTanah: json['luasTanah'],
      ket: json['ket']
    );
  }
}