import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/MainScreen/HomeScreenController.dart';
import '../../controllers/MainScreen/ReviewScreenController.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/common_image_view.dart';
import '../../widgets/small_text.dart';


class ReviewScreen extends GetView<ReviewScreenController>

{
  const ReviewScreen({super.key});

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
      child: SafeArea(child: Text("Review",style: TextStyle(fontSize: 20),)),
    );;
  }

}