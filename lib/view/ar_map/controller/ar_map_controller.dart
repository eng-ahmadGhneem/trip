import 'dart:io';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ArMapController extends GetxController {
  late CameraController cameraController;
  var isCameraInitialized = false.obs;
  var capturedImage = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    await cameraController.initialize();
    isCameraInitialized.value = true;
  }

  Future<void> takePicture() async {
    if (!cameraController.value.isInitialized) return;

    final directory = await getTemporaryDirectory();
    final imagePath = join(directory.path, '${DateTime.now()}.png');

    final XFile picture = await cameraController.takePicture();
    capturedImage.value = File(picture.path);
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
