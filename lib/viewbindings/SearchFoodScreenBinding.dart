import 'package:ffood/controllers/SearchFoodController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';




class SearchFoodScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>SearchFoodController());
  }


}