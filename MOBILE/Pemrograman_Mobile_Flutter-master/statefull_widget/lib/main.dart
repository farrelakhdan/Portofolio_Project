import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variabel berubah
  double _inputUser = 0;
  double _kelvin = 0;
  //tambahkan variabel lain yang dibutuhkan
  double _reamor = 0;
  TextEditingController inputUser = TextEditingController();
  //rumus
  rumus() {
    setState(() {
      _inputUser = double.parse(inputUser.text);
      _reamor = 4 / 5 * _inputUser;
      _kelvin = _inputUser + 273;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: inputUser,
                decoration: InputDecoration(
                  hintText: "Masukkan Suhu Dalam Celcius",
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                    return "Hanya memasukkan angka";
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        const Text("Suhu Dalam Kelvin"),
                        Text(
                          "$_kelvin",
                          style: TextStyle(fontSize: 40),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        const Text("Suhu Dalam Reamor"),
                        Text(
                          '$_reamor',
                          style: TextStyle(fontSize: 40),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 30,
                margin: EdgeInsets.all(10),
                color: Colors.blue,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: rumus,
                      child: const Text(
                        "Konversi Suhu",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
