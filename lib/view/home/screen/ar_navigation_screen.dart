// import 'package:flutter/material.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:vector_math/vector_math_64.dart' show Vector3;
//
//
// class ArNavigationScreen extends StatefulWidget {
//   final double destinationLatitude;
//   final double destinationLongitude;
//
//   const ArNavigationScreen({
//     Key? key,
//     required this.destinationLatitude,
//     required this.destinationLongitude,
//   }) : super(key: key);
//
//   @override
//   _ArNavigationScreenState createState() => _ArNavigationScreenState();
// }
//
// class _ArNavigationScreenState extends State<ArNavigationScreen> {
//   late ArCoreController arCoreController;
//   late Position currentPosition;
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   Future<void> _getCurrentLocation() async {
//     currentPosition = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {});
//   }
//
//   void _onArCoreViewCreated(ArCoreController controller) {
//     arCoreController = controller;
//     _addDestinationMarker();
//   }
//
//   void _addDestinationMarker() {
//     final distance = Geolocator.distanceBetween(
//       currentPosition.latitude,
//       currentPosition.longitude,
//       widget.destinationLatitude,
//       widget.destinationLongitude,
//     );
//
//     final double z = -distance / 10;
//
//     final node = ArCoreNode(
//       shape: ArCoreSphere(
//         materials: [
//           ArCoreMaterial(color: Colors.blue),
//         ],
//         radius: 0.2,
//       ),
//       position: Vector3(0, 0, z),
//     );
//
//     arCoreController.addArCoreNode(node);
//   }
//
//   @override
//   void dispose() {
//     arCoreController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: currentPosition == null
//           ? const Center(child: CircularProgressIndicator())
//           : ArCoreView(
//         onArCoreViewCreated: _onArCoreViewCreated,
//       ),
//     );
//   }
// }
