import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:trip/core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../controller/home_controller.dart';

class ARMapScreen extends StatelessWidget {
  const ARMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              return FlutterMap(
                options: MapOptions(
                  center: controller.currentLocation,
                  zoom: 15,
                  onTap: (tapPosition, point) {},
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
                    subdomains: ['a', 'b', 'c'],
                    userAgentPackageName: 'com.example.trip',
                  ),
                  // CircleLayer(
                  //   circles: [
                  //     CircleMarker(
                  //       point: controller.currentLocation!,
                  //       color: Colors.blue.withOpacity(0.2),
                  //       borderStrokeWidth: 2,
                  //       borderColor: Colors.blue,
                  //       radius: 100,
                  //     ),
                  //   ],
                  // ),
                  MarkerLayer(markers: controller.markers),

                  PolylineLayer(polylines: controller.polylines),
                ],
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
