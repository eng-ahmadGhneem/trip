// import 'package:ar_flutter_plugin/datatypes/node_types.dart';
// import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
// import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
// import 'package:ar_flutter_plugin/models/ar_node.dart';
// import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math_64.dart';
// import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
//
// class ARTakePhotoScreen extends StatefulWidget {
//   const ARTakePhotoScreen({super.key});
//
//   @override
//   State<ARTakePhotoScreen> createState() => _ARTakePhotoScreenState();
// }
//
// class _ARTakePhotoScreenState extends State<ARTakePhotoScreen> {
//   late ARSessionManager arSessionManager;
//   late ARObjectManager arObjectManager;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ARView(
//         onARViewCreated: onARViewCreated,
//       ),
//     );
//   }
//
//   void onARViewCreated(
//       ARSessionManager sessionManager,
//       ARObjectManager objectManager,
//       ARAnchorManager anchorManager,
//       ARLocationManager locationManager,
//       ) {
//     arSessionManager = sessionManager;
//     arObjectManager = objectManager;
//
//     arSessionManager.onInitialize(
//       showFeaturePoints: false,
//       showPlanes: true,
//       handleTaps: false,
//     );
//
//     arObjectManager.onInitialize();
//
//     _addARObject();
//   }
//
//   Future<void> _addARObject() async {
//     await arObjectManager.addNode(ARNode(
//       type: NodeType.webGLB,
//       uri: "https://modelviewer.dev/shared-assets/models/Astronaut.glb",
//       scale: Vector3(0.2, 0.2, 0.2),
//       position: Vector3(0.0, 0.0, -1.0),
//       rotation: Vector4(1.0, 0.0, 0.0, 0.0),
//     ));
//   }
// }
