
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller/sign_up_controller.dart';
import '../../shared_widgets/custom_formfield_widget.dart';



class VerifyEmailScreen extends StatefulWidget {
  final int? navigationData;
  const VerifyEmailScreen({Key? key, this.navigationData}) : super(key: key);

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

  final _controller= Get.put(SignUpController());

  @override
  void dispose() {
    _controller.confirmEmailController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: GetBuilder<SignUpController>(
        init: SignUpController(),
          builder: (controller){
        return Scaffold(
          key: _controller.scaffoldKeyConfirmEmail,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(backgroundColor: Colors.white, elevation: 0, leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black,), onPressed: (){
            Get.back();
          },),),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(key: _controller.formKeyConfirmEmail,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Enter Otp verification code sent to your Email", style: TextStyle(fontSize: 24),),
                  const SizedBox(height: 36,),
                  FormFieldWidget(
                    hintText: "Enter Otp",
                    keyboardType: TextInputType.text,
                    controller: _controller.confirmEmailController,
                    onChanged: (value){
                      _controller.confirmEmail = value;
                    },
                    validator: (value) => (value!.isEmpty? "Please enter your last name" : null),
                  ),
                  const SizedBox(height: 48,),
                  SizedBox(height: 48, width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 0),
                        child: const Text("Confirm Email", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        onPressed: (){
                          _controller.confirmEmailNow();
                        },
                      )
                  ),
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
