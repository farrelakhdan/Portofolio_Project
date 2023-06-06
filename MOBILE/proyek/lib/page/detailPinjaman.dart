import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:proyek/asset/linkAPI.dart';
import 'package:proyek/asset/numFormat.dart';
import 'package:proyek/data/detailPinjamanItem.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

class DetailPinjaman extends StatefulWidget {
  int page;
  String norek;
  DetailPinjaman({super.key, required this.page, required this.norek});

  @override
  State<DetailPinjaman> createState() => _DetailPinjamanState();
}

class _DetailPinjamanState extends State<DetailPinjaman> {
  final _baseUrl = API().getBase() + API().getDetailPinjaman();

  Map data = {'jenis': "fruit"};

  late int totalpage;
  List<DetailPinjamanItem> list = [];
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
          Uri.parse(_baseUrl +
              widget.norek.toString() +
              '/10/' +
              widget.page.toString()),
          headers: {'Authorization': 'Bearer ' + token});
      var res = json.decode(response.body);
      if (res['status'] == 200) {
        setState(() {
          totalpage = res['totalpage'];
          Iterable it = res['data'];
          list = it.map((e) => DetailPinjamanItem.fromJson(e)).toList();
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
        title: Text("Angsuran"),
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
                                DateFormat('dd-MM-yyyy').format(
                                    DateFormat('yyyy-MM-dd')
                                        .parse(list[index].tgl)),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ), /* 
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
                              "Angsuran",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Comis Sans',
                              ),
                            ),
                          ) */
                        ],
                      ),
                      Text(
                        "Keterangan --> " + list[index].keterangan,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                      ),
                      Text(
                        "Ags Ke  -----> " + list[index].agske.toString(),
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                      ),
                      Text(
                        "Pokok -------> " +
                            CurrencyFormat.convertToIdr(list[index].pokok, 0)
                                .toString(),
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                      ),
                      Text(
                        "Bunga -------> " +
                            CurrencyFormat.convertToIdr(list[index].bunga, 0)
                                .toString(),
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                      ),
                      Text(
                        "Denda -------> " +
                            CurrencyFormat.convertToIdr(list[index].denda, 0)
                                .toString(),
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                      ),
                      Text(
                        "Potongan --> " +
                            CurrencyFormat.convertToIdr(list[index].potongan, 0)
                                .toString(),
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                      ),
                      Text(
                        "Bank ---------> " + list[index].bank,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            CurrencyFormat.convertToIdr(list[index].total, 0),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ), /* 
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
                                fontSize: 15,
                                fontFamily: 'Comis Sans',
                              ),
                            ),
                          ) */
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
      bottomNavigationBar: Container(
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
                if (widget.page == 1) {
                } else {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => DetailPinjaman(
                            page: widget.page - 1,
                            norek: widget.norek,
                          )));
                }
              },
            ),
            Text(widget.page.toString()),
            InkWell(
              child: Icon(Icons.arrow_right, size: 50),
              onTap: () {
                if (widget.page != totalpage) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => DetailPinjaman(
                            page: widget.page + 1,
                            norek: widget.norek,
                          )));
                }
              },
            )
          ],
        ),
      ),
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
