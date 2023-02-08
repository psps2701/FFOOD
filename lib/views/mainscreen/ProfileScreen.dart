
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../controllers/MainScreen/ProfileScreenController.dart';
import '../../themecolor/ThemeColors.dart';
import '../../util/app_colors.dart';
import '../../util/colors.dart';
import '../../util/get_storage_key.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/CustomCard.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/small_text.dart';


class ProfileScreen extends GetView<ProfileScreenController>
{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
        systemNavigationBarColor:  ThemeColors().mainBgColor, // Navigation bar
        statusBarColor:  Colors.transparent,
        statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark,
        statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark,
        // Status bar
      ),
      child: SizedBox(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: ThemeColors().mainBgColor,
            child: Stack(
              children: [
                Positioned(
                    left: 100,
                    child: Image.asset("assets/borderTwo.png")),
                Image.asset("assets/borderThree.png"),
                Positioned(
                    left: 130,
                    child: Image.asset("assets/borderOne.png")),
                Positioned(
                  top: 20,
                  child:    GestureDetector(
                    // onTap: navigateToHomeScreen,
                    child: Container(
                        margin: getMargin(left: 15,right: 10),
                        child: CustomBackButton()),
                  ),

                ),

                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.31,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.height * 0.06,
                            backgroundImage: AssetImage(Images.icUserPlaceHolder),
                          ),
                        ),
                      ),

                      BigText(text: "Eljad Eendaz",color: ThemeColors().kPrimaryTextColor,),
                      GestureDetector(
                          onTap: ()=>{

                          },


                          child: SmallText(text: "Edit Profile", color: ThemeColors().kPrimaryTextColor,size: 14,)),
                    ],
                  ),
                ),

                Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  left: MediaQuery.of(context).size.width * 0.1,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SmallText(text: "Full name", size: 16, color: ThemeColors().kSecondaryTextColor,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.06,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
                        decoration: BoxDecoration(
                          color: ThemeColors().greyBlack,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/80.27),
                          border: Border.all(color: ThemeColors().greyBlack),
                          // boxShadow: [
                          //   BoxShadow(
                          //     blurRadius: 3,
                          //     spreadRadius: 1,
                          //     offset: const Offset(1, 10),
                          //     color: Colors.grey.withOpacity(0.2),
                          //   )
                          // ]

                        ),
                        child: Padding(
                            padding: EdgeInsets.only(top: 12, left: 10),
                            child: BigText(text: "Eljad Eendaz",size: 16,color: ThemeColors().kPrimaryTextColor,)),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.5,
                  left: MediaQuery.of(context).size.width * 0.1,

                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SmallText(text: "E-mail", size: 16, color: loginPageLabelColor,),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.06,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
                          decoration: BoxDecoration(
                            color: ThemeColors().greyBlack,
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/80.27),
                            border: Border.all(color: ThemeColors().greyBlack),
                            // boxShadow: [
                            //   BoxShadow(
                            //     blurRadius: 3,
                            //     spreadRadius: 1,
                            //     offset: const Offset(1, 10),
                            //     color: Colors.grey.withOpacity(0.2),
                            //   )
                            // ]

                          ),
                          child: Padding(
                              padding: EdgeInsets.only(top: 12, left: 10),
                              child: BigText(text: "prelookstudio@gmail.com",size: 16,color: ThemeColors().kPrimaryTextColor,)),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.64,
                  left: MediaQuery.of(context).size.width * 0.1,

                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SmallText(text: "Phone Number", size: 16, color: loginPageLabelColor,),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.06,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
                          decoration: BoxDecoration(
                            color: ThemeColors().greyBlack,
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/80.27),
                            border: Border.all(color: ThemeColors().greyBlack),
                            // boxShadow: [
                            //   BoxShadow(
                            //     blurRadius: 3,
                            //     spreadRadius: 1,
                            //     offset: const Offset(1, 10),
                            //     color: Colors.grey.withOpacity(0.2),
                            //   )
                            // ]

                          ),
                          child: Padding(
                              padding: EdgeInsets.only(top: 12, left: 10),
                              child: BigText(text: "+1 (783) 0986 8786",size: 16,color: ThemeColors().kPrimaryTextColor,)),
                        )
                        // AppTextField(textController: _phoneTextController, hintText: "Full name", textInputType: TextInputType.text, )
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

}