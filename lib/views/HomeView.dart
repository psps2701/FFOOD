import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/WelcomeController.dart';
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


class HomeView extends GetView<HomeScreenController>

{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: GestureDetector(
      onTap: (){
        print("pressed");
        controller.xOffset.value = 0;
        controller.yOffset.value = 0;
        controller.scaleFactor.value = 1;
        controller.isDrawerOpen.value = false;
      },
      child: /*AnimatedContainer(
        decoration:  ShapeDecoration(
          // shadows: [
          //   BoxShadow(
          //     // color: Colors.grey.withOpacity(0.2),
          //       blurRadius: 3,
          //       color: greayColor,
          //       offset: Offset(1, 10))
          // ],
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(isDrawerOpen ? 40: 0))),
            color: themeValue == 0 ? Colors.white : darkThemeBackgroundColor),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor)..rotateY(0),
        duration: Duration(milliseconds: 250),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 5).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Drawer
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            print("tapped");
                            if(isDrawerOpen == true) {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen  = false;
                            }else{
                              isDrawerOpen = true;

                              xOffset = 200.w;
                              yOffset = 200.h;
                              scaleFactor = 0.6;
                            }


                          });
                        },
                        child: Container(
                          width: 38.w,
                          height: 38.h,
                          // padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration:  ShapeDecoration(
                            shadows: themeValue == 1 ?
                            [
                              BoxShadow(
                                // color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 3,
                                  color: greayColor,
                                  offset: Offset(1, 10))
                            ] : [],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)).w),
                            color: themeValue == 1 ? darkThemeContainerColor :Colors.white,
                          ),
                          child: Image.asset("assets/menu-icon.png", color: themeValue == 1 ? Colors.white :Colors.black,
                          ),
                        ),
                      ),

                      //Deliver to
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 6.0.w),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 180.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    SmallText(
                                      text: "Deliver to",
                                      size: 12,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: hintTextColor,
                                      size: 12.sp,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SmallText(
                              text: "4102  Pretty View Lane ",
                              size: 12.sp,
                              color: orangeColor,
                            ),
                          ],
                        ),
                      ),

                      // User image
                      Container(
                        width: 30.w,
                        height: 30.h,
                        // padding: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration:  ShapeDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/user-image.png",
                              ),
                            ),
                            // shadows: [
                            //   BoxShadow(
                            //     // color: Colors.grey.withOpacity(0.2),
                            //       blurRadius: 3,
                            //       color: greayColor,
                            //       offset: Offset(1, 10))
                            // ],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10).w)),
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  // Haading text
                  // SizedBox(
                  //   height: 40.h,
                  // ),

                  //Search row
                  GestureDetector(
                    onTap: (){
                      navigateToSearchScreen();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Container(
                          height: 51.h,
                          width: 205.w,
                          padding: EdgeInsets.all(6).w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: themeValue == 1 ? darkThemeContainerColor:textFieldBorderColor)
                          ),
                          child: Row(children: [
                            Icon(Icons.search_outlined, color: orangeColor,),
                            SizedBox(width: 5.w,),
                            BigText(text: "Find for food or restaurant...",size: 12.sp,color: Colors.grey,)
                          ],),
                        ),
                        // IconAppTextField(
                        //   textController: _searchTextField,
                        //   icon: Icons.search_outlined,
                        //   hintText: "Find for food or restaurant...",
                        // ),
                        // Flexible(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  listPressed = false;
                                  gridPressed = true;
                                });
                                // return navigateToCategoryPage();
                              },
                              child: ImageContainer(
                                imageName: "assets/grid_option.png",
                                width: 48.w,
                                height: 48.h,
                                isPressed: gridPressed, themeValue: themeValue,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(

                              onTap: () {

                                setState(() {
                                  listPressed = true;
                                  gridPressed = false;
                                });

                                // return navigateToCategoryPage();
                              },
                              child: ImageContainer(
                                imageName: "assets/list_option.png",
                                width: 48.w,
                                height: 48.h,
                                isPressed: listPressed, themeValue: themeValue,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: 130.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: name.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0).w,
                          child: FoodVertialContainer(
                            name: name[index],
                            imageUrl: imageUrl[index],
                            onPressed: onPress[index], themeValue: themeValue,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Visibility(
                      visible: gridPressed ? true : false,
                      child: HomeGridView()),
                  Visibility(
                      visible: listPressed ? true : false,
                      child: HomeListView(themeValue: themeValue,)),
                ],
              ),
            ),
          ),
        ),
      )*/Container(),
    ));;
  }

}