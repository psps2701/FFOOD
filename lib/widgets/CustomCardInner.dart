import 'package:flutter/material.dart';

class CustomCardInner extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color bgColor;
  final double margin;
  final double padding;
  final double borderRadius;
  final double opacity;
  final double spreadRadius;
  final double blurRadius;

  const CustomCardInner({Key? key,
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

      decoration: ShapeDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.4],
          tileMode: TileMode.clamp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
      child: child ,
    );
  }
}
