import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AnimatedEarthWidget extends StatelessWidget {
  final BehaviorSubject<bool> arePlanetsShownSubject;

  const AnimatedEarthWidget({Key key, this.arePlanetsShownSubject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var displayWidth = MediaQuery.of(context).size.width;
    var displayHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<bool>(
        stream: arePlanetsShownSubject,
        builder: (context, snapshot) {
          return StreamBuilder<bool>(
              stream: arePlanetsShownSubject,
              builder: (context, snapshot) {
                var isOnBottom = snapshot?.data ?? false;
                return AnimatedPositioned(
                    top: isOnBottom ? displayHeight * 0.7 : displayHeight * 0.4,
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(seconds: 2),
                    child: Image.asset(
                      "assets/earth.png",
                      fit: BoxFit.fitHeight,
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                    ));
              });
        });
  }
}
