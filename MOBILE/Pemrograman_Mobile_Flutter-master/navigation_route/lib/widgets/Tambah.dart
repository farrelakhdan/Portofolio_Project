import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_route/models/item.dart';
import 'package:navigation_route/pages/home_page.dart';

class Tambah extends StatelessWidget {
  TextEditingController etInput_nama = TextEditingController();
  TextEditingController etInput_price = TextEditingController();
  void tambah() {
    Item list = Item(name: etInput_nama.toString(), price: 3000);
    HomePage().items.add(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Tambah"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Masukkan Nama"),
              controller: etInput_nama,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Masukkan Price"),
              controller: etInput_price,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              color: Colors.blue,
              child: TextButton(
                onPressed: () {
                  tambah();
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text(
                  "Tambah",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
