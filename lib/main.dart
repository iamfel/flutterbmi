import 'package:bodymassindex/home.dart';
import 'package:flutter/material.dart';
import 'result_page.dart';

void main() => runApp(new MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0A0E21),
        accentColor: Colors.green,
        scaffoldBackgroundColor: Color(0xff0A0E21),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
        ),
      ),
//      home: BodyMassIndex(),
      initialRoute: '/',
      routes: {
        '/': (context) => BodyMassIndex(),
//        '/result': (context) => Result(),
      },
    ));
