import 'package:get/get.dart';
import '../../controllers/MainScreen/MapViewScreenController.dart';

class MapViewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapViewScreenController());
  }
}
