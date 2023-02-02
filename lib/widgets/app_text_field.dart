import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:flutter/material.dart';
import '../../util/colors.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_storage/get_storage.dart';

import '../util/get_storage_key.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final textInputType;
  bool isObscure;
  bool isPass;



  AppTextField(
      {Key? key,
        required this.textController,
        required this.hintText,
        required this.textInputType,
        this.isPass = false,
        this.isObscure = false,
      })
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      // padding: EdgeInsets.all(10),
      style: NeumorphicStyle(
          shape: GetStorage().read(GetStorageKey.IS_DARK_MODE)  ? NeumorphicShape.concave : NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: GetStorage().read(GetStorageKey.IS_DARK_MODE) ? -4 : 0,
          intensity:GetStorage().read(GetStorageKey.IS_DARK_MODE)  ?  0.7 : 0,
          lightSource: LightSource.top,
          color: GetStorage().read(GetStorageKey.IS_DARK_MODE)  ?darkThemeContainerColor :  Colors.white.withOpacity(0.8)
      ),
      child: TextField(
        obscureText: widget.isObscure ? true : false,
        controller: widget.textController,
        keyboardType: widget.textInputType,
        style: TextStyle(color: ThemeColors().kPrimaryTextColor),
        decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: widget.isPass ? true  :false,
            child: GestureDetector(
                onTap: (){
                  setState(() {
                    widget.isObscure = !widget.isObscure;
                  });
                },
                child: const Icon(Icons.remove_red_eye, color: passwordObsecureColor,)),
          ),
          hintStyle:  TextStyle(color: hintTextColor, fontSize: MediaQuery.of(context).size.height/52.75),
          hintText: widget.hintText,

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
            borderSide: const BorderSide(
              width: 2.0,
              color: orangeColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
            borderSide:  BorderSide(
              width: 2.0,
              color: GetStorage().read(GetStorageKey.IS_DARK_MODE)  ? darkThemeContainerColor : textFieldBorderColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/75.27),
            borderSide: const BorderSide(
              width: 2.0,
              color: Colors.blue,
            ),
          ),
        ),
      )

      // Container(
      //   width: double.infinity,
      //   margin: EdgeInsets.only(
      //       left: MediaQuery.of(context).size.height/90.2, right: MediaQuery.of(context).size.height/90.2),
      //   decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/80.27),
      //
      //
      //   ),
      //   child: ,
      // ),
    );
  }
}
