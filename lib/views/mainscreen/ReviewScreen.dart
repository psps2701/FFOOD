import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/MainScreen/HomeScreenController.dart';
import '../../controllers/MainScreen/ReviewScreenController.dart';
import '../../themecolor/ThemeColors.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/get_storage_key.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/common_image_view.dart';
import '../../widgets/small_text.dart';
import 'package:get_storage/get_storage.dart';


class ReviewScreen extends GetView<ReviewScreenController>

{
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
        systemNavigationBarColor:  ThemeColors().mainBgColor, // Navigation bar
        statusBarColor:  ThemeColors().statusBarColor,
        statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
        statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
          // Status bar
      ),
      child: SafeArea(child: Text("Review",style: TextStyle(fontSize: 20),)),
    );;
  }

}