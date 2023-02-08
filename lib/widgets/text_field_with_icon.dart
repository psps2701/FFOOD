import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themecolor/ThemeColors.dart';
import '../util/colors.dart';


class IconAppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;


  IconAppTextField(
      {Key? key,
        required this.textController,
        required this.icon,
        required this.hintText,
        this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: 230.w,
        // height: 51.h,
        // margin: EdgeInsets.only(
        //     left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
        decoration: BoxDecoration(
            color: ThemeColors().mainColor,
            borderRadius: BorderRadius.circular(20).w,
            border: Border.all(color: ThemeColors().mainColor),
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 3,
            //     spreadRadius: 1,
            //     offset: const Offset(1, 10),
            //     color: Colors.grey.withOpacity(0.2),
            //   )
            // ],
        ),
        child: TextField(
          obscureText: isObscure?true:false,
          controller: textController,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: ThemeColors().kSecondaryTextColor, fontSize: 12.sp),
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              color: ThemeColors().kSecondaryTextColor,
              size: 20.w,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/56.27),
              borderSide:  BorderSide(
                width: 1.0,
                color: ThemeColors().greyBlack,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20).w,
              borderSide: BorderSide(
                width: 1.0,
                color: ThemeColors().greyBlack,
              ),
            ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/56.27),
            //   borderSide: const BorderSide(
            //     width: 1.0,
            //     color: borderColor,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
