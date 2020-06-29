import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hack2020/pages/home.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //_setScreenSize(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder,
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
