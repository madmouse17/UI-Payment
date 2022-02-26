import 'package:flutter/material.dart';
import 'package:ui_payment/bottomMenu.dart';
import 'package:ui_payment/getStarted.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color = const {
  50: Color.fromRGBO(120, 91, 200, .1),
  100: Color.fromRGBO(120, 91, 200, .2),
  200: Color.fromRGBO(120, 91, 200, .3),
  300: Color.fromRGBO(120, 91, 200, .4),
  400: Color.fromRGBO(120, 91, 200, .5),
  500: Color.fromRGBO(120, 91, 200, .6),
  600: Color.fromRGBO(120, 91, 200, .7),
  700: Color.fromRGBO(120, 91, 200, .8),
  800: Color.fromRGBO(120, 91, 200, .9),
  900: Color.fromRGBO(120, 91, 200, 1),
};
MaterialColor myColor = MaterialColor(0xFF880E4F, color);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Payment',
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home: const getStarted(),
    );
  }
}
