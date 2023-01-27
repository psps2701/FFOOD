import 'package:ffood/controllers/AddressScreenController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/controllers/orders/OrderDetailController.dart';
import 'package:get/get.dart';

import '../controllers/AddressListScreenController.dart';


class AddressListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>AddressListController());
  }


}