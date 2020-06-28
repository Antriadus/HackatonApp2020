import 'package:flutter/material.dart';

class AppTile extends StatelessWidget {
  const AppTile({
    @required this.child,
    this.onTap,
  }) : assert(child != null);

  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: 343,
        height: 83,
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.white.withOpacity(0.08),
          //     offset: Offset(-8, -10),
          //     blurRadius: 35,
          //   ),
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.32),
          //     offset: Offset(10, 10),
          //     blurRadius: 35,
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(17)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0XFF2D384C),
              const Color(0XFF1A222D),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
