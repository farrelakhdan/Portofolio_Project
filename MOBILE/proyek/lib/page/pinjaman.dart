import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyek/asset/linkAPI.dart';
import 'package:proyek/asset/numFormat.dart';
import 'package:proyek/data/pinjaman.dart';
import 'package:http/http.dart' as http;
import 'package:proyek/page/detailPinjaman.dart';
import 'package:proyek/page/jaminan.dart';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';

class Pinjaman extends StatefulWidget {
  const Pinjaman({super.key});

  @override
  State<Pinjaman> createState() => _PinjamanState();
}

class _PinjamanState extends State<Pinjaman> {
  final _baseUrl = API().getBase() + API().getPinjaman();

  Map data = {'jenis': "fruit"};

  List<ItemPinjaman> list = [];
  List color = [
    [Colors.pink, Colors.red],
    [Colors.yellow, Colors.orange],
    [Colors.lightBlue, Colors.blue]
  ];

  Future getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token").toString();
    try {
      final response = await http.get(Uri.parse(_baseUrl),
          headers: {'Authorization': 'Bearer ' + token});
      var res = json.decode(response.body);
      if (res['status'] == 200) {
        setState(() {
          Iterable it = res['data'];
          list = it.map((e) => ItemPinjaman.fromJson(e)).toList();
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
      body: list.isNotEmpty
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login_bg.jpg"),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: [Colors.blueGrey, Colors.grey]
                              .last
                              .withOpacity(0.5),
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
                                        color: Colors.white,
                                        fontFamily: 'avenir',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: (() {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPinjaman(
                                                    page: 1,
                                                    norek:
                                                        list[index].rekening)));
                                  }),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    elevation:
                                        MaterialStateProperty.all<double>(5.0),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  child: Text(
                                    "Angsuran",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Comis Sans',
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              DateFormat('dd-MM-yyyy').format(
                                      DateFormat('yyyy-MM-dd')
                                          .parse(list[index].tgl)) +
                                  " <--s/d--> " +
                                  DateFormat('dd-MM-yyyy').format(
                                      DateFormat('yyyy-MM-dd')
                                          .parse(list[index].tglJthTmp)),
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'avenir'),
                            ),
                            Text(
                              "Lama ---------------> " +
                                  list[index].lama.toString() +
                                  " Bulan",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'avenir'),
                            ),
                            Text(
                              "Suku Bunga -----> " +
                                  list[index].sukuBunga.toString() +
                                  " %",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'avenir'),
                            ),
                            Text(
                              "Plafond -----------> " +
                                  CurrencyFormat.convertToIdr(
                                          list[index].plafond, 0)
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'avenir'),
                            ),
                            Text(
                              "Lunas Pokok ---> " +
                                  CurrencyFormat.convertToIdr(
                                          list[index].lunasPokok, 0)
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'avenir'),
                            ),
                            list[index].saldo == null
                                ? Text(
                                    "Titipan ------------> " + "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'avenir'),
                                  )
                                : Text(
                                    "Titipan ------------> " +
                                        CurrencyFormat.convertToIdr(
                                                list[index].saldo, 0)
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'avenir'),
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  CurrencyFormat.convertToIdr(
                                      list[index].plafond! -
                                          list[index].lunasPokok!,
                                      0),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'avenir',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                                TextButton(
                                  onPressed: (() {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Jaminan(
                                                page: 1,
                                                norek: list[index].rekening)));
                                  }),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    elevation:
                                        MaterialStateProperty.all<double>(5.0),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  child: Text(
                                    "Jaminan",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Comis Sans',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login_bg.jpg"),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
              child: Center(
                child: Container(
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
                  child: Text(
                    'ANDA TIDAK MEMILIKI PINJAMAN / KREDIT',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
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
