
import 'package:e_commerce_test/screens/auth_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_theme.dart';
import '../../controllers/auth_controller/login-controller.dart';
import '../../shared_widgets/custom_button_widget.dart';
import '../../shared_widgets/custom_formfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
        builder: (controller){
      return SafeArea(top: false, bottom: false,
          child: Scaffold(key: _controller.scaffoldKey, resizeToAvoidBottomInset: false,
            body: Form(key: _controller.formKey,
              child: Column(
                children: [
                  Container(height: MediaQuery.of(context).size.height/3, width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/png_images/landing_page.png'), fit: BoxFit.cover,)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60,),
                          Container(
                            height: MediaQuery.of(context).size.width / 10,
                            width: MediaQuery.of(context).size.width / 10,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/png_images/logo.png')
                                )
                            ),
                          ),
                          const SizedBox(height: 70,),
                          const Text('Welcome Back!', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24, color: kWhite),),
                          const SizedBox(height: 18,),
                          const Text('Login', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, color: kWhite),),
                        ],
                      ),
                    ),
                  ),
                  Align(alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.5, width: double.maxFinite,
                      decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.only(topLeft: const Radius.circular(40), topRight: Radius.circular(40),)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0,right: 37, top: 40),
                        child: Column(
                          children: [
                            FormFieldWidget(
                              hintText: "Enter Email",
                              controller: _controller.emailController,
                              onChanged: (value){
                                _controller.email = value;
                              },
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Email form cannot be empty';
                                }
                                // else if (!_controller.emailValidator.hasMatch(value)){
                                //   return 'Please, provide a valid email';
                                // }
                                else {
                                  return null;
                                }
                              },
                            ),
                            const  SizedBox(height: 16,),
                            FormFieldWidget(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: IconButton(onPressed: (){
                                _controller.togglePasswordVisibility();
                              }, icon: Icon(_controller.togglePassword == true ? Icons.visibility_off : Icons.visibility)),
                              hintText: "Enter Password",
                              obscureText: _controller.togglePassword,
                              controller: _controller.passwordController,
                              onChanged: (value){
                                _controller.password = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }else {
                                // else if (value.length < 8) {
                                //   return 'Password must be up to 8 characters';
                                // }
                                // else if (!value.contains(RegExp(r"[A-Z]"))){
                                //   return 'Password must contain at least one uppercase';
                                // }
                                // else if (!value.contains(RegExp(r"[a-z]"))){
                                //   return 'Password must contain at least one lowercase';
                                // }else if (!value.contains(RegExp(r"[0-9]"))){
                                //   return 'Password must contain at least one number';
                                // }
                                return null;
                              }
                              }
                            ),
                            const SizedBox(height: 60,),
                            ButtonWidget(
                                onPressed: (){
                                  _controller.loginUserNow();
                                },
                                buttonText: "Login", height: 50,
                                width: double.maxFinite
                            ),
                            const SizedBox(height: 15),
                            Align(alignment: Alignment.bottomCenter,
                              child: InkWell(onTap: (){
                                Get.offAll(()=>const SignUpScreen());
                              },
                                child: RichText(textAlign: TextAlign.center, text: const TextSpan(text: "Don't Have an Account ?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14,),
                                    children: [
                                      TextSpan(text: "Register", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, decoration: TextDecoration.underline)),
                                    ]
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      );
    });
  }
}
