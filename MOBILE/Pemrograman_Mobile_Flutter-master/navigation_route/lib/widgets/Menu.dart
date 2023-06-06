import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Menu"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text(
                    "Lihat Data",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tambah');
                  },
                  child: const Text(
                    "Tambah Data",
                    style: TextStyle(
                      color: Colors.black,
                    ),
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
