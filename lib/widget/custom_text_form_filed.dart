import 'package:flutter/material.dart';
import 'package:trip/core/constant/assets.dart';

import '../core/constant/color.dart';

class CustomTextForm extends StatelessWidget {
  final String? hintText;
  final IconData? iconPrefixData;
  final IconData? iconSuffixData;
  final Color? iconPrefixColor;
  final Color? iconSuffixColor;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final void Function(String)? onChanged;
  final bool readOnly;
  final bool obscuretext;
  final String? labelText;
  final void Function()? onTapPrefixIcon;
  final void Function()? onTapSuffixIcon;
  final void Function(String? newValue)? onSave;
  final bool autoFocus;
  final Color? hintColorText;
  final int? maxLines;
  final Color fillColor;
  final TextInputType? keyboardType;
  final VoidCallback? onTap; // 👈 هنا الإضافة الجديدة

  const CustomTextForm({
    super.key,
    this.hintText,
    this.iconPrefixData,
    this.iconSuffixData,
    this.mycontroller,
    this.valid,
    this.readOnly = false,
    this.obscuretext = false,
    this.labelText,
    this.onTapPrefixIcon,
    this.onTapSuffixIcon,
    this.onSave,
    this.keyboardType = TextInputType.text,
    this.iconPrefixColor,
    this.iconSuffixColor,
    this.autoFocus = false,
    this.onChanged,
    this.hintColorText,
    this.maxLines = 1,
    this.fillColor = AppColor.fillTextFormGray,
    this.onTap, // 👈 لا تنسَ تمريره هنا أيضاً
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        maxLines: maxLines,
        autofocus: autoFocus,
        cursorColor: AppColor.appColor,
        onChanged: onChanged,
        onTap: onTap, // 👈 تمرير onTap هنا
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        obscureText: obscuretext,
        validator: valid,
        keyboardType: keyboardType,
        controller: mycontroller,
        readOnly: readOnly,
        onSaved: onSave,
        decoration: InputDecoration(
          focusColor: AppColor.appColor,
          hoverColor: AppColor.appColor,
          alignLabelWithHint: true,
          filled: true,
          floatingLabelStyle: const TextStyle(
            color: AppColor.appColor,
          ),
          labelStyle: const TextStyle(
            color: AppColor.appColor,
          ),
          fillColor: fillColor,
          labelText: labelText,
          hintText: hintText,
          helperStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: Assets.fontMontserrat,
            fontSize: 15,
          ),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: Assets.fontMontserrat,
            fontSize: 13,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          suffixIcon: InkWell(
            onTap: onTapSuffixIcon,
            child: Icon(
              iconSuffixData,
              color: iconSuffixColor,
            ),
          ),
          prefixIcon: InkWell(
            onTap: onTapPrefixIcon,
            child: Icon(
              iconPrefixData,
              color: AppColor.appColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
