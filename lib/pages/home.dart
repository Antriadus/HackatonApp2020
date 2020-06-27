import 'package:flutter/material.dart';
import 'package:hack2020/widgets/animated_app_title.dart';
import 'package:hack2020/widgets/animated_back_button.dart';
import 'package:hack2020/widgets/animated_earth.dart';
import 'package:hack2020/widgets/fab.dart';
import 'package:rxdart/subjects.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BehaviorSubject<bool> arePlanetsShownSubject =
      BehaviorSubject<bool>.seeded(false);

  @override
  void dispose() {
    arePlanetsShownSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomFab(
        onPressed: () => arePlanetsShownSubject.add(true),
        text: "START YOUR TRAVEL",
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedAppTitleWidget(
                  arePlanetsShownSubject: arePlanetsShownSubject),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: AnimatedBackButtonWidget(
                  arePlanetsShownSubject: arePlanetsShownSubject,
                )),
            AnimatedEarthWidget(arePlanetsShownSubject: arePlanetsShownSubject),
          ],
        ),
      ),
    );
  }
}
