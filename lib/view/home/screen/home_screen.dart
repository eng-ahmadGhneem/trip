import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip/core/constant/color.dart';
import '../../../core/constant/const_data.dart';
import '../../../core/constant/routes.dart';
import '../controller/home_controller.dart';


class ARMapScreen extends StatelessWidget {
  const ARMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;

    return Scaffold(
      backgroundColor: AppColor.dark,
      body: Stack(
        children: [
          GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              if (controller.currentLocation == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return GoogleMap(
                zoomControlsEnabled: false,
                onMapCreated: (controller) {
                  mapController = controller;
                  mapController.setMapStyle(ConstData.darkMapStyle);
                },
                initialCameraPosition: CameraPosition(
                  target: controller.currentLocation!,
                  zoom: 15.0,
                ),
                markers: controller.markers,
                polylines: controller.polylines,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
              );
            },
          ),
          Positioned(
            right: 16,
            bottom: 10,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.notificationScreen);
                  },
                  child: const CircleButtonWidget(icon: Icons.notifications, height: 40, width: 40),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.leaveTraceScreen);
                  },
                  child: const CircleButtonWidget(icon: Icons.add, height: 50, width: 50),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.arTakePhotoScreen);
                  },
                  child: const CircleButtonWidget(icon: Icons.fingerprint, height: 60, width: 60),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // List<Widget> _buildARIcons() {
  //   final List<Offset> positions = [
  //     const Offset(80, 150),
  //     const Offset(200, 250),
  //     const Offset(120, 300),
  //     const Offset(280, 180),
  //     const Offset(160, 450),
  //   ];
  //
  //   final List<Color> colors = [
  //     Colors.blue,
  //     Colors.purple,
  //     Colors.orange,
  //     Colors.pink,
  //     Colors.deepOrange,
  //   ];
  //
  //   return List.generate(
  //     positions.length,
  //         (index) => Positioned(
  //       left: positions[index].dx,
  //       top: positions[index].dy,
  //       child: InkWell(
  //         onTap: () {
  //           Get.toNamed(AppRoutes.giftCommentsScreen);
  //         },
  //         child: Container(
  //           width: 60,
  //           height: 60,
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: colors[index].withOpacity(0.2),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: colors[index].withOpacity(0.6),
  //                 blurRadius: 25,
  //                 spreadRadius: 5,
  //               ),
  //             ],
  //           ),
  //           child: Center(
  //             child: Icon(
  //               Icons.fingerprint,
  //               color: colors[index],
  //               size: 30,
  //               shadows: [
  //                 Shadow(
  //                   color: colors[index].withOpacity(0.7),
  //                   blurRadius: 10,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class CircleButtonWidget extends StatelessWidget {
  final IconData icon;
  final double height;
  final double width;

  const CircleButtonWidget({
    super.key,
    required this.icon,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: width / 2,
      backgroundColor: Colors.transparent,
      child: Icon(icon, size: height / 2, color: Colors.blue),
    );
  }
}