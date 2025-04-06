import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ARMapScreen extends StatefulWidget {
  const ARMapScreen({super.key});

  @override
  State<ARMapScreen> createState() => _ARMapScreenState();
}

class _ARMapScreenState extends State<ARMapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(36.1911, 44.0090);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          // بصمات AR
          ..._buildARIcons(),

          // الأزرار العائمة
          Positioned(
            right: 16,
            bottom: 100,
            child: Column(
              children: [
                _buildCircleButton(Icons.notifications),
                const SizedBox(height: 10),
                _buildCircleButton(Icons.camera_alt),
                const SizedBox(height: 10),
                _buildCircleButton(Icons.add),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 1,
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey[600],
      //   backgroundColor: Colors.black,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.fingerprint),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.card_giftcard),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: '',
      //     ),
      //   ],
      // ),
    );
  }

  // بصمات AR
  List<Widget> _buildARIcons() {
    final List<Offset> positions = [
      const Offset(80, 150),
      const Offset(200, 250),
      const Offset(120, 300),
      const Offset(280, 180),
      const Offset(160, 450),
    ];

    final List<Color> colors = [
      Colors.orange,
      Colors.blue,
      Colors.purpleAccent,
      Colors.orange,
      Colors.blue,
    ];

    return List.generate(
      positions.length,
          (index) => Positioned(
        left: positions[index].dx,
        top: positions[index].dy,
        child: Icon(
          Icons.fingerprint,
          color: colors[index],
          size: 40,
          shadows: [
            Shadow(
              color: colors[index].withOpacity(0.7),
              blurRadius: 20,
            ),
          ],
        ),
      ),
    );
  }

  // زر دائري جانبي
  Widget _buildCircleButton(IconData icon) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.blue,
      child: Icon(icon, color: Colors.white),
    );
  }
}
