import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyek/asset/linkAPI.dart';
import 'package:proyek/asset/notification_service.dart';
import 'package:proyek/data/notifikasiItem.dart';
import 'package:proyek/home.dart';
import 'package:proyek/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:cron/cron.dart';

void cekNotif() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = pref.getString('token').toString();
  var baseUrl = API().getBase() + API().getNotifikasi();
  try {
    final response = await http
        .get(Uri.parse(baseUrl), headers: {'Authorization': 'Bearer ' + token});
    var res = json.decode(response.body);
    if (res['status'] == 200) {
      pref.setString("token", token);
      Iterable it = res['data'];
      List<NotifikasiItem> list = [];
      list = it.map((e) => NotifikasiItem.fromJson(e)).toList();
      List<String>? tes = pref.getStringList('notif');
      List<String> listKode = [];

      pref.setStringList("notif", listKode);
    } else {
      print('error');
    }
  } catch (e) {
    print(e);
  }
  return;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cron = Cron();
  //cek api notif
  cron.schedule(Schedule.parse('* * 10,15 * *'), () async {
    print('every three minutes');
  });
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = pref.getString('token').toString();
  var baseUrl = API().getBase() + API().getNotifikasi();
  var baseUrlc = API().getBase() + API().getChangeStatus();
  try {
    final response = await http
        .get(Uri.parse(baseUrl), headers: {'Authorization': 'Bearer $token'});
    var res = json.decode(response.body);
    if (res['status'] == 200) {
      Iterable it = res['data'];
      List<NotifikasiItem> list = [];
      list = it.map((e) => NotifikasiItem.fromJson(e)).toList();
      /* NotificationService().initializeNotification();
      DateTime date = DateFormat('yyyy/MM/dd').parse("2023/2/9"); */

      for (var i = 0; i < list.length; i++) {
        if (list[i].status == "enable") {
          NotificationService().showNotification(1, list[i].title, list[i].body,
              DateFormat('yyyy-MM-dd hh:mm:ss').parse(list[i].date));
          final responses = await http.get(
              Uri.parse(baseUrlc + list[i].id.toString()),
              headers: {'Authorization': 'Bearer $token'});
          var resp = json.decode(responses.body);
          if (resp['status'] == 200) {
            print("object");
          }
        }
      }
    } else {
      print('error');
    }
  } catch (e) {
    print(e);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token').toString();
    var baseUrl = API().getBase() + API().getDashboard();
    try {
      final response = await http
          .get(Uri.parse(baseUrl), headers: {'Authorization': 'Bearer $token'});
      var res = json.decode(response.body);
      if (res['status'] == 200) {
        setState(() {
          isLoggedIn = true;
        });
      } else {
        print('error');
        setState(() {
          isLoggedIn = false;
        });
      }
    } catch (e) {
      print(e);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: !isLoggedIn ? LoginScreen() : Home(),
    );
  }
}
