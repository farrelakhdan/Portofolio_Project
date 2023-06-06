import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:proyek/asset/linkAPI.dart';
import 'package:proyek/asset/numFormat.dart';
import 'package:proyek/data/detailPinjamanItem.dart';
import 'package:proyek/data/jaminan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

class Jaminan extends StatefulWidget {
  int page;
  String norek;
  Jaminan({super.key, required this.page, required this.norek});

  @override
  State<Jaminan> createState() => _JaminanState();
}

class _JaminanState extends State<Jaminan> {
  final _baseUrl = API().getBase() + API().getJaminan();

  List<ItemJaminan> list = [];
  List color = [
    [Colors.pink, Colors.red],
    [Colors.yellow, Colors.orange],
    [Colors.lightBlue, Colors.blue],
    [Colors.lightGreen, Colors.green],
    [Colors.purple, Colors.deepPurple],
    [Colors.pink, Colors.red],
    [Colors.yellow, Colors.orange],
    [Colors.lightBlue, Colors.blue],
    [Colors.lightGreen, Colors.green],
    [Colors.purple, Colors.deepPurple]
  ];

  Future getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token").toString();
    try {
      final response = await http.get(
          Uri.parse(_baseUrl + widget.norek.toString()),
          headers: {'Authorization': 'Bearer ' + token});
      var res = json.decode(response.body);
      if (res['status'] == 200) {
        setState(() {
          Iterable it = res['data'];
          list = it.map((e) => ItemJaminan.fromJson(e)).toList();
        });
        print(list.length);
      } else {
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
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Jaminan"),
        centerTitle: true,
      ),
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
                                list[index].ket.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (list[index].jenisAg != "03") ...[
                        Text(
                          "Atas Nama ---> " + list[index].atasNama.toString(),
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                        Text(
                          "Nopol --> " + list[index].nopol.toString(),
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                        Text(
                          "Merek  -----> " + list[index].merek.toString(),
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                        Text(
                          "Tahun -------> " + list[index].tahun.toString(),
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                        Text(
                          "Keterangan --> " + list[index].keterangan.toString(),
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                      ] else ...[
                        Text(
                          "Nama SHM --> " + list[index].namaSHM.toString(),
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                        Text(
                          "No Sertifikat  --> " +
                              list[index].noSertifikat.toString(),
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                        Text(
                          "Luas Tanah ---> " + list[index].luasTanah.toString(),
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                        Text(
                          "Keterangan --> " + list[index].keterangan.toString(),
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                      ]
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
      /* bottomNavigationBar: Container(
        height: 50,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Icon(
                Icons.arrow_left,
                size: 50,
              ),
              onTap: () {
                if(widget.page==1){

                }else{
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailPinjaman(page: widget.page-1, norek: widget.norek,)));
                }
              },
            ),
            Text(widget.page.toString()),
            InkWell(
              child: Icon(
                Icons.arrow_right,
                size: 50
              ),
              onTap: () {
                if(widget.page!=totalpage){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailPinjaman(page: widget.page+1, norek: widget.norek,)));
                }
              },
            )
          ],
        ),
      ),
     */
    );
  }
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
