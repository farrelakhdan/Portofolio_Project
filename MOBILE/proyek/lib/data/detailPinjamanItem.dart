class DetailPinjamanItem {
  String tgl;
  String keterangan;
  num agske;
  num pokok;
  num bunga;
  num total;
  num denda;
  num potongan;
  String statusBayar;
  String bank;

  DetailPinjamanItem(
      {required this.tgl,
      required this.keterangan,
      required this.agske,
      required this.pokok,
      required this.bunga,
      required this.total,
      required this.denda,
      required this.potongan,
      required this.statusBayar,
      required this.bank
  });

  factory DetailPinjamanItem.fromJson(Map<String, dynamic> json){
    return DetailPinjamanItem(
      tgl: json['tgl'],
      keterangan: json['keterangan'],
      agske: json['Agske'],
      pokok: json['pokok'],
      bunga: json['bunga'],
      total: json['total'],
      denda: json['denda'],
      potongan: json['potongan'],
      statusBayar: json['statusBayar'],
      bank: json['bank']
    );
  }
}