import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/color.dart';

class LoadingManager extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color color;

  const LoadingManager({
    super.key,
    required this.isLoading,
    required this.child,
    this.color = AppColor.appColor,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;
    return Center(
      child: Container(
          height: Get.height,
          width: Get.width,
          alignment: Alignment.center,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Center(
              child: CupertinoActivityIndicator(
                radius: 30,
                color: color,
              ),
            ),
          )),
    );
  }
}
