import 'package:flutter/material.dart';

class BottomFab extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const BottomFab({
    @required this.onPressed,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var displayWidth = MediaQuery.of(context).size.width;
    var displayHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => onPressed?.call(),
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.pink,
            borderRadius:
                new BorderRadius.all(const Radius.circular(54 / 2.0))),
        width: displayWidth - 48,
        height: 54,
        child: Center(child: Text(text ?? "")),
      ),
    );
  }
}
