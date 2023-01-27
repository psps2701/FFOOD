
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/MainScreen/ProfileScreenController.dart';
import '../../util/app_colors.dart';


class ProfileScreen extends GetView<ProfileScreenController>
{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.white, // Navigation bar
          statusBarColor: AppColors.statusBarGrey,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark
          // Status bar
      ),
      child: SafeArea(child: const Text("Profile",style: TextStyle(fontSize: 20),)),
    );;
  }

}