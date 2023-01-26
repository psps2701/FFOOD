import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/views/HomeView.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/common_image_view.dart';
import '../widgets/small_text.dart';
import 'DrawerScreen.dart';


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