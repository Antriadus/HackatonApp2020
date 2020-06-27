import 'package:flutter/material.dart';
import 'package:hack2020/widgets/animated_app_title.dart';
import 'package:rxdart/subjects.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BehaviorSubject<bool> arePlanetsShownSubject =
      BehaviorSubject<bool>.seeded(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            arePlanetsShownSubject.add(!arePlanetsShownSubject.value);
          });
        },
      ),
      body: Column(
        children: [
          Center(
            child: AnimatedAppTitleWidget(
                arePlanetsShownSubject: arePlanetsShownSubject),
          ),
        ],
      ),
    );
  }
}
