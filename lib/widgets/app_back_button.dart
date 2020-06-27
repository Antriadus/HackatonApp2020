import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.08),
                blurRadius: 15,
                offset: Offset(-5, -5),
              ),
            ],
            gradient: LinearGradient(
              colors: [
                const Color(0XFF191E26),
                const Color(0XFF353F59),
              ],
            ),
          ),
          width: 50.0,
          height: 50.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Center(
                  child: Image.asset('assets/arrow_back.png'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
