import 'package:flutter/material.dart';

class ScaffoldDay7 extends StatelessWidget {
  const ScaffoldDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          actions: [Text("keluar")],
          centerTitle: true,

          title: Text("Scaffold BAtch 6"),
        ),
        body: Text("Nama Saya"),
      ),
    );
  }
}
