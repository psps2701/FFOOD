import 'package:ffood/util/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  String btntxt;
  final GestureTapCallback? press;

  ButtonWidget(this.btntxt, {this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 250.0,
                  height: 60.0,
                  color: AppColors.themeColor,
                  child: Text(
                    btntxt,
                    style: TextStyle(fontSize: 22.0, color: AppColors.pendingColor),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  onPressed: press,
                ),

              ],
            )));
  }
}
