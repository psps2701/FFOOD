

import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:flutter/material.dart';


import '../util/images.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          width: 38,
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration:  ShapeDecoration(
              shadows: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.25),
                )
              ],
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(10))),
              color: ThemeColors().mainColor),
         // child:   Icon(Icons.arrow_back_ios, size: 15,color: blackColor),
          child:   Image.asset(Images.icBack,color: ThemeColors().lightDark,),
        ),
      ),
    );
  }
}