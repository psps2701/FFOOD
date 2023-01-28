import 'package:get/get.dart';
import '../../controllers/SideMenu/PaymentMethodController.dart';
import '../../controllers/SideMenu/SettingController.dart';

class PaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>PaymentMethodController());
  }


}