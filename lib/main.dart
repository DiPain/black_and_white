import 'package:flutter/material.dart';

// import 'package:black_and_white/src/hotels.dart';
import 'package:wallet_with_listbuilder/src/white.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      //swap colors here to change
      home: Whi(Colors.black,Colors.white),
      // home: Whi(Colors.white,Colors.black),
    );
  }
}
