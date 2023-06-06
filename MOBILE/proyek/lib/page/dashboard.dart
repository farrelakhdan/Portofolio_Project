import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proyek/asset/linkAPI.dart';
import 'package:proyek/data/profile.dart';
import 'package:proyek/login.dart';
import 'package:proyek/page/changePassword.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var baseUrl = API().getBase() + API().getDashboard();

  List<Profile> list = [];

  Future getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token").toString();
    try {
      final response = await http.get(Uri.parse(baseUrl),
          headers: {'Authorization': 'Bearer ' + token});
      var res = json.decode(response.body);
      if (res['status'] == 200) {
        setState(() {
          Iterable it = res['data'];
          list = it.map((e) => Profile.fromJson(e)).toList();
        });
        print(token);
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 25),
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
            return Column(children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: height * 0.43,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double innerHeight = constraints.maxHeight;
                    double innerWidth = constraints.maxWidth;
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: innerHeight * 0.72,
                            width: innerWidth,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                ),
                                FittedBox(
                                  child: Text(
                                    " " + list[index].nama + " ",
                                    style: TextStyle(
                                      color: Color.fromRGBO(39, 105, 171, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                FittedBox(
                                  child: Text(
                                    " " + list[index].alamat + " ",
                                    style: TextStyle(
                                      color: Color.fromRGBO(39, 105, 171, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                FittedBox(
                                  child: Text(
                                    " " +
                                        list[index].desa +
                                        ", " +
                                        list[index].kecamatan +
                                        ", " +
                                        list[index].kota +
                                        " ",
                                    style: TextStyle(
                                      color: Color.fromRGBO(39, 105, 171, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                FittedBox(
                                  child: Text(
                                    " " + list[index].telepon + " ",
                                    style: TextStyle(
                                      color: Color.fromRGBO(39, 105, 171, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                /* Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Bagian',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Nunito',
                                            fontSize: 25,
                                          ),
                                        ),
                                        FittedBox(
                                          child: Text(
                                            "list[index].bagian",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  39, 105, 171, 1),
                                              fontFamily: 'Nunito',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25,
                                        vertical: 8,
                                      ),
                                      child: Container(
                                        height: 50,
                                        width: 3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            'No.Anggota',
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontFamily: 'Nunito',
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                        FittedBox(
                                          child: Text(
                                            list[index].kode,
                                            style: TextStyle(
                                              color:
                                                  Color.fromRGBO(39, 105, 171, 1),
                                              fontFamily: 'Nunito',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                               */
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 110,
                          right: 20,
                          child: InkWell(
                            child: Icon(
                              AntDesign.logout,
                              color: Colors.grey[700],
                              size: 30,
                            ),
                            onTap: () {
                              logout(context);
                            },
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              child: Image.asset(
                                'assets/img/logo.png',
                                width: innerWidth * 0.40,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 110,
                          left: 20,
                          child: InkWell(
                            child: Icon(
                              AntDesign.setting,
                              color: Colors.grey[700],
                              size: 30,
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChangePassword()));
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      /* Image.asset(
                        'assets/img/logo.png',
                        width: 150,
                        fit: BoxFit.fitWidth,
                      ), */
                      SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        child: Text(
                          "KOPERASI ARTHA SAMUDRA",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        child: Text(
                          "Jl. A.Yani rt 34/05 Karangkates Sumberpucung Malang",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        child: Text(
                          "085103559300",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        children: [
                          Text(
                            "Geser Ke Kiri Untuk Melihat Data ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white60),
                          ),
                          Icon(
                            Icons.swipe_left,
                            color: Colors.white60,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]);
          }),
    );
  }
}

void logout(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  final _baseUrl = API().getBase() + API().getLogout();
  var token = pref.getString("token").toString();
  try {
    final response = await http.post(Uri.parse(_baseUrl),
        headers: {'Authorization': 'Bearer ' + token});
    var res = json.decode(response.body);
    if (res['status'] == 200) {
      pref.remove('token');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    } else {
      print("error");
    }
  } catch (e) {
    print(e.toString());
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff555555);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
