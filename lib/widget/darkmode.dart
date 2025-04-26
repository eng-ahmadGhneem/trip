import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class DarkMode extends StatelessWidget {
  const DarkMode({super.key});
  static String keyDarkMode ='key-dark-mode';

  @override
  Widget build(BuildContext context) {


    return  SwitchSettingsTile(
      title:  'الوضع المظلم',
      settingKey: keyDarkMode,
      leading: const Icon(
        Icons.dark_mode,
        color: Color(0xFF642ef3),
      ),
      onChange: (_) {},
    );
  }

}
