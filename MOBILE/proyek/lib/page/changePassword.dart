import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:proyek/asset/constant.dart';
import 'package:proyek/asset/linkAPI.dart';
import 'package:proyek/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

TextEditingController passController = TextEditingController();
TextEditingController newPassController = TextEditingController();

Future<void> changePass(
    String password, String newpassword, BuildContext context) async {
  String data = "password=" + password + "&newpassword=" + newpassword;
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = pref.getString("token").toString();
  final _baseUrl = API().getBase() + API().getChangePass();
  try {
    final response = await http.post(Uri.parse(_baseUrl + data),
        headers: {'Authorization': 'Bearer ' + token});
    var res = json.decode(response.body);
    if (res['status'] == 200) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } else {
      print('error');
    }
  } catch (e) {
    print(e);
  }
}

class _ChangePasswordState extends State<ChangePassword> {
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /* Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0), */
        Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.grey[500]!.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: TextField(
              controller: passController,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    FontAwesome.lock,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
                hintText: "Masukkan Password Lama Anda",
                hintStyle:
                    TextStyle(fontSize: 13, color: Colors.white, height: 1.5),
              ),
              obscureText: true,
              style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
              textInputAction: TextInputAction.done,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNewPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /* Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0), */
        Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.grey[500]!.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: TextField(
              controller: newPassController,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    FontAwesome.lock,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
                hintText: "Masukkan Password Baru",
                hintStyle:
                    TextStyle(fontSize: 13, color: Colors.white, height: 1.5),
              ),
              obscureText: true,
              style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
              textInputAction: TextInputAction.done,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          changePass(passController.text.toString(),
              newPassController.text.toString(), context);
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
          elevation: MaterialStateProperty.all<double>(5.0),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Text(
          'UBAH',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login_bg.jpg"),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.darken),
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Ubah Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildNewPasswordTF(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
