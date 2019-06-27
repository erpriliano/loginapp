import 'package:flutter/material.dart';
import 'package:loginapp/view/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: Colors.greenAccent,
      ),
      home: LoginPage(),
    );
  }
}

