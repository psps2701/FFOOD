import 'package:ffood/controllers/AuthController/OtpController.dart';
import 'package:get/get.dart';

class OtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}
