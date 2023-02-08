import 'package:flutter/material.dart';

class Constant {
  static const String fontFamily = "Lato";

  static SizedBox sideMenuWidthBox = const SizedBox(width: 16.0);
  static SizedBox sideMenuHeightBox = const SizedBox(height: 8.0);


  static int fromNotification = 0;
  static String privacyURL = "";
  static String termsURL = "";

  static String appName = "Food";
  static String pleaseWait = "please Wait";
  static String fetchingData = "fetching Data";
  static String alert = "Alert";
  static String noInternet = "Please check your internet connection and try again.";
  static String failureError = "Sorry we are unable to connect with the server, please try again later";
}

class URLs {
  static String contactUs = "";
}

class Language {
  static String hindi = "hi";
  static String english = "en";
  static String arabic = "ar";
}

//**** GLOBAL STYLE AND DECORATION ****

class GlobalStyleAndDecoration {
  static BoxDecoration textFieldBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
  );

  static BoxShadow boxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 5,
    blurRadius: 7,
    offset: const Offset(0, 3), // changes position of shadow
  );

  static BoxDecoration bottomShadowDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12),
    ),
  );

  static BoxDecoration shadowDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
    borderRadius: BorderRadius.circular(12),
  );

  static InputDecoration textFieldDecoration = const InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      hintText: "Enter full name");

  //THEME DATA
  static ThemeData appThemeData = ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.deepOrange,
    fontFamily: Constant.fontFamily,
    brightness: Brightness.light,
  );

  //ELEVATED BUTTON THEME DATA
  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
  );

  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
  );
}

class Size {
  static const SizedBox buttonBox = SizedBox(height: 10);
  static const EdgeInsets buttonPadding =
      EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 20.0);
}

class TextSize {
  static const double text_10 = 10;
  static const double text_11 = 11;
  static const double text_12 = 12;
  static const double text_13 = 13;
  static const double text_14 = 14;
  static const double text_15 = 15;
  static const double text_16 = 16;
  static const double text_17 = 17;
  static const double text_18 = 18;
  static const double text_19 = 19;
  static const double text_20 = 20;
  static const double text_21 = 21;
  static const double text_22 = 22;
  static const double text_23 = 23;
  static const double text_24 = 24;
  static const double text_25 = 25;
  static const double text_26 = 26;
  static const double text_27 = 27;
  static const double text_28 = 28;
  static const double text_29 = 29;
  static const double text_30 = 30;
  static const double text_40 = 40;
}
