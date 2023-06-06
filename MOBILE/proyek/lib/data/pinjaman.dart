class ItemPinjaman {
  String rekening;
  String tgl;
  String jenisKredit;
  String tglJthTmp;
  num? sukuBunga;
  num? lama;
  num? plafond;
  num? lunasPokok;
  num? saldo;

  ItemPinjaman(
      {required this.rekening,
      required this.tgl,
      required this.jenisKredit,
      required this.tglJthTmp,
      required this.sukuBunga,
      required this.lama,
      required this.plafond,
      required this.lunasPokok,
      required this.saldo});

  factory ItemPinjaman.fromJson(Map<String, dynamic> json) {
    return ItemPinjaman(
        rekening: json['rekening'],
        tgl: json['tgl'],
        jenisKredit: json['jenisKredit'],
        tglJthTmp: json['tglJthTmp'],
        sukuBunga: json['sukuBunga'],
        lama: json['lama'],
        plafond: json['plafond'],
        lunasPokok: json['lunasPokok'],
        saldo: json['saldo']);
  }
}
