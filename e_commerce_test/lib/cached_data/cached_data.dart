import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_models/user_account_details.dart';



class CachedData{

  Future<String?> getAuthToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    return token;
  }

  Future<void> cacheAuthToken({required String? token}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token!);
  }

  Future<void> cachePassword({required String? password}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("password", password!);
  }

  Future<String?> getPassword() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? password = sharedPreferences.getString("password");
    return password;
  }

  Future<void> cacheUserDetails({required UserAccountDetails userAccountDetails }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("user_account_details", json.encode(userAccountDetails.toJson()));
  }

  Future<UserAccountDetails?> getUserDetails() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString("user_account_details");
    return userData == null ? null : UserAccountDetails.fromJson(jsonDecode(userData));
  }

  Future<bool> getLoginStatus() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    bool? userData = sharedPreferences.getBool("isLoggedIn");
    return userData ?? false;
  }

  Future<void> cacheLoginStatus({required bool isLoggedIn}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLoggedIn", isLoggedIn);
  }
  //
  // Future<bool> getLoginStatus() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   bool? userData = sharedPreferences.getBool("isLoggedIn");
  //   return userData ?? false;
  // }
  //
  // Future<void> cacheLoginStatus({required bool isLoggedIn}) async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setBool("isLoggedIn", isLoggedIn);
  // }

// Future<void> saveUserDetails({required UserDetails userDetails}) async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.setString("saveUserDetails", jsonEncode(userDetails.toJson()));
// }
// Future<UserDetails> fetchUserDetails() async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   String? userData = sharedPreferences.getString("saveUserDetails");
//   return UserDetails.fromJson(jsonDecode(userData!));
// }

}