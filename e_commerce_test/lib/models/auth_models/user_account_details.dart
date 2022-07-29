// To parse this JSON data, do
//
//     final userAccountDetails = userAccountDetailsFromJson(jsonString);

import 'dart:convert';

UserAccountDetails userAccountDetailsFromJson(String str) => UserAccountDetails.fromJson(json.decode(str));

String userAccountDetailsToJson(UserAccountDetails data) => json.encode(data.toJson());

class UserAccountDetails {
  UserAccountDetails({
    this.user,
  });

  User? user;

  factory UserAccountDetails.fromJson(Map<String, dynamic> json) => UserAccountDetails(
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
    this.id,
    this.name,
    this.email,
    this.otp,
    this.verified,
    this.wallet,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  String? email;
  String? otp;
  bool? verified;
  int? wallet;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    otp: json["otp"],
    verified: json["verified"],
    wallet: json["wallet"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "otp": otp,
    "verified": verified,
    "wallet": wallet,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
