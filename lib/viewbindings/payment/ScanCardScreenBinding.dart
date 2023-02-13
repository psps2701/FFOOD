import 'package:ffood/controllers/AddressScreenController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/controllers/orders/OrderDetailController.dart';
import 'package:get/get.dart';

import '../../controllers/payment/PaymentController.dart';
import '../../controllers/payment/ScanCardController.dart';


class ScanCardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>ScanCardController());
  }


}