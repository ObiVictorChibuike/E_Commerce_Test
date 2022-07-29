
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_theme.dart';
import '../../controllers/auth_controller/sign_up_controller.dart';
import '../../shared_widgets/custom_button_widget.dart';
import '../../shared_widgets/custom_formfield_widget.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _controller = Get.put(SignUpController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
        builder: (controller){
      return SafeArea(top: false, bottom: false,
        child: Scaffold(resizeToAvoidBottomInset: false, key: _controller.scaffoldKey,
          body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Text('Welcome', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24, color: kWhite),),
                    const SizedBox(height: 18,),
                    const Text('Complete your registration', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, color: kWhite),),
                  ],
                ),
              ),
            ),
              Expanded(
                child: Form(
                  key: _controller.formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 37, top: 40),
                      child: Column(
                        children: [
                          FormFieldWidget(
                            hintText: "Enter Name",
                            controller: _controller.nameController,
                            onChanged: (value){
                              _controller.name = value;
                            },
                            validator: (value) => (value!.isEmpty? "Please enter your last name" : null),
                          ),
                          const SizedBox(height: 16,),
                          FormFieldWidget(
                            hintText: "Enter Email",
                            controller: _controller.emailController,
                            onChanged: (value){
                              _controller.email = value;
                            },
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Email form cannot be empty';
                              } else if (!_controller.emailValidator.hasMatch(value)){
                                return 'Please, provide a valid email';
                              } else {
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
                              }else if (value.length < 8) {
                                return 'Password must be up to 8 characters';
                              }
                              else if (!value.contains(RegExp(r"[A-Z]"))){
                                return 'Password must contain at least one uppercase';
                              }
                              else if (!value.contains(RegExp(r"[a-z]"))){
                                return 'Password must contain at least one lowercase';
                              }else if (!value.contains(RegExp(r"[0-9]"))){
                                return 'Password must contain at least one number';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 60,),
                          ButtonWidget(
                              onPressed: (){
                                _controller.signUpUserNow();
                              },
                              buttonText: "Sign Up", height: 50,
                              width: double.maxFinite
                          ),
                          const SizedBox(height: 15),
                          Align(alignment: Alignment.bottomCenter,
                            child: InkWell(onTap: (){
                              Get.offAll(()=>const LoginScreen());
                            },
                              child: RichText(textAlign: TextAlign.center, text: const TextSpan(text: "Already Have an account ?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14,),
                                  children: [
                                    TextSpan(text: "Login", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, decoration: TextDecoration.underline)),
                                  ]
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
