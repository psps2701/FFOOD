import 'package:get/get.dart';
import '../../controllers/SideMenu/SettingController.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>SettingController());
  }


}