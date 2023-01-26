import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Future<bool?> commonToast(String msg, {String? bgColor, String? color}) {
      return
  Fluttertoast.showToast(
        msg: msg ?? "",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
    }


