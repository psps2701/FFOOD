import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';
import '../controllers/MainScreen/CartScreenController.dart';
import '../controllers/MainScreen/HomeScreenController.dart';


class CartScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>CartScreenController());
  }


}