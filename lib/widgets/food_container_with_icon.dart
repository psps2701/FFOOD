import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:ffood/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/colors.dart';


class FoodVertialContainer extends StatefulWidget {
  String imageUrl;
  String name;
  bool onPressed = false;
  final int themeValue;
   FoodVertialContainer({Key? key, required this.name, required this.imageUrl, this.onPressed  = false, required this.themeValue}) : super(key: key);

  @override
  _FoodVertialContainerState createState() => _FoodVertialContainerState();
}

class _FoodVertialContainerState extends State<FoodVertialContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 98.h,
      decoration:  ShapeDecoration(
          shadows:  [
            BoxShadow(
                color: ThemeColors().outline.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(1, 10))
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(const Radius.circular(40).w)),
          color: widget.onPressed ? orangeColor: ThemeColors().mainColor),
      child: Column(
        children: [
      Padding(
        padding: const EdgeInsets.all(8.0).w,
        child: Container(
        width: 65.w,
        height: 50.h,
        decoration:  ShapeDecoration(
            // shadows: [
            //   BoxShadow(
            //       color: Colors.grey.withOpacity(0.2),
            //       blurRadius: 3,
            //       offset: Offset(1, 10))
            // ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100).w)),
            color: Colors.white),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(90).w,

              child: Image.asset(widget.imageUrl, fit: BoxFit.cover,)),

    ),
      ),
          SmallText( text: widget.name, color: widget.onPressed ? Colors.white : ThemeColors().lightDark,)
        ],
      ),

    );
  }
}
