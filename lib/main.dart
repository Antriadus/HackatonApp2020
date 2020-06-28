import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hack2020/pages/home.dart';
import 'package:hack2020/utils/screen_size.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void _setScreenSize(BuildContext context) {
    ScreenSize _screenSize = ScreenSize();
    _screenSize.setSize = MediaQuery.of(context).size;
    _screenSize.setPadding = MediaQuery.of(context).padding;
  }

  @override
  Widget build(BuildContext context) {
    //_setScreenSize(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kIsWeb
            ? const Color.fromARGB(255, 27, 38, 51)
            : const Color(0XFF1A222D),
      ),
      // home: SelectSpaceship(),
      home: HomePage(),
    );
  }
}
