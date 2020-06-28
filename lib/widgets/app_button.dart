import 'package:flutter/material.dart';

enum AppButtonColor {
  Color,
  Mono,
}

class AppButton extends StatelessWidget {
  const AppButton(
    this.text, {
    this.appButtonColor = AppButtonColor.Color,
    @required this.onTap,
  }) : assert(text != null);

  final String text;
  final AppButtonColor appButtonColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      //to avoid full width spread on web
      width: 343.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        boxShadow: [
          appButtonColor == AppButtonColor.Color
              ? BoxShadow(
                  color: const Color(0XFFEE0979).withOpacity(0.8),
                  offset: Offset.zero,
                  blurRadius: 75.0,
                )
              : BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  offset: Offset(-6, -6),
                  blurRadius: 15.0,
                )
        ],
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: appButtonColor == AppButtonColor.Color
                ? [
                    const Color(0XFFF63840),
                    const Color(0XFFEE1679),
                  ]
                : [
                    const Color(0XFF333F5B),
                    const Color(0XFF181E27),
                  ]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
