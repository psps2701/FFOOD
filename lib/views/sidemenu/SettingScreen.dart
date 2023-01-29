import 'package:ffood/controllers/MainScreen/HomeScreenController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/SideMenu/SettingController.dart';
import '../../themecolor/ThemeColors.dart';
import '../../util/app_colors.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import '../../util/colors.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/CustomCard.dart';
import '../../widgets/big_text.dart';



class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return  ThemeSwitchingArea(
      child: GetX<SettingController>(

        builder: (controller) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
              systemNavigationBarColor:  controller.isDarkMode.value ? AppColors.themeDark : AppColors.white, // Navigation bar
              statusBarColor:  controller.isDarkMode.value ? AppColors.themeDark :AppColors.statusBarGrey,
              statusBarBrightness: controller.isDarkMode.value ?  Brightness.light : Brightness.dark,
              statusBarIconBrightness: controller.isDarkMode.value ?  Brightness.light : Brightness.dark,
              // Status bar
            ),
            child: ThemeSwitcher(
               builder: (context) => Obx(() => Scaffold(
               backgroundColor: controller.isDarkMode.value ? AppColors.themeDark : AppColors.themeWhite  ,
               body: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.06),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                // onTap: navigateToHomeScreen,
                                child: GestureDetector(
                                  onTap: (){

                                    Get.find<HomeScreenController>().closeDrawer();
                                    Get.back();
                                  },
                                  child: Container(
                                    width: 38,
                                    height: 38,
                                    margin: getMargin(left: 15,top: 15,bottom: 10),
                                    // padding: EdgeInsets.symmetric(horizontal: 15),

                                    child: CustomCard(
                                      margin: 0,
                                      bgColor:  controller.isDarkMode.value ? AppColors.themeDark : AppColors.white,
                                      child: Image.asset(Images.icBack, color: controller.isDarkMode.value ? Colors.white :Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),


                              Expanded(child: Center(child: BigText(text: "Settings", size: 20,color : ThemeColors().lightDark))),
                              Container(
                                width: 38,
                                height: 38,
                                margin: getMargin(left: 15,top: 15,bottom: 10),
                                // padding: EdgeInsets.symmetric(horizontal: 15),


                              ),
                            ],
                          ),
                        ),

                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 30),
                              width: 323,
                              height: 90,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color:  ThemeColors().greyBlack),
                              child:                Center(child: BigText(text: "LANGUAGE", size: 16, color:  ThemeColors().lightDark,)),
                            ),

                            Positioned(
                              right: -0,
                              bottom: -15,
                              child: Container(
                                padding: const EdgeInsets.only(left: 10),
                                width: 70,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: orangeColor,
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(color: ThemeColors().outline),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: SizedBox(
                                        width:19,
                                        height: 19,
                                        child: Image.asset("assets/language_logo.png", color:  ThemeColors().mainColor,)),
                                  ),
                                ),

                              ),
                            ),

                                 Positioned(
                          bottom: -20,
                          left: -10,
                          // right: 0,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 290,
                            height: 55,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: controller.isDarkMode.value ?  AppColors.themeDark : AppColors.themeWhite,
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(color:ThemeColors().outline),
                            ),
                            child: TabBar(

                                onTap: (index){
                                  print(index);
                                },
                                indicator: BoxDecoration(
                                    color: orangeColor,
                                    borderRadius: BorderRadius.circular(25.0)),
                                // labelColor: orangeColor,
                                unselectedLabelColor: orangeColor,
                                controller: controller.tabController,
                                tabs: const [
                                  Tab(
                                    text: "English (EN)",
                                  ),
                                  Tab(
                                    text: "Ελληνικά (GR)",
                                  )
                                ]),
                          ),
                        ),
                          ],
                        ),


                        SizedBox(height: 75,),

                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 30),
                              width: 323,
                              height: 90,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color:  ThemeColors().greyBlack),
                              child:                Center(child: BigText(text: "THEME", size: 16,color: ThemeColors().lightDark)),
                            ),

                            Positioned(
                              right: -0,
                              bottom: -15,
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 70,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: orangeColor,
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(color: ThemeColors().outline),
                                ),
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8.0),

                                    child: SizedBox(
                                        width:19,
                                        height: 19,
                                        child: Image.asset("assets/theme_logo.png",color:  ThemeColors().mainColor)),
                                  ),
                                ),

                              ),
                            ),

                            Positioned(
                              bottom: -20,
                              left: -10,
                              // right: 0,
                              child: Container(
                                margin: EdgeInsets.all(5),
                                width: 290,
                                height: 55,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: controller.isDarkMode.value ?  AppColors.themeDark : AppColors.themeWhite,

                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(color: ThemeColors().outline),
                                ),
                                child:ThemeSwitcher(
                                    builder: (context) => Obx(() =>  TabBar(

                                        onTap: (index){

                                          print("index $index");
                                          controller.changeTheme(context);
                                          //sharedPreferences.setInt(AppConstants.THEMEVALUE, index);
                                          //provider.toggleTheme(index);

                                          //themeValue = sharedPreferences.get(AppConstants.THEMEVALUE);
                                          //print(" this is ${sharedPreferences.get(AppConstants.THEMEVALUE)}");

                                          // print(" Shared prefences ${sharedPreferences.get(AppConstants.THEMEVALUE)}");
                                        },
                                        indicator: BoxDecoration(
                                            color: controller.isDarkMode.value ? orangeColor :orangeColor,
                                            borderRadius: BorderRadius.circular(25.0)),
                                        // labelColor: orangeColor,
                                        unselectedLabelColor: orangeColor,
                                        controller: controller.themeTabController,
                                        tabs: const [
                                          Tab(
                                            text: "Light Mode",

                                          ),
                                          Tab(
                                            text: "Dark Mode",

                                          )
                                        ]))
                                )
                                ,
                              ),
                            ),
                          ],
                        ),


                        Expanded(child: Container()),

                        Image.asset("assets/foodoma_bottom_logo.png",height: 44,),
                        SizedBox(height: 10,)


                      ],
                    ),
                  ),
                )  )
            )
            ,
          );
        }
      ),
    );;
  }

}