import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/CategoryScreenController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/RatingController.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/get_storage_key.dart';
import '../util/images.dart';
import '../util/size_utils.dart';
import '../widgets/big_text.dart';
import '../widgets/category_screen_food_container.dart';
import '../widgets/common_image_view.dart';
import '../widgets/conatiner_with_image.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/small_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class CategoryScreen extends GetView<CategoryScreenController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.themeColor, // Navigation bar
        statusBarColor: ThemeColors().statusBarColor,
          statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark

        // Status bar
      ),
      child: Scaffold(
        backgroundColor: ThemeColors().mainBgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/category_header.png",
                            width: MediaQuery.of(context).size.height * 0.3,
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const CustomBackButton())),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BigText(
                                text: "Fast",
                                size: MediaQuery.of(context).size.height * 0.067,
                              ),
                              BigText(
                                text: "Food",
                                size: MediaQuery.of(context).size.height  * 0.098,
                                color: orangeColor,
                              ),
                              // SizedBox(
                              //   height: 2
                              // ),
                              SmallText(
                                text: "80 type of pizza",
                                size: MediaQuery.of(context).size.height/52.75,
                                color: loginPageLabelColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 20),
                    child: Row(
                      children: [
                        SmallText(
                          text: "Short by:",
                          color: blackColor,
                          size: MediaQuery.of(context).size.height * 0.0177,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height/56.27,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 22.0),
                          child: Row(
                            children: [
                              SmallText(
                                text: "Popular",
                                size: MediaQuery.of(context).size.height * 0.0177,
                                color: orangeColor,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: MediaQuery.of(context).size.height * 0.03,
                                color: orangeColor,
                              ),
                              SizedBox(
                                width: 140.w,
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: MediaQuery.of(context).size.width/56.27, right: MediaQuery.of(context).size.width/84.4),
                                child: GestureDetector(
                                    child: ImageContainer(
                                      imageName: "assets/filter_button.png",
                                      width: MediaQuery.of(context).size.width * 0.1,
                                      height: MediaQuery.of(context).size.height * 0.05, themeValue: 0,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.name.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            // onTap: () => navigateToFoodDetail(),
                              child: CategoryScreenFoodContainer(
                                name: controller.name[index],
                                details: controller.details[index],
                                rating: controller.rating[index],
                                imageUrl: controller.imageUril[index],
                                price: controller.price[index],
                                reviewsCount: controller.reviewCount[index],
                              )),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );;
  }

}