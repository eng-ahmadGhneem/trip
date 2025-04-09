import 'package:flutter/material.dart';


class CircleButtonWidget extends StatelessWidget {
   CircleButtonWidget({super.key,required this.height,required this.width,required this.icon});
  IconData icon;
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 3),
      ),
      child: Center(
        child: Icon(icon, color: Colors.blue, size: 28),
      ),
    );
  }
}
