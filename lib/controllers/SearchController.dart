import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class SearchController extends GetxController with StateMixin<dynamic> {

  final TextEditingController searchTextField = TextEditingController();
  List<String> searchList = ["Asian noodle salad", "Dominos Pizza",  "Burgers", "Burgers"].obs;
  List<String> dishNames = [
    "Fast food",
    "Breakfast",
    "Aisa",
    "Mexican",
    "Pizza",
    "Donat"
  ].obs;

  List<String> imageUrl = [
    "assets/burger.png",
    "assets/breakfast.png",
    "assets/aisain.png",
    "assets/mexican_filter.png",
    "assets/pizza_filter.png",
    "assets/donut_filter.png"
  ].obs;
  int pressedAttentionIndex = -1.obs;


  late List<bool> pressedAttentions = dishNames.map((e) => false).toList().obs;

  @override
  Future<void> onInit() async {

    super.onInit();
  }
}
