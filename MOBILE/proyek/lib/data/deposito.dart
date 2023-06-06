import 'dart:convert';

class ItemDeposito {
  String? rekening;
  String? tgl;
  String? jenisDeposito;
  String? ketJenis;
  num? nominal;
  num? bunga;
  String? glnDeposito;
  String? jthTmp;
  String? nmrBilyet;

  ItemDeposito({
    required this.rekening,
    required this.tgl,
    required this.jenisDeposito,
    required this.ketJenis,
    required this.nominal,
    required this.bunga,
    required this.glnDeposito,
    required this.jthTmp,
    required this.nmrBilyet,
  });

  factory ItemDeposito.fromJson(Map<String, dynamic> json) {
    return ItemDeposito(
        rekening: json['rekening'],
        tgl: json['tgl'],
        jenisDeposito: json['jenisDeposito'],
        ketJenis: json['ketJenis'],
        nominal: json['nominal'],
        bunga: json['bunga'],
        glnDeposito: json['glnDeposito'],
        jthTmp: json['jthTmp'],
        nmrBilyet: json['nmrBilyet']);
  }
}
