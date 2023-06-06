import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final VoidCallback konvertHandler;

  Convert({Key? key, required this.konvertHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      color: Colors.blue,
      child: Column(
        children: [
          TextButton(
            onPressed: konvertHandler,
            child: const Text(
              "Konversi Suhu",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
