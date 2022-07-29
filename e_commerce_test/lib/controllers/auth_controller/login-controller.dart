import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../cached_data/cached_data.dart';
import '../../models/auth_models/login_response_model.dart';
import '../../screens/item/items_screen.dart';
import '../../services/dio_service_config/dio_error.dart';
import '../../services/dio_services/dio_services.dart';
import '../../shared_widgets/custom_progress_dialog.dart';
import '../../shared_widgets/flush_bar_helper.dart';

class LoginController extends GetxController{
  CachedData cachedData = CachedData();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  String? email, password;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool togglePassword = true;

  void togglePasswordVisibility(){
    togglePassword = !togglePassword;
    update();
  }

  Future<void> loginUserNow() async {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var connectivityResult = await Connectivity().checkConnectivity();
      if (!(connectivityResult == ConnectivityResult.none)) {
        loginUser();
      }else {
        FlushBarHelper(Get.context!).showFlushBar("No Internet Connection");
      }
    }
  }


  Future <void> loginUser()async{
    ProgressDialogHelper().showProgressDialog(Get.context!, "Authenticating...");
    try{
      await DioServices().login(email: email!.trim(), password: password!.trim()).then((value) async{
        final response = LoginResponseModel.fromJson(value.data);
        await cachedData.cacheAuthToken(token: response.user?.data?.token).then((value){
          ProgressDialogHelper().hideProgressDialog(Get.context!);
          Get.to(()=> const ItemsScreen());
        });
      });
    } on DioError catch (err) {
      ProgressDialogHelper().hideProgressDialog(Get.context!);
      final errorMessage = DioException.fromDioError(err).toString();
      FlushBarHelper(Get.context!).showFlushBar( err.response?.data["user"]["message"] ?? errorMessage.toString());
      throw errorMessage;
    }catch (err){
      ProgressDialogHelper().hideProgressDialog(Get.context!);
      FlushBarHelper(Get.context!).showFlushBar( err.toString());
      throw err.toString();
    }
  }
}