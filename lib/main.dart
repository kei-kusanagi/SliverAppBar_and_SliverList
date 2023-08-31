import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver AppBarr Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final rnd = Random();
  final List<Color> colores = [
    Colors.purple,
    Colors.purpleAccent,
    Colors.pink,
    Colors.pinkAccent,
    Colors.red,
    Colors.redAccent,
    Colors.blue,
    Colors.blueAccent,
    Colors.black,
    Colors.yellowAccent,
    Colors.yellow,
    Colors.grey,
    Colors.blueGrey,
    Colors.green,
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
      100,
      (i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colores[rnd.nextInt(colores.length)],
          ),
          width: double.infinity,
          height: 150,
        ),
      ),
    );
    return Scaffold(
      body: Scrollbar(
        interactive: true,
        thickness: 18,
        thumbVisibility: true,
        // trackVisibility: true,
        radius: const Radius.circular(20),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: Image.network(
                'https://images4.alphacoders.com/601/thumb-1920-601048.jpg',
                fit: BoxFit.cover,
              ),
              title: const Text('Sliver appbar'),
              backgroundColor: Colors.black,
            ),
            SliverList(
              delegate: SliverChildListDelegate(items),
            )
          ],
        ),
      ),
    );
  }
}
