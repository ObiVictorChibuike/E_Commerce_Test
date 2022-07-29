// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.user,
  });

  User? user;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}

class User {
  User({
    this.message,
    this.success,
    this.statusCode,
    this.data,
  });

  String? message;
  bool? success;
  int? statusCode;
  Data? data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    message: json["message"],
    success: json["success"],
    statusCode: json["statusCode"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "statusCode": statusCode,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.token,
    this.userId,
  });

  String? token;
  String? userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "userId": userId,
  };
}
