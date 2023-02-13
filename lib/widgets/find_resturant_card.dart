import 'package:ffood/widgets/small_text.dart';
import 'package:ffood/widgets/tag_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../themecolor/ThemeColors.dart';
import '../util/colors.dart';
import 'package:get_storage/get_storage.dart';
import '../util/get_storage_key.dart';
import '../util/images.dart';
import 'big_text.dart';


class FindResurentCard extends StatefulWidget {
  const FindResurentCard({Key? key}) : super(key: key);

  @override
  _FindResurentCardState createState() => _FindResurentCardState();
}

class _FindResurentCardState extends State<FindResurentCard> {

  List<String> tagBoxLabel = ["PIZZA", "FAST FOOD", "Fast Food"];

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.all(5).w,
        child: Neumorphic(
            style: NeumorphicStyle(
              depth: -2,
              intensity: 0.8,

              border: NeumorphicBorder(
                color: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?   const Color(0xDD2C2C37) : Colors.grey.shade100,
                width: 0.8,
              ),
              lightSource: LightSource.topLeft,
              shadowDarkColorEmboss:  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?   const Color(0xDD2C2C37) :Colors.grey.shade400,
              shadowLightColorEmboss: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?   const Color(0xDD2C2C37) :Colors.grey.shade400,
              color: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?   const Color(0xDD393948) : Colors.white,
              boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(10)),
            ),
            child:  Container(
              padding: const EdgeInsets.all(8).w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: const Offset(1, 10),
                                      color: ThemeColors().kWhiteColor.withOpacity(0.2),
                                    ),
                                  ]
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.r),
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  "https://1000logos.net/wp-content/uploads/2017/05/Pizza-Hut-Logo-1999-1024x576.jpg", width: 50.w, height: 50.h,),
                              ),
                            ),
                            Positioned(
                              top: -10,
                              right: -20,
                              child: Container(
                                width: 18.w,
                                height: 18.h,
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height / 90.2,
                                    right: MediaQuery.of(context).size.height / 90.2),
                                decoration: BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.circular(6.r),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     blurRadius: 3,
                                  //     spreadRadius: 1,
                                  //     offset: const Offset(1, 10),
                                  //     color: Colors.grey.withOpacity(0.2),
                                  //   )
                                  // ]
                                ),
                                child: Center(
                                    child: SmallText(
                                      text: "5.0",
                                      color: ThemeColors().kPrimaryTextColor,
                                    )),
                              ),
                            )

                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding:  EdgeInsets.only(bottom: 10.0),
                        child: GestureDetector(
                          child: Container(
                            width: 28.w,
                            height: 28.h,
                            // padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: const BoxDecoration(
                                color: orangeColor,
                                shape: BoxShape.circle,
                                boxShadow: [BoxShadow(
                                  color: orangeColor,
                                  blurRadius: 5.0,
                                ),]
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: ThemeColors().darkLight,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                  Row(
                    children: [
                      BigText(text: "Starbuck ", size: 15.sp,color: ThemeColors().kPrimaryTextColor,),
                      Icon(Icons.check_circle, color: ThemeColors().kPrimaryTextColor,size: 10,)
                    ],
                  ),
                  Row(
                    children: [

                      Container(

                          height : 15,
                          width : 15,
                          child: Image.asset(Images.icBike)),
                      SizedBox(
                        width: 5,
                      ),
                      SmallText(
                        text: "Free",
                        size: 12.sp,
                        color: ThemeColors().kSecondaryTextColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(

                          height : 15,
                          width : 15,
                          child: Image.asset(Images.icClock)),
                      SizedBox(
                        width: 5,
                      ),
                      SmallText(
                        text: "10-15 mins",
                        size: 12.sp,
                        color: ThemeColors().kSecondaryTextColor,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 32.h,
                      width: ScreenUtil().screenWidth,
                      child: Align(
                        alignment: Alignment.center,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                child: TagBoxWidget(
                                  tagLAbel: tagBoxLabel[index],

                                  color: ThemeColors().tagBoxColorNew,
                                  textColor: ThemeColors().kPrimaryTextColor, themeValue: 0,
                                ),
                              );
                            }),
                      ),
                    ),
                  ),



                ],
              ),

            )
        ),
      )

     ;
  }
}
