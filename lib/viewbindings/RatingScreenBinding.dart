import 'package:ffood/controllers/FoodDetailsController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';

import '../controllers/MainScreen/FavoriteScreenController.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../controllers/RatingController.dart';
import '../controllers/RestaurantProfileController.dart';


class RatingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>RatingController());
  }


}