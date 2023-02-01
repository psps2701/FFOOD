import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../util/colors.dart';
import 'inner_shadow.dart';

class ImageContainer extends StatefulWidget {
  String imageName;
  bool withShadow = false;
  double width;
  double height;
  bool isPressed;
  double padding;
  final int themeValue;

   ImageContainer( {Key? key, this.padding = 0 ,required this.imageName, this.withShadow = false, required this.height, required this.width, this.isPressed = false, required this.themeValue}) : super(key: key);

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      blur: 5,
      color:  widget.isPressed == true ? ThemeColors().outline.withOpacity(0.3) : ThemeColors().outline.withOpacity(0.3),
      offset: const Offset(0.5, 0.5),
      child: Container(
        width: widget.width,
        height: widget.height,
        // padding: EdgeInsets.symmetric(horizontal: 15),
        decoration:  ShapeDecoration(

            shadows: [
               BoxShadow(
                color: ThemeColors().outline.withOpacity(0.3),
              ),
               BoxShadow(
                color: ThemeColors().outline.withOpacity(0.3),
                spreadRadius: -5.0,
                blurRadius: 10.0,
              ),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            color: widget.isPressed ? orangeColor:ThemeColors().mainColor),
        child: Container(
            padding: EdgeInsets.all(widget.padding),
            child: Image.asset(widget.imageName, color: widget.isPressed ? ThemeColors().kSecondaryTextColorReverse:ThemeColors().tagBoxColor,)),
      ),
    );
  }
}
