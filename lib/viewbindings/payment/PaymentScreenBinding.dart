import 'package:ffood/controllers/AddressScreenController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/controllers/orders/OrderDetailController.dart';
import 'package:get/get.dart';

import '../../controllers/payment/PaymentController.dart';


class PaymentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>PaymentController());
  }


}