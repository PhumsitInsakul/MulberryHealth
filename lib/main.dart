import 'package:flutter/material.dart';
import 'package:mulberryhealth/screen/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mulberry Health',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home:MyHomePage(),
    );
  }
}

