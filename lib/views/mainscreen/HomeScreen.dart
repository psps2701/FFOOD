import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/MainScreen/HomeScreenController.dart';
import '../DrawerScreen.dart';
import 'HomeView.dart';


class HomeScreen extends GetView<HomeScreenController>

{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(

      child: Stack(
      children: const [
        DrawerScreen(),
        HomeView(),
      ],
    ),);;
  }

}