import 'package:get/get.dart';

import '../../controllers/AuthController/ResetPasswordController.dart';

class ResetPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
