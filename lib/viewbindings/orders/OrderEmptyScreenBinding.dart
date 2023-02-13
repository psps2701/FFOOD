import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/controllers/orders/OrderDetailController.dart';
import 'package:ffood/controllers/orders/OrdersEmptyController.dart';
import 'package:get/get.dart';


class OrderEmptyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>OrdersEmptyController());
  }


}