import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FilterScreenController extends GetxController with StateMixin<dynamic> {

  List<String> dishNames = [
    "Fast food",
    "Breakfast",
    "Aisa",
    "Mexican",
    "Pizza",
    "Donat"
  ];
  List<String> shortBy = [
    "Popular",
    "Free Delivery",
    "Near me",
    "Cost low to high",
    "Delivery time"
  ];
  List<String> imageUrl = [
    "assets/burger.png",
    "assets/breakfast.png",
    "assets/aisain.png",
    "assets/mexican_filter.png",
    "assets/pizza_filter.png",
    "assets/donut_filter.png"
  ];
  List<String> rating = ["1", "2", "3", "4", "5"];
  List<String> reversedRating = ["1","2","3","4","5"];
  late List<bool> pressedAttentions = dishNames.map((e) => false).toList();

  int pressedAttentionIndex = -1;
  int shortByAttentionIndex = -1;
  int ratingAttentionIndex = -1;
  DateTime selectedDate = DateTime.now();
  RangeValues values = RangeValues(0, 500);

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
