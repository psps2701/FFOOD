import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:ffood/util/size_utils.dart';
import 'package:ffood/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/colors.dart';
import 'big_text.dart';


class AddressItemCard extends StatefulWidget {
 final String name;
 final String details;
 final String rating;
 final String reviewsCount;
 final String imageUrl;
 final String price;
 final int themeValue;
  const AddressItemCard({Key? key, required this.name, required this.details, required this.rating, required this.reviewsCount, required this.imageUrl, required this.price, required this.themeValue}) : super(key: key);

  @override
  _AddressItemCardState createState() => _AddressItemCardState();
}

class _AddressItemCardState extends State<AddressItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: size.width,
      height: 120.h,

      decoration:  ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        color: ThemeColors().greyBlack,
      ),
      child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10,top: 20),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0.r),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.fill,
                  width: 60.w,
                  height: 60.h,
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height:10.h),
              BigText(text: "Home",color: ThemeColors().kPrimaryTextColor,),
                SizedBox(height:10.h),
              SmallText(text: "542-154-5184",color: ThemeColors().kSecondaryTextColor,size: 13.sp,),
                SizedBox(height:10.h),
              SmallText(text: "4261 Kembery Drive, Chicago, LSA",color: ThemeColors().kSecondaryTextColor,size: 13.sp),

            ],),
          ),
          SizedBox(height: 15.h,),

        ],
      ),
    );
  }
}
