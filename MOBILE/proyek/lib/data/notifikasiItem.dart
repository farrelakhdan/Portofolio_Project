class NotifikasiItem {
  num id;
  String kode;
  String date;
  String title;
  String body;
  String status;

  NotifikasiItem({
    required this.id,
    required this.kode,
    required this.date,
    required this.title,
    required this.body,
    required this.status,
  });

  factory NotifikasiItem.fromJson(Map<String, dynamic> json) {
    return NotifikasiItem(
        id: json['id'],
        kode: json['kode'],
        date: json['tgl'],
        title: json['title'],
        body: json['body'],
        status: json['status']);
  }
}
