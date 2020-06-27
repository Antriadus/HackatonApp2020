import 'package:flutter/material.dart';
import 'package:hack2020/pages/home.dart';
import 'package:hack2020/pages/select_spaceship.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0XFF1A222D)),
      home: HomePage(),
    );
  }
}
