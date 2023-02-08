import 'package:ffood/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  String? label, hint;
  TextInputType? tbtype;
  TextEditingController? controller;
  bool? pass;
  FormFieldValidator<String> validate;

  TextFieldWidget(this.label, this.hint, this.tbtype, this.pass, this.validate);

  TextFieldWidget.a(this.label, this.hint, this.tbtype, this.pass,
      this.controller, this.validate);

  /*@override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width/100.0,
            bottom: MediaQuery.of(context).size.height / 200.0,
            top: MediaQuery.of(context).size.height / 50.0),
        child: AutoSizeText(
          label,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16.0,
              fontFamily: AppFood.regular,
              color: HexColor(greycolor)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
              ),
            ],
            color: mywhite),
        //height:MediaQuery.of(context).size.height/14,
        child: TextFormField(

          obscureText: pass,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              fillColor: mywhite,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: HexColor("f4b439")),
              ),
              border: InputBorder.none,
              hintStyle: TextStyle(color: textboxhint,fontSize:15.0),
              hintText: hint),
          validator: (val) {
            if (val.length == 0) {
              return  "$label can not be Empty";
            } else {
              return null;
            }
          },
          keyboardType: tbtype,
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: AppFood.regular,
          ),
        ),
      ),
        ],
      )
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 100.0,
              bottom: MediaQuery.of(context).size.height / 200.0,
              top: MediaQuery.of(context).size.height / 50.0),
          child: Text(
            label!,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16.0, color: AppColors.acceptColor),
          ),
        ),
        Stack(children: [
          Container(
            height: 49.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                  ),
                ],
                color: AppColors.white),
          ),
          TextFormField(
            controller: controller,
            obscureText: pass!,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                fillColor: Colors.transparent,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: AppColors.white),
                ),
                border: InputBorder.none,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.red),
                ),
                hintStyle:
                    TextStyle(color: AppColors.themeColor, fontSize: 15.0),
                hintText: hint),
            validator: validate,
            keyboardType: tbtype,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ]),

        //height:MediaQuery.of(context).size.height/14,
      ],
    ));
  }
}
