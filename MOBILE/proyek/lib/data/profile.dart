import 'dart:convert';

class Profile {
  String kode;
  String nama;
  String alamat;
  String kota;
  String kecamatan;
  String desa;
  String telepon;

  Profile(
      {required this.kode,
      required this.nama,
      required this.alamat,
      required this.kota,
      required this.kecamatan,
      required this.desa,
      required this.telepon
  });

  factory Profile.fromJson(Map<String, dynamic> json){
    return Profile(
      kode: json['kode'],
      nama: json['nama'],
      alamat: json['alamat'],
      kota: json['kota'],
      kecamatan: json['kecamatan'],
      desa: json['desa'],
      telepon: json['telepon']
    );
  }
}