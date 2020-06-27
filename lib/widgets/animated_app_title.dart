import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AnimatedAppTitleWidget extends StatelessWidget {
  final BehaviorSubject<bool> arePlanetsShownSubject;

  const AnimatedAppTitleWidget({Key key, @required this.arePlanetsShownSubject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var displayWidth = MediaQuery.of(context).size.width;
    var displayHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<bool>(
        stream: arePlanetsShownSubject,
        builder: (context, snapshot) {
          var isFullSize = !(snapshot?.data ?? false);
          return AnimatedContainer(
            width: isFullSize ? displayWidth : displayWidth * 0.6,
            height: isFullSize ? displayHeight * 0.3 : displayHeight * 0.15,
            curve: Curves.fastOutSlowIn,
            duration: Duration(seconds: 1),
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
            ),
          );
        });
  }
}
