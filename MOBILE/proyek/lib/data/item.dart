class Item {
  String rekening;
  String jenisTabungan;
  String ketJenis;
  num akhir;

  Item(
      {required this.rekening,
      required this.jenisTabungan,
      required this.ketJenis,
      required this.akhir,
  });

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      rekening: json['rekening'],
      jenisTabungan: json['jenisTabungan'],
      ketJenis: json['ketJenis'],
      akhir: json['akhir']
    );
  }
}