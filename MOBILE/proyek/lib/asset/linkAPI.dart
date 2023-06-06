import 'package:flutter/material.dart';

class API {
  String base = "http://arthasamudra.ddns.net:8080/koperasi";
  String login = "/public/api/" + "login?";
  String logout = "/public/api/" + "logout";
  String dashboard = "/public/api/" + "dashboard";
  String changePass = "/public/api/" + "changepassword?";
  String simpanan = "/public/api/" + "getsimpanan";
  String pinjaman = "/public/api/" + "getpinjaman";
  String deposito = "/public/api/" + "getDeposito";
  String detailSimpanan = "/public/api/" + "getmutasisimpanan/";
  String detailPinjaman = "/public/api/" + "getmutasipinjaman/";
  String jaminan = "/public/api/" + "getJaminan/";
  String notifikasi = "/public/api/" + "getNotifikasi";
  String changeStatus = "/public/api/" + "changeStatus/";
  String getLogin() {
    return login;
  }

  String getLogout() {
    return logout;
  }

  String getDashboard() {
    return dashboard;
  }

  String getChangePass() {
    return changePass;
  }

  String getSimpanan() {
    return simpanan;
  }

  String getPinjaman() {
    return pinjaman;
  }

  String getDeposito() {
    return deposito;
  }

  String getDetailSimpanan() {
    return detailSimpanan;
  }

  String getDetailPinjaman() {
    return detailPinjaman;
  }

  String getJaminan() {
    return jaminan;
  }

  String getNotifikasi() {
    return notifikasi;
  }

  String getChangeStatus() {
    return changeStatus;
  }

  String getBase() {
    return base;
  }
}
