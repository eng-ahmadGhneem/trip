import 'dart:typed_data';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  LatLng? _currentLocation;
  Set<Marker> _markers = {};
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<Map<String, dynamic>> arIconsData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    _getCurrentLocation();
    loadARIconsData();
    super.onInit();
  }



  Future<void> loadARIconsData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('ar_icons').get();
      List<Map<String, dynamic>> data = snapshot.docs.map((doc) {
        return {
          'position': Offset(doc['x_position'], doc['y_position']),
          'color': Color(int.parse('0xFF${doc['color']}')),
        };
      }).toList();
      arIconsData.value = data;
    } catch (e) {
      throw("Error loading AR icons data: $e");
    }
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _currentLocation = LatLng(position.latitude, position.longitude);
      update();
      loadMarkers();
    }
  }

  Future<void> loadMarkers() async {
    List<Marker> markers = [];
    try {
      QuerySnapshot provincesSnapshot = await _firestore.collection('map_home').get();

      for (var provinceDoc in provincesSnapshot.docs) {
        String provinceName = provinceDoc['name'];
        double provinceLat = double.parse(provinceDoc['latitude'].toString());
        double provinceLng = double.parse(provinceDoc['longitude'].toString());

        markers.add(Marker(
          markerId: MarkerId(provinceDoc.id),
          position: LatLng(provinceLat, provinceLng),
          infoWindow: InfoWindow(title: provinceName),
        ));

        // Load fingerprints for each province
        QuerySnapshot fingerprintsSnapshot = await _firestore
            .collection('map_home')
            .doc(provinceDoc.id)
            .collection('fingerprints')
            .get();

        for (var fingerprintDoc in fingerprintsSnapshot.docs) {
          String colorHex = fingerprintDoc['color'];
          double lat = double.parse(fingerprintDoc['latitude'].toString());
          double lng = double.parse(fingerprintDoc['longitude'].toString());
          Uint8List customIcon = await _getCustomMarkerIcon(colorHex);

          markers.add(Marker(
            markerId: MarkerId(fingerprintDoc.id),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(title: 'Fingerprint ${fingerprintDoc.id}'),
            icon: BitmapDescriptor.fromBytes(customIcon),
          ));
        }
      }

      _markers = markers.toSet();
      update();
    } catch (e) {
      throw("Error loading data: $e");
    }
  }

  Future<Uint8List> _getCustomMarkerIcon(String hexColor) async {
    final paint = Paint()..color = Color(int.parse('0xFF$hexColor'));
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromPoints(const Offset(0, 0), const Offset(100, 100)));

    // Draw a circle with the selected color
    canvas.drawCircle(const Offset(50, 50), 30, paint);
    final picture = recorder.endRecording();
    final img = await picture.toImage(100, 100);
    final byteData = await img.toByteData(format: ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Set<Marker> get markers => _markers;
  LatLng? get currentLocation => _currentLocation;
}
