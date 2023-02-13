import 'package:ffood/controllers/WelcomeController.dart';
import 'package:get/get.dart';

import '../controllers/MainScreen/FavoriteScreenController.dart';
import '../controllers/MainScreen/HomeScreenController.dart';


class FavoriteScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>FavoriteScreenController());
  }


}