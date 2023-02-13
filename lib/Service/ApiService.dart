import 'package:ffood/Models/LoginModel.dart';
import 'package:ffood/Models/SearchRestaurantsModel.dart';
import 'package:ffood/helper/singleton.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

import '../Models/HomeResponseModel.dart';
import 'ApiConstant.dart';


class ApiService {

  static var client = http.Client();
  static Future<LoginModel> login(Map<String, String> params) async {

    var response = await client.post(
        Uri.parse(ApiConstant.baseURL + ApiConstant.login,),
        body: params);
    if (response.statusCode == 200) {

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

      return jsonString.isEmpty ? LoginModel(success: false, message: "") : loginModelFromJson(jsonString);
    }
  }

  static Future<HomeResponseModel> home(Map<String, String> params) async {

    Singleton.instance.showDefaultProgress();

    var response = await client.post(
        Uri.parse(ApiConstant.baseURL + ApiConstant.home,),
        body: params);
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      var jsonString = response.body;
      if (kDebugMode) {
        print("responseIs===>$jsonString");
      }
      return homeResponseModelFromJson(jsonString);
    } else {
      //show error message
      var jsonString = response.body;
      if (kDebugMode) {
        print("error===>$jsonString");
        print("error===>${response.statusCode}");
      }
      Singleton.instance.hideProgress();
      return jsonString.isEmpty ? HomeResponseModel(success: false, message: "") : homeResponseModelFromJson(jsonString);
    }
  }

  static Future<SearchRestaurantsModel> searchRestaurants(Map<String, String> params) async {

    Singleton.instance.showDefaultProgress();

    var response = await client.post(
        Uri.parse(ApiConstant.baseURL + ApiConstant.search_restaurants,),
        body: params);
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      var jsonString = response.body;
      if (kDebugMode) {
        print("responseIs===>$jsonString");
      }
      return searchRestaurantsModelFromJson(jsonString);
    } else {
      //show error message
      var jsonString = response.body;
      if (kDebugMode) {
        print("error===>$jsonString");
        print("error===>${response.statusCode}");
      }
      Singleton.instance.hideProgress();
      return jsonString.isEmpty ? SearchRestaurantsModel(success: false, message: "") : searchRestaurantsModelFromJson(jsonString);
    }
  }

  static Future<SearchRestaurantsModel> searchRestaurantsbySlug(Map<String, String> params) async {

    Singleton.instance.showDefaultProgress();

    var response = await client.post(
        Uri.parse(ApiConstant.baseURL + ApiConstant.search_restaurants,),
        body: params);
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      var jsonString = response.body;
      if (kDebugMode) {
        print("responseIs===>$jsonString");
      }
      return searchRestaurantsModelFromJson(jsonString);
    } else {
      //show error message
      var jsonString = response.body;
      if (kDebugMode) {
        print("error===>$jsonString");
        print("error===>${response.statusCode}");
      }
      Singleton.instance.hideProgress();
      return jsonString.isEmpty ? SearchRestaurantsModel(success: false, message: "") : searchRestaurantsModelFromJson(jsonString);
    }
  }

  static Future<SearchRestaurantsModel> searchRestaurantsbyId(Map<String, String> params) async {

    Singleton.instance.showDefaultProgress();

    var response = await client.post(
        Uri.parse(ApiConstant.baseURL + ApiConstant.search_restaurants,),
        body: params);
    if (response.statusCode == 200) {
      SVProgressHUD.dismiss();
      var jsonString = response.body;
      if (kDebugMode) {
        print("responseIs===>$jsonString");
      }
      return searchRestaurantsModelFromJson(jsonString);
    } else {
      //show error message
      var jsonString = response.body;
      if (kDebugMode) {
        print("error===>$jsonString");
        print("error===>${response.statusCode}");
      }
      Singleton.instance.hideProgress();
      return jsonString.isEmpty ? SearchRestaurantsModel(success: false, message: "") : searchRestaurantsModelFromJson(jsonString);
    }
  }


}

