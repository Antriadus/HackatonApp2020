import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AnimatedAppTitleWidget extends StatelessWidget {
  final BehaviorSubject<int> pageSubject;

  const AnimatedAppTitleWidget({Key key, @required this.pageSubject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var displayWidth = MediaQuery.of(context).size.width;
    var displayHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<int>(
        stream: pageSubject,
        builder: (context, snapshot) {
          var isFullSize = snapshot.data == 0;
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
