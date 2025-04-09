import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip/core/constant/const_data.dart';
import 'package:trip/core/constant/routes.dart';
import '../../../widget/circle_button_widget.dart';


class ARMapScreen extends StatefulWidget {
  const ARMapScreen({super.key});

  @override
  State<ARMapScreen> createState() => _ARMapScreenState();
}

class _ARMapScreenState extends State<ARMapScreen> with SingleTickerProviderStateMixin {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(24.7136, 46.6753);

  bool _showActions = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Google Map with dark mode style
          GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
              mapController.setMapStyle(ConstData.darkMapStyle);
            },
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          ..._buildARIcons(),
          Positioned(
            right: 16,
            bottom: 10,
            child: Column(
              children: [
                AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  offset: _showActions ? Offset.zero : const Offset(0, 1),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _showActions ? 1 : 0,
                    child: GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.notificationScreen);
                        },
                        child: CircleButtonWidget(icon:Icons.notifications, height: 40,width: 40,)),
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  offset: _showActions ? Offset.zero : const Offset(0, 1),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _showActions ? 1 : 0,
                    child: GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.arTakePhotoScreen);
                        },
                        child: CircleButtonWidget(icon:Icons.camera_alt,height: 50,width: 50)),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showActions = !_showActions;
                    });
                  },
                  child: CircleButtonWidget(icon:Icons.add,height: 60,width: 60),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildARIcons() {
    final List<Offset> positions = [
      const Offset(80, 150),
      const Offset(200, 250),
      const Offset(120, 300),
      const Offset(280, 180),
      const Offset(160, 450),
    ];

    final List<Color> colors = [
      Colors.blue,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.deepOrange,
    ];

    return List.generate(
      positions.length,
          (index) => Positioned(
        left: positions[index].dx,
        top: positions[index].dy,
        child: InkWell(
          onTap: (){
            Get.toNamed(AppRoutes.giftCommentsScreen);
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[index].withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  color: colors[index].withOpacity(0.6),
                  blurRadius: 25,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.fingerprint,
                color: colors[index],
                size: 30,
                shadows: [
                  Shadow(
                    color: colors[index].withOpacity(0.7),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
