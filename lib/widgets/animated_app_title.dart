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
          var isFullSize = snapshot?.data ?? true;
          return AnimatedContainer(
            width: isFullSize ? displayWidth : displayWidth * 0.6,
            height: isFullSize ? displayHeight * 0.2 : displayHeight * 0.1,
            color: Colors.red.shade200,
            curve: Curves.fastOutSlowIn,
            duration: Duration(seconds: 5),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:
                  Text("SPACE Travel", style: TextStyle(color: Colors.black)),
            ),
          );
        });
  }
}
