import 'package:flutter/material.dart';

class AppColor {
  static const Color appColor = Color(0xff3c79f5);
  static Color lightGrey = Colors.grey.shade200;
  static Color white = Colors.grey.shade200;

  static Color dark = const Color(0xdb1e1e1e);
  static const Color fillTextFormGray = Color(0xffF5F5F6);
  static Color secColor=const Color(0xfffdaf29);
  static Widget circleGradiant(double width) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
          gradient: AppColor.gradiant(),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
  static LinearGradient gradiant() {
    return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xff01E076),
          Color(0xff01E076),
          Color(0xff60E536),
          // Color(0xffF87C86),
          Color(0xffF45FB9),
          Color(0xffFEA541),
          Color(0xffDDE104),
          Color(0xffFCCE06),
        ]);
  }
}
