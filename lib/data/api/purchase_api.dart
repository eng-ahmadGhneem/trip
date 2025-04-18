// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
//
// class PurchaseApi {
//   static const _apiKey = 'goog_CMOdozvOAYdnUhqtCYKaMExRTxN';
//   static const _appleKey = 'appl_inCDwJjJKJjbJiXZwxXihtdZach';
//
//   static Future init() async {
//     await Purchases.setDebugLogsEnabled(true);
//     await Purchases.setup(
//       Platform.isIOS || Platform.isMacOS ? _appleKey : _apiKey,
//       usesStoreKit2IfAvailable: true,
//     );
//   }
//
//   static Future<List<Offering>> fetchOffers() async {
//     try {
//       final offerings = await Purchases.getOfferings();
//       debugPrint('offerings=$offerings');
//       final current = offerings.current;
//       return current == null ? [] : [current];
//     } on PlatformException catch (e) {
//       print('e in catch=$e');
//       return [];
//     }
//   }
//
//   static Future<bool> purchasePackage(Package package) async {
//     try {
//       await Purchases.purchasePackage(package);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// }
