import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('BERITA TERBARU'),
                const Text('PERTANDINGAN HARI INI')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2)),
            child: Column(
              children: [
                Image.network(
                    'https://akcdn.detik.net.id/community/media/visual/2022/02/24/piala-dunia-2022_169.jpeg?w=700&q=90'),
                Container(
                  padding: EdgeInsets.all(10),
                  child: const Text(
                    'Putin Semakin Botak',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.purpleAccent,
                  padding: EdgeInsets.all(10),
                  child: const Text('Transfer'),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://asset.kompas.com/crops/qTOMAABXhyE9PCaUXNu9dWFL4Us=/337x30:1261x646/750x500/data/photo/2022/09/22/632c5b3155997.jpg',
                      width: 150,
                      height: 100,
                    ),
                    Container(
                      width: 150,
                      height: 100,
                      alignment: Alignment.center,
                      child: const Text(
                        'Putin: Tak Masuk Akal Bagi Kami Pakai Senjata Nuklir di Ukraina',
                        style: TextStyle(),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1)),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: const Text('Moskow, Oktober 28, 2022'),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://asset.kompas.com/crops/qTOMAABXhyE9PCaUXNu9dWFL4Us=/337x30:1261x646/750x500/data/photo/2022/09/22/632c5b3155997.jpg',
                      width: 150,
                      height: 100,
                    ),
                    Container(
                      width: 150,
                      height: 100,
                      alignment: Alignment.center,
                      child: const Text(
                        'Putin: Tak Masuk Akal Bagi Kami Pakai Senjata Nuklir di Ukraina',
                        style: TextStyle(),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1)),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: const Text('Moskow, Oktober 28, 2022'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
