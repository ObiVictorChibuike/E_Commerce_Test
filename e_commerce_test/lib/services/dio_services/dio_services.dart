import 'dart:convert';
import 'package:dio/dio.dart';
import '../dio_service_config/dio_client.dart';

class DioServices{
  late Dio dioNetWorkServices;
  DioServices(){
    dioNetWorkServices = DioClient().dio;
  }

  Future<Response> signUp({required String name, required String email, required String password}) async {
    var postBody = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });
    final response = await dioNetWorkServices.post("/api/v1/user/register", data: postBody);
    return response;
  }

  Future<Response> login({required String email, required String password}) async {
    var postBody = jsonEncode({
      'email': email,
      'password': password,
    });
    final response = await dioNetWorkServices.post("/api/v1/user/login", data: postBody);
    return response;
  }

  Future<Response> verifyRegistrationEmail({required String email, required String otp}) async {
    var postBody = jsonEncode({
      "email": email,
      "otp": otp,
    });
    final response = await dioNetWorkServices.post("/api/v1/user/verify-email", data: postBody);
    return response;
  }

}