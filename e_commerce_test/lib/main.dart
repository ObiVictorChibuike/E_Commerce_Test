import 'package:e_commerce_test/screens/auth_screen/sign_up_screen.dart';
import 'package:e_commerce_test/screens/item/items_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'cached_data/cached_data.dart';
import 'constants/app_fonts.dart';
import 'constants/app_theme.dart';
import 'controllers/products_controller/item_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  CachedData cachedData = CachedData();
  final loggedIn = await cachedData.getLoginStatus();
  Get.put(ItemController());

  runApp( MyApp(loggedIn: loggedIn,));
}

class MyApp extends StatelessWidget {
  bool? loggedIn;
  MyApp({Key? key, this.loggedIn}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: AppStrings.nunito, primarySwatch: kPrimarySwatch),
        home: loggedIn == true ?const ItemsScreen(): const SignUpScreen(),
        //const ItemsScreen(),
      ),
    );
  }
}