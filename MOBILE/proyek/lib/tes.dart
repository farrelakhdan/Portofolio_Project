import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:proyek/asset/linkAPI.dart';
import 'package:proyek/asset/numFormat.dart';
import 'package:proyek/data/item.dart';
import 'package:proyek/data/item.dart';
import 'package:proyek/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _baseUrl = API().getSimpanan();

  List<Item> list = [];

  Future getData() async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    var token = pref.getString("token").toString();
    try {
      final response = await http.get(Uri.parse(_baseUrl),
        headers: {
          'Authorization':'Bearer ' + token
        }); 
      var res = json.decode(response.body);
      if (res['status'] == 200) {
        setState(() {
          Iterable it = res['data'];
          list = it.map((e) => Item.fromJson(e)).cast<Item>().toList();
        });
        print(list);
      }else {
        print("error");
      }
    } catch (e) {
      print(e.toString()); 
    }
  }

  @override
  void initState() { 
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: [Colors.blueGrey, Colors.grey].last.withOpacity(0.5),
                    boxShadow: [
                      BoxShadow(
                        color: [Color(0xFF6448FE), Color(0xFF5FC6FF)]
                            .last
                            .withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(4, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                list[index].rekening,
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'avenir'),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: (() {}),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              elevation: MaterialStateProperty.all<double>(5.0),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text(
                              "Anggaran",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Comis Sans',
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        list[index].ketJenis,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            CurrencyFormat.convertToIdr(list[index].akhir, 0),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: (() {}),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              elevation: MaterialStateProperty.all<double>(5.0),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text(
                              "Jaminan",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Comis Sans',
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

void logout(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  /* pref.setString('token', '0'); */
  pref.remove('token');
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
}
