import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:trip/binding/initial_bindings.dart';
import 'package:trip/core/constant/routes.dart';
import 'package:trip/data/helpers/pref.dart';
import 'package:trip/routes.dart';

import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Pref.initializeHive();
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip',
      initialRoute: AppRoutes.splashScreen,
      getPages: routes,
      initialBinding:InitialBindings(),
    );
  }
}
