import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';

import '../controllers/MainScreen/FavoriteScreenController.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../controllers/RestaurantProfileController.dart';
import '../controllers/SearchController.dart';


class SearchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>SearchController());
  }


}