import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../cached_data/cached_data.dart';
import '../../models/auth_models/user_account_details.dart';
import '../../screens/auth_screen/login_screen.dart';
import '../../screens/auth_screen/verify_email.dart';
import '../../services/dio_service_config/dio_error.dart';
import '../../services/dio_services/dio_services.dart';
import '../../shared_widgets/custom_progress_dialog.dart';
import '../../shared_widgets/flush_bar_helper.dart';


class SignUpController extends GetxController{
  CachedData cachedData = CachedData();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final formKeyConfirmEmail = GlobalKey <FormState>();
  final scaffoldKeyConfirmEmail = GlobalKey <ScaffoldState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmEmailController = TextEditingController();

  String? name, email, password, confirmEmail;

  final emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  signUpUserNow() async {
    if(formKey.currentState!.validate()){
        formKey.currentState!.save();
        var connectivityResult = await Connectivity().checkConnectivity();
        if (!(connectivityResult == ConnectivityResult.none)) {
          registerUser();
        }else {
          FlushBarHelper(Get.context!).showFlushBar("No Internet Connection");
        }
    }
  }

  Future<void> confirmEmailNow() async {
    if(formKeyConfirmEmail.currentState!.validate()){
      formKeyConfirmEmail.currentState!.save();
      var connectivityResult = await Connectivity().checkConnectivity();
      if (!(connectivityResult == ConnectivityResult.none)) {
        otpEmail();
      }else {
        FlushBarHelper(Get.context!).showFlushBar("No Internet Connection");
      }
    }
  }


  @override
  void dispose() {
      nameController.dispose();
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
  }

  bool togglePassword = true;

  void togglePasswordVisibility(){
      togglePassword = !togglePassword;
      update();
  }



  Future <void> registerUser()async{
    ProgressDialogHelper().showProgressDialog(Get.context!, "Authenticating...");
    try{
      await DioServices().signUp(name: name!.trim(), email: email!.trim(), password: password!.trim()).then((value) async{
        ProgressDialogHelper().hideProgressDialog(Get.context!);
        Get.to(()=> const VerifyEmailScreen());
      });
    } on DioError catch (err) {
      ProgressDialogHelper().hideProgressDialog(Get.context!);
      final errorMessage = DioException.fromDioError(err).toString();
      FlushBarHelper(Get.context!).showFlushBar( err.response?.data["errors"][0]["msg"] ?? errorMessage.toString());
      throw errorMessage;
    }catch (err){
      ProgressDialogHelper().hideProgressDialog(Get.context!);
      FlushBarHelper(Get.context!).showFlushBar( err.toString());
      throw err.toString();
    }
  }

  Future <void> otpEmail() async{
    ProgressDialogHelper().showProgressDialog(Get.context!, "Verifying Email...");
    try{
      await DioServices().verifyRegistrationEmail(email: email!.trim(), otp: confirmEmail!.trim()).then((value) async{
        await cachedData.cacheUserDetails(userAccountDetails: UserAccountDetails.fromJson(value.data)).then((value) async{
          await cachedData.cacheLoginStatus(isLoggedIn: true);
          ProgressDialogHelper().hideProgressDialog(Get.context!);
          Get.offAll(()=>const LoginScreen());
          FlushBarHelper(Get.context!).showFlushBar("Registration Complete! Please Login", messageColor: Colors.green, color: Colors.white,
              borderColor: Colors.green, icon: const Icon(Icons.check_circle, color: Colors.green,size: 50,));
        });
      });
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      ProgressDialogHelper().hideProgressDialog(Get.context!);
      FlushBarHelper(Get.context!).showFlushBar(errorMessage);
      throw errorMessage;
    }catch (err){
      ProgressDialogHelper().hideProgressDialog(Get.context!);
      FlushBarHelper(Get.context!).showFlushBar( err.toString());
      throw err.toString();
    }
  }



}