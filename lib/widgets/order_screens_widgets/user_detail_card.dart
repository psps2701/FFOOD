import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../themecolor/ThemeColors.dart';
import '../../util/colors.dart';
import '../big_text.dart';
import '../small_text.dart';
class UserDetailCard extends StatefulWidget {
  const UserDetailCard({Key? key}) : super(key: key);

  @override
  _UserDetailCardState createState() => _UserDetailCardState();
}

class _UserDetailCardState extends State<UserDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SmallText(text: "Details", size: 18.sp, fontWeight: FontWeight.w600,color: ThemeColors().kPrimaryTextColor,),
        ),
        SizedBox(height: 5.h,),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SmallText(text: "6391 Elgin St. Celina, Delaware 10299", size: 14.sp, fontWeight: FontWeight.w500,color: ThemeColors().kSecondaryTextColor,),
        ),

        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
              child: Container(
                height: 41.h,
                width: 41.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage(
                      "assets/order_user.png",
                    ),)
                ),
              ),
            ),
            Column(
              children: [
                SmallText(text: "ID: DKS-501F9", size: 12.sp, fontWeight: FontWeight.w500,color: ThemeColors().kSecondaryTextColor,),
                BigText(text: "Farion Wick", size: 16,color: ThemeColors().kPrimaryTextColor,),

              ],
            ),
            Expanded(child: Container()),

            Column(
              children: [
                SizedBox(height: 10.h,),
                SizedBox(
                  height: 45.h,
                  width: 88.w,
                  child: Image.asset("assets/call_button.png"),
                ),
              ],
            )

          ],
        )
      ],
    );
  }
}
