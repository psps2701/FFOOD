import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.data,
    required this.success,
    required this.message,
  });

  UserData? data;
  bool success;
  String message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    data: UserData.fromJson(json["data"]),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "success": success,
    "message": message,
  };
}

class UserData {
  UserData({
    this.id,
    this.authToken,
    this.name,
    this.email,
    this.phone,
    this.defaultAddressId,
    this.defaultAddress,
    this.walletBalance,
    this.avatar,
    this.taxNumber,
    this.runningOrder,
  });

  int? id;
  String? authToken;
  String? name;
  String? email;
  String? phone;
  int? defaultAddressId;
  DefaultAddress? defaultAddress;
  dynamic walletBalance;
  String? avatar;
  String? taxNumber;
  String? runningOrder;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    authToken: json["auth_token"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    defaultAddressId: json["default_address_id"],
    defaultAddress: DefaultAddress.fromJson(json["default_address"]),
    walletBalance: json["wallet_balance"],
    avatar: json["avatar"],
    taxNumber: json["tax_number"],
    runningOrder: json["running_order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "auth_token": authToken,
    "name": name,
    "email": email,
    "phone": phone,
    "default_address_id": defaultAddressId,
    "default_address": defaultAddress?.toJson(),
    "wallet_balance": walletBalance,
    "avatar": avatar,
    "tax_number": taxNumber,
    "running_order": runningOrder,
  };
}

class DefaultAddress {
  DefaultAddress({
    this.address,
    this.house,
    this.latitude,
    this.longitude,
    this.tag,
  });

  String? address;
  String? house;
  String? latitude;
  String? longitude;
  String? tag;

  factory DefaultAddress.fromJson(Map<String, dynamic> json) => DefaultAddress(
    address: json["address"],
    house: json["house"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "house": house,
    "latitude": latitude,
    "longitude": longitude,
    "tag": tag,
  };
}
