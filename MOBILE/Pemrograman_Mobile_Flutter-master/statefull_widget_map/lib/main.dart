import 'package:flutter/material.dart';
import 'package:statefull_widget_map/widget/Convert.dart';
import 'package:statefull_widget_map/widget/Result.dart';

import 'widget/input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  TextEditingController inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  var listItem = ["Kelvin", "Reamur"];
  List<String> listViewItem = [];

  double value = 0.0;

  RangeValues values = RangeValues(0.0, 100.0);

  //rumus
  void perhitunganSuhu() {
    setState(() {
      print(listViewItem.length);
      switch (_newValue) {
        case "Kelvin":
          {
            // statements;
            _result = _inputUser + 273;
            listViewItem.add("Kelvin : " + "$_result");
          }
          break;

        case "Reamur":
          {
            //statements;
            _result = _inputUser * 4 / 5;
            listViewItem.add("Reamur : " + "$_result");
          }
          break;
      }
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
              Text(
                "$_inputUser",
                style: TextStyle(fontSize: 25),
              ),
              Slider(
                label: _inputUser.abs().toString(),
                value: _inputUser,
                min: 0.0,
                max: 1000.0,
                onChanged: ((val) {
                  setState(() {
                    _inputUser = val;
                  });
                }),
              ),
              Container(
                child: Column(
                  children: [
                    DropdownButton<String>(
                      items: listItem.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _newValue,
                      onChanged: (changeValue) {
                        setState(() {
                          _newValue = changeValue!;
                        });
                        perhitunganSuhu();
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Result(
                      result: _result,
                    ),
                  ],
                ),
              ),
              Convert(konvertHandler: perhitunganSuhu),
              Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 25),
              ),
              Expanded(
                  child: (ListView(
                children: listViewItem.map((String value) {
                  return Container(
                    child: Text(value),
                  );
                }).toList(),
              )))
            ],
          ),
        ),
      ),
    );
  }
}
