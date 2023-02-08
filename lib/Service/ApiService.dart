import 'package:ffood/Models/LoginModel.dart';
import 'package:ffood/helper/singleton.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import 'ApiConstant.dart';


class ApiService {

  static var client = http.Client();
  static Future<LoginModel> login(Map<String, String> params) async {

    Singleton.instance.showDefaultProgress();

    var response = await client.post(
        Uri.parse(ApiConstant.baseURL + ApiConstant.login,),
        body: params);
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      var jsonString = response.body;
      if (kDebugMode) {
        print("responseIs===>$jsonString");
      }
      return loginModelFromJson(jsonString);
    } else {
      //show error message
      var jsonString = response.body;
      if (kDebugMode) {
        print("error===>$jsonString");
        print("error===>${response.statusCode}");
      }
      Singleton.instance.hideProgress();
      return jsonString.isEmpty ? LoginModel(success: false, message: "") : loginModelFromJson(jsonString);
    }
  }


}

