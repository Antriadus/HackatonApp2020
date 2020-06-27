import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AnimatedBackButtonWidget extends StatelessWidget {
  final BehaviorSubject<bool> arePlanetsShownSubject;

  const AnimatedBackButtonWidget(
      {Key key, @required this.arePlanetsShownSubject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: arePlanetsShownSubject,
        builder: (context, snapshot) {
          var isVisble = snapshot?.data ?? false;
          return GestureDetector(
            onTap: () => arePlanetsShownSubject.add(false),
            child: AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: isVisble ? 1.0 : 0.0,
              curve: Curves.fastOutSlowIn,
              child: Padding(
                padding: const EdgeInsets.only(top: 45, left: 32),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ),
          );
        });
  }
}
