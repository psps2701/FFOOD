import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/controllers/orders/OrderDetailController.dart';
import 'package:get/get.dart';


class OrderDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>OrderDetailController());
  }


}