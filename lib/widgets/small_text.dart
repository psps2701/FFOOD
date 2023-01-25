import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  FontWeight fontWeight;
  TextAlign textAlign;

  SmallText(
      {Key? key,
        this.color = const Color(0xFFccc7c5),
        required this.text,
        this.overflow = TextOverflow.ellipsis,
        this.height = 1.2,
        this.fontWeight = FontWeight.normal,
        this.size = 12,
        this.textAlign = TextAlign.center,

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 50,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: size,
          fontFamily: 'Sofiapro',
          height: height,

      ),
    );
  }
}
