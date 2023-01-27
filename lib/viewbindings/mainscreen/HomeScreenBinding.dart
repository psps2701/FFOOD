
import 'package:get/get.dart';

import '../../controllers/MainScreen/HomeScreenController.dart';




class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>HomeScreenController());
  }


}