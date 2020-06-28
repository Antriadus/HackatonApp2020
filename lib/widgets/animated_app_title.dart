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
          var titles = {
            0: "",
            1: "SELECT YOUR DESTINATION",
            2: "SELECT SPACESHIP",
            3: "BOOK SEAT",
            4: "CHECK OUT",
            5: "",
            6: "YOUR TICKETS",
            7: "",
            8: "",
          };
          return Column(
            children: [
              if (snapshot.data == 5)
                Container(
                    width: double.infinity,
                    child: Image.asset('assets/thank_you.png')),
              if (snapshot.data != 5)
                AnimatedContainer(
                  width: isFullSize ? displayWidth : displayWidth * 0.6,
                  height:
                      isFullSize ? displayHeight * 0.3 : displayHeight * 0.15,
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(seconds: 1),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              Container(
                height: 24,
              ),
              Text(
                titles[snapshot.data] ?? "",
                style: const TextStyle(
                  fontFamily: 'Futura',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: Color(0XFFD1E2F4),
                ),
              )
            ],
          );
        });
  }
}
