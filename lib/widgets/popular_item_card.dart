import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:ffood/util/app_colors.dart';
import 'package:ffood/util/size_utils.dart';
import 'package:ffood/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/colors.dart';
import '../util/images.dart';
import 'CustomCard.dart';
import 'big_text.dart';


class PopularItemCard extends StatefulWidget {
  final String name;
  final String details;
  final String rating;
  final String reviewsCount;
  final String imageUrl;
  final String price;
  final int themeValue;

  const PopularItemCard( {Key? key, required this.name, required this.details, required this.rating, required this.reviewsCount, required this.imageUrl, required this.price, required this.themeValue,}) : super(key: key);

  @override
  _PopularItemCardState createState() => _PopularItemCardState();
}

class _PopularItemCardState extends State<PopularItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 230.h,
      margin: EdgeInsets.all(10).w,

      decoration:  ShapeDecoration(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        color: ThemeColors().mainColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          ClipRRect(
              borderRadius: BorderRadius.circular(20.0.r),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                // width: 154.w,
                height: 147.h,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // width: MediaQuery.of(context).size.width * 0.2,
                  // height: MediaQuery.of(context).size.height * 0.05,
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration:  ShapeDecoration(
                    // shadows: withShadow == true ? [
                    //   BoxShadow(
                    //     // color: Colors.grey.withOpacity(0.2),
                    //       blurRadius: 3,
                    //       color: greayColor,
                    //       offset: Offset(1, 10))
                    // ]: [],
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.r))),
                      color: ThemeColors().mainColor),
                  child: Padding(
                    padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(
                          text: "\$",
                          size: 18.sp,
                          color: ThemeColors().lightDark,
                        ),
                        SmallText(
                          text: widget.price,
                          size: 18.sp,
                          color: ThemeColors().lightDark,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Container(
                    width: 40.w,
                    height: 38.h,
                    // padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration:  ShapeDecoration(
                      // shadows: withShadow == true
                      //     ? [
                      //         BoxShadow(
                      //             // color: Colors.grey.withOpacity(0.2),
                      //             blurRadius: 3,
                      //             color: greayColor,
                      //             offset: Offset(1, 10))
                      //       ]
                      //     : [],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(100.r))),
                        color: ThemeColors().mainColor),
                    child: Icon(
                      Icons.favorite,
                      color: ThemeColors().mainOrangeWhite,
                      size: 22.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),



          Positioned(
            top:125.h,
            // bottom: 200,
            child: Container(

              padding: const EdgeInsets.all(8.0),
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.2,
                // height: MediaQuery.of(context).size.height * 0.05,
                // padding: EdgeInsets.symmetric(horizontal: 15),

                height: 30,
                child: CustomCard(
                  margin: 0,
                  bgColor: ThemeColors().mainColor,
                  padding: 0,

                  child: Container(

                    margin: getMargin(left: 5,right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(
                          text: widget.rating,
                          size: 12.sp,
                          color: ThemeColors().lightDark,
                        ),
                        Container(
                          margin: getMargin(left: 2,right: 2),
                          child: Image.asset(
                            Images.icStartNew,
                            width: 10.w,
                            height: MediaQuery.of(context).size.height * 0.0177,
                          ),
                        ),
                        SmallText(
                          text: "(${widget.reviewsCount}+)",
                          size: 8.5.sp,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              // width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: ThemeColors().mainColor,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height / 42.2),

              ),
              child: SizedBox(
                width: 200.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0,left: 8.0),
                      child: Row(
                        children: [
                          BigText(
                            text: widget.name,
                            size: 16.sp,
                            color: ThemeColors().lightDark,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 5.0),
                          //   child: Image.asset(
                          //     widget.imageUrl,
                          //     width: 15,
                          //     height: 15,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                        margin: getMargin(left: 10),
                        child: SmallText(text: widget.details,size: 14.sp,textAlign: TextAlign.start,)
                    )
                  ],
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
