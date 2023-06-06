class DetailSimpananItem {
  String tgl;
  String kodetransaksi;
  String DK;
  String kas;
  num jumlah;
  String ketTrans;

  DetailSimpananItem(
      {required this.tgl,
      required this.kodetransaksi,
      required this.DK,
      required this.kas,
      required this.jumlah,
      required this.ketTrans
  });

  factory DetailSimpananItem.fromJson(Map<String, dynamic> json){
    return DetailSimpananItem(
      tgl: json['tgl'],
      kodetransaksi: json['kodetransaksi'],
      DK: json['DK'],
      kas: json['kas'],
      jumlah: json['jumlah'],
      ketTrans: json['ketTrans']
    );
  }
}