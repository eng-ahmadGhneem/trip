import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../widget/custom_text.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    super.key,
    required this.text,
    this.onTap,
    required this.icon,
  });
  final String text;
  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: AppColor.appColor,
            width: 3,
          ),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: AppColor.appColor,
            size: 35,
          ),
          title: CustomText(
            text: text,
            fontSize: 16,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
