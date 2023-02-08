import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:ffood/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/colors.dart';
import 'big_text.dart';


class ResturentProfileListCard extends StatefulWidget {
  final int themeValue;
  final String name;
  const ResturentProfileListCard({Key? key, required this.name, required this.themeValue}) : super(key: key);

  @override
  _ResturentProfileListCardState createState() => _ResturentProfileListCardState();
}

class _ResturentProfileListCardState extends State<ResturentProfileListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ThemeColors().mainColor,
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 10,),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0).w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80.w,
                    height: 25.h,
                    padding: EdgeInsets.only(right: 16, bottom: 3).r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: orangeColor

                    ),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: BigText(text: "8€", color: Colors.white, size: 18.sp,)),
                  ),
                  SizedBox(height: 3.h,),
                ],
              ),
            ),

            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: const Offset(2, 10),
                      color: Colors.grey.withOpacity(0.2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/pizza.png", color: orangeColor, width: 20.w,),
              ),
            )

          ],),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              // width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BigText(text: widget.name, color: widget.themeValue == 1 ? ThemeColors().kPrimaryTextColor: ThemeColors().kPrimaryTextColor,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: SmallText(text: "Features tomatoes, mozzarella from Campania basil, and extra virgin olive oil.", size: 9.sp,color: ThemeColors().kPrimaryTextColor,))
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
