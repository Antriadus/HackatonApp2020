import 'package:flutter/material.dart';

class ScreenSize {
  static Size _size;
  static EdgeInsets _padding;

  set setSize(Size size) => _size = size;
  set setPadding(EdgeInsets edgeInsets) => _padding = edgeInsets;

  static getWidthPercent(double percent) => _size.width * (percent / 100);
  static getHeightPerecnt(double percent) => _size.height * (percent / 100);
  static getTopPadding() => _padding.top;
  static getBottomPadding() => _padding.bottom;
}
