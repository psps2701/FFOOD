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
import '../widgets/CustomCard.dart';
import '../widgets/CustomCardImage.dart';
import '../widgets/CustomShadow.dart';
import '../widgets/big_text.dart';
import '../widgets/common_image_view.dart';
import '../widgets/conatiner_with_image.dart';
import '../widgets/food_container_with_icon.dart';
import '../widgets/small_text.dart';
import 'DrawerScreen.dart';
import 'HomeGridView.dart';
import 'HomeListView.dart';


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
      child: GetX<HomeScreenController>(

        builder: (controller) {
          return AnimatedContainer(
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
                    BorderRadius.all(Radius.circular(controller.isDrawerOpen.value ? 40: 0))),
                color: Colors.white ),
            transform: Matrix4.translationValues(controller.xOffset.value, controller.yOffset.value, 0)..scale(controller.scaleFactor.value)..rotateY(0),
            duration: Duration(milliseconds: 250),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(

                  padding: EdgeInsets.only(
                      left: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          // Drawer
                          GestureDetector(
                            onTap: (){

                                print("tapped");
                                if(controller.isDrawerOpen.value == true) {
                                  controller.xOffset.value = 0;
                                  controller.yOffset.value = 0;
                                  controller.scaleFactor.value = 1;
                                  controller.isDrawerOpen.value  = false;
                                }else{
                                  controller.isDrawerOpen.value = true;
                                  controller.xOffset.value = 200;
                                  controller.yOffset.value = 200;
                                  controller.scaleFactor.value = 0.6;
                                }


                            },
                            child: Container(
                              width: 38,
                              height: 38,
                              margin: getMargin(left: 10,top: 10),
                              // padding: EdgeInsets.symmetric(horizontal: 15),

                              child: CustomCard(
                                margin: 0,
                                child: Image.asset(Images.homeMenu, color: false ? Colors.white :Colors.black,
                                ),
                              ),
                            ),
                          ),

                          Expanded(child: Container()),

                          //Deliver to
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                  child: SizedBox(
                                    width: 180,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        SmallText(
                                          text: "Deliver to",
                                          size: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.black,

                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SmallText(
                                  text: "4102  Pretty View Lane ",
                                  size: 12,
                                  color: orangeColor,
                                ),
                              ],
                            ),
                          ),

                          Expanded(child: Container()),
                          // User image
                          Container(
                            width: 40,
                            height: 40,
                            margin: getMargin(right: 10,top: 10),
                            // padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: CustomCardImage(
                              padding: 0,
                              margin: 0,
                              image: Images.icUserPlaceHolder,
                            child: Container(),),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Haading text
                      // SizedBox(
                      //   height: 40.h,
                      // ),

                      //Search row
                      GestureDetector(
                        onTap: (){
                          //navigateToSearchScreen();
                        },
                        child: Row(

                          children: [

                            Expanded(
                              child: Container(
                                margin: getMargin(left: 10,right: 10),
                                child: CustomShadow(
                                  blur:  2,
                                  color: Colors.grey,
                                  offset: const Offset(1, 1),
                                  child: Container(
                                    decoration:  const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      color: Colors.white,
                                    ),
                                    height: 50,

                                    child: Row(children: [
                                      SizedBox(width: 10,),
                                      Icon(Icons.search_outlined, color: orangeColor,),
                                      SizedBox(width: 5,),
                                      Expanded(child: BigText(text: "Find for food or restaurant...",size: 12,color: Colors.grey,))
                                    ],),
                                  ),
                                ),
                              ),
                            ),

                       


                            GestureDetector(
                                onTap: () {

                                    controller.listPressed.value = false;
                                    controller.gridPressed.value = true;
                                  // return navigateToCategoryPage();
                                },
                                child: CustomShadow(
                                  blur: controller.gridPressed.value ? 1 : 5,
                                  color: Colors.grey,
                                  offset: controller.gridPressed.value ?  const Offset(0.5, 0.5) : const Offset(1, 1),
                                  child: Container(
                                    decoration:  BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      color: controller.gridPressed.value ? orangeColor: Colors.white,
                                    ),
                                    height: 48,
                                    width: 48,
                                    child: Container(
                                        padding: const EdgeInsets.all(13),
                                        child: Image.asset(Images.icGrid, color: controller.gridPressed.value ? Colors.white :orangeColor,)),
                                  ),
                                ),),
                            SizedBox(width: 10,),
                            GestureDetector(
                                onTap: () {

                                  controller.listPressed.value = true;
                                  controller.gridPressed.value = false;
                                  // return navigateToCategoryPage();
                                },
                                child: CustomShadow(
                                  blur: controller.listPressed.value ? 1 : 5,
                                  color: Colors.grey,
                                  offset: controller.listPressed.value ?  const Offset(0.5, 0.5) : const Offset(1, 1),
                                  child: Container(
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      color: controller.listPressed.value ? orangeColor: Colors.white,
                                    ),
                                    height: 48,
                                    width: 48,
                                    child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Image.asset(Images.icList, color: controller.listPressed.value ? Colors.white :orangeColor,)),
                                  ),
                                ),),
                            SizedBox(width: 10,)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: size.width,
                        height: 130,
                        child: GetX<HomeScreenController>(

                          builder: (controller) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.name.length,
                                itemBuilder: (context, index)  {

                                  print("image==>${controller.imageUrl[index]}");
                                  return Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 20),
                                  child: FoodVertialContainer(
                                    name: controller.name[index],
                                    imageUrl: controller.imageUrl[index],
                                    onPressed: controller.onPress[index], themeValue: 1,
                                  ),
                                );});
                          }
                        ),
                      ),

                      Visibility(
                          visible: controller.gridPressed.value ? true : false,
                          child: HomeGridView()),
                      Visibility(
                          visible: controller.listPressed.value ? true : false,
                          child: HomeListView()),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    ));;
  }

}