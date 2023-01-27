import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/SideMenu/SettingController.dart';
import '../../themecolor/ThemeColors.dart';
import '../../util/app_colors.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import '../../util/colors.dart';
import '../../widgets/big_text.dart';



class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return  ThemeSwitchingArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value:   SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.white, // Navigation bar
          statusBarColor: AppColors.statusBarGrey,
            statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark


          // Status bar
        ),
        child: ThemeSwitcher(
            builder: (context) => Obx(() => Scaffold(
              backgroundColor: controller.isDarkMode.value ?  ThemeColors().lightDark : ThemeColors().lightDark ,
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: (){
                                //navigateToHomeScreen();
                              },
                              child: Container(
                                width: 38,
                                height: 38,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration:  ShapeDecoration(
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 1,
                                        offset: const Offset(1, 10),
                                        color: Colors.grey.withOpacity(0.2),
                                      )
                                    ],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    color:  Colors.white ),
                                child:   Icon(Icons.arrow_back_ios, size: 15,color:  Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.25,),
                          BigText(text: "Settings", size: 18,color: Colors.white ,),
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color:  Colors.black12),
                          child:                Center(child: BigText(text: "LANGUAGE", size: 16, color:  Colors.white,)),
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
                              border: Border.all(color: tabBorderColor),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: SizedBox(
                                    width:19,
                                    height: 19,
                                    child: Image.asset("assets/language_logo.png", color:  Colors.white,)),
                              ),
                            ),

                          ),
                        ),

                        /*     Positioned(
                      bottom: -20,
                      left: -10,
                      // right: 0,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 290,
                        height: 55,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(color: tabBorderColor),
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
                    ),*/
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black12),
                          child:                Center(child: BigText(text: "THEME", size: 16,color: Colors.white)),
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
                              border: Border.all(color: tabBorderColor),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                    width:19,
                                    height: 19,
                                    child: Image.asset("assets/theme_logo.png",color: Colors.white)),
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(color: tabBorderColor),
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
      ),
    );;
  }

}