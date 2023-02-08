import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';
import '../Models/LoginModel.dart';
import '../Route/Routes.dart';
import 'SharedKey.dart';
import 'constant.dart';

class Singleton {
  Singleton._privateConstructor();

  static final Singleton _instance = Singleton._privateConstructor();

  static Singleton get instance => _instance;

  bool isDarkMode = false;
  bool isRemember = false;
  double screenWidth = 0.0;
  String? authToken = "";
  String fcmToken = "";
  String cartCount = "";
  String wishListCount = "";
  String? role = "";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setUserData(String user) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(SharedKey.userData, user);
  }



  Future<UserData> getUserData() async {
    final SharedPreferences prefs = await _prefs;
    Map<String, dynamic> result =
        jsonDecode(prefs.getString(SharedKey.userData).toString());
    // print("user data is ===> ${result}");

    return UserData.fromJson(result);
  }

  Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString(SharedKey.authToken);
    return token;
  }

  Future<void> setAuthToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(SharedKey.authToken, token);

    authToken = prefs.getString(SharedKey.authToken)!;
  }

  void showToast(BuildContext context, String content) {
    SnackBar snackBar = SnackBar(content: Text(content));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //PROGRESS HUD
  void customizationSVProgressHUD() {
    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.custom);
    SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.light);
    SVProgressHUD.setBackgroundLayerColor(Colors.black54);
    SVProgressHUD.setBackgroundColor(Colors.transparent);
    SVProgressHUD.setForegroundColor(Colors.orange);
    SVProgressHUD.setRingRadius(18);
    SVProgressHUD.setRingThickness(2.5);
    SVProgressHUD.setCornerRadius(10);
  }

  void showDefaultProgress() {
    SVProgressHUD.show();
  }

  void showProgressWithTitle(String title) {
    SVProgressHUD.show(status: title);
  }

  void hideProgress() {
    SVProgressHUD.dismiss();
  }





  //MODAL BOTTOM SHEET
  void showBottomSheet(BuildContext context, Widget childWidget) {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Wrap(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: childWidget,
          )
        ]);
      },
    );
  }

  void logoutUser() async {
    //CLEAR ALL DATA BEFORE LOGOUT
    // Singleton.instance.fcmToken = "";
    // Singleton.instance.connectivity.disposeStream();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAllNamed(Routes.loginScreen);
  }

  showLogoutConfirmation(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        Singleton.instance.logoutUser();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Logout !"),
      content: const Text("Are you sure want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showExitConfirmation(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        SystemNavigator.pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Exit !"),
      content: const Text("Are you sure want to Exit?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //DATE PICKER
  Future<DateTime?> presentDatePicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );

    return pickedDate;
  }

  //ALERT DIALOG
  Future<bool?> showAlertDialogWithOptions(
      BuildContext context,
      String title,
      String message,
      String positiveOption,
      String negativeOption,
      Function doNegativeAction,
      Function dopositiveAction) async {
    return await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.light(),
          child: AlertDialog(
            title: Text(
              title,
            ),
            content: Text(
              message,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  negativeOption,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                onPressed: () {
                  doNegativeAction(context);
                },
              ),
              TextButton(
                child: Text(
                  positiveOption,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                onPressed: () {
                  dopositiveAction(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  //ALERT DIALOG
  Future<bool?> cancelOrderDialog(
      BuildContext context,
      String title,
      TextEditingController _textFieldController,
      String positiveOption,
      String negativeOption,
      Function doNegativeAction,
      Function dopositiveAction) async {
    return await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.light(),
          child: AlertDialog(
            title: Text(
              title,
            ),
            content: TextField(
              onChanged: (value) {},
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Reason"),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  negativeOption,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                onPressed: () {
                  doNegativeAction(context);
                },
              ),
              TextButton(
                child: Text(
                  positiveOption,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                onPressed: () {
                  dopositiveAction(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  //ALERT DIALOG
  Future<bool?> showAlertDialogWithParam(
      BuildContext context,
      String title,
      String message,
      String positiveOption,
      String negativeOption,
      Function(String, int) dopositiveAction,
      String id,
      int index) async {
    return await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.light(),
          child: AlertDialog(
            title: Text(
              title,
            ),
            content: Text(
              message,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  negativeOption,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  positiveOption,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                onPressed: () {
                  Navigator.of(context).pop();

                  dopositiveAction(id, index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool?> showExitAlertDialogWithOptions(
    BuildContext context,
    String title,
    String message,
    String positiveOption,
    String negativeOption,
  ) async {
    return await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.light(),
          child: AlertDialog(
            title: Text(
              title,
            ),
            content: Text(
              message,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  negativeOption,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  positiveOption,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  TextStyle setTextStyle({
    double fontSize = 15,
    Color textColor = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = Constant.fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  //SNACK DIALOG
  Future<void> showSnackBar(BuildContext context, String message) async {
    SnackBar snackbar = SnackBar(
        content: Text(
      message,
      style: Singleton.instance.setTextStyle(textColor: Colors.white),
    ));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  //ALERT DIALOG
  Future<void> showAlertDialogWithOkAction(
      BuildContext context, String title, String content) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return Theme(
          data: ThemeData.light(),
          child: AlertDialog(
            title: Text(
              title,
              style: Singleton.instance.setTextStyle(
                  fontSize: TextSize.text_16,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.black),
            ),
            content: Text(
              content,
              style: Singleton.instance.setTextStyle(
                  fontSize: TextSize.text_16, textColor: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Ok",
                  style: Singleton.instance.setTextStyle(
                      fontWeight: FontWeight.bold, textColor: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> sessionExpiredDialog(
      BuildContext context, String title, String content) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return Theme(
          data: ThemeData.light(),
          child: AlertDialog(
            title: Text(
              title,
              style: Singleton.instance.setTextStyle(
                  fontSize: TextSize.text_16,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.black),
            ),
            content: Text(
              content,
              style: Singleton.instance.setTextStyle(
                  fontSize: TextSize.text_16, textColor: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Ok",
                  style: Singleton.instance.setTextStyle(
                      fontWeight: FontWeight.bold, textColor: Colors.black),
                ),
                onPressed: () {
                  Singleton.instance.logoutUser();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void openDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('MaxShop Customer'),
        content: const Text('Token Expired'),
        actions: [
          TextButton(
            child: const Text("Ok"),
            onPressed: () => logoutUser(),
          ),
        ],
      ),
    );
  }


  void showDialogOk(String title,String content,String buttonName) {
    Get.dialog(
      AlertDialog(
        title:  Text(title),
        content:  Text(content),
        actions: [
          TextButton(
            child:  Text(buttonName),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
  void showDialogOkWithAction(String title,String content,String buttonName,Function action) {
    Get.dialog(
      AlertDialog(
        title:  Text(title),
        content:  Text(content),
        actions: [
          TextButton(
            child:  Text(buttonName),
            onPressed: ()  {
              Get.back();
              action();},
          ),
        ],
      ),
    );
  }
  void showDialogWithBackOk(String title,String content,String buttonName) {
    Get.dialog(

      AlertDialog(
        title:  Text(title),
        content:  Text(content),
        actions: [
          TextButton(
            child:  Text(buttonName),
            onPressed: () {
              Get.back();
              Get.back();
            },
          ),
        ],
      ),
    );
  }


  void ratingDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('MaxShop Customer'),
        content: const Text('Product Reviewed Successfully.'),
        actions: [
          TextButton(
            child: const Text("Ok"),
            onPressed: () => {Get.back()},
          ),
        ],
      ),
    );
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

}
