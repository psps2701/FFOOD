import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color bgColor;
  final double margin;
  final double padding;
  final double borderRadius;
  final double opacity;
  final double spreadRadius;
  final double blurRadius;

  const CustomCard({Key? key,
    required this.child,
    this.color = Colors.grey,
    this.bgColor =  Colors.white,
    this.margin =  10,
    this.padding = 10,
    this.borderRadius = 10,
    this.opacity = 0.5,
    this.spreadRadius = 1,
    this.blurRadius = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      margin:  EdgeInsets.all(margin),
      padding:  EdgeInsets.all(padding),

      decoration: BoxDecoration(

        color: ThemeColors().mainColor,
        borderRadius: BorderRadius.circular(borderRadius), //border corner radius
        boxShadow:[
          BoxShadow(
            color: ThemeColors().kSecondaryTextColorReverse.withOpacity(opacity), //color of shadow
            spreadRadius: spreadRadius, //spread radius
            blurRadius: blurRadius, // blur radius
            offset: const Offset(0, 2), // changes position of shadow
            //first Parameter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: child ,
    );
  }
}
