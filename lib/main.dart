import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping_cart/components/firebase_options.dart';
import 'package:shopping_cart/controllers/user_status_controller.dart';
import 'package:shopping_cart/pages/CategoryPages/product_listing_page.dart';
import 'package:shopping_cart/pages/OrderPages/my_orders_page.dart';
import 'package:shopping_cart/pages/SignUpPages/login_page.dart';
import 'package:shopping_cart/pages/SignUpPages/otp_page.dart';
import 'package:shopping_cart/pages/SignUpPages/register_page.dart';
import 'package:shopping_cart/pages/SignUpPages/register_success_page.dart';
import 'package:shopping_cart/pages/AccountPages/privacy_page.dart';
import 'package:shopping_cart/pages/AccountPages/terms_conditions_page.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import 'bottom_navigation_page.dart';
import 'controllers/GetControllers/get_api_controller.dart';
import 'controllers/GetControllers/pvc_controller.dart';
import 'controllers/GetControllers/tnc_controller.dart';
import 'controllers/GetParameterizedControllers/parameterized_get_api_controller.dart';
import 'controllers/PostControllers/post_api_controller.dart';
import 'controllers/application_controller.dart';
import 'loading_flicker.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  final appController = Get.put(ApplicationController());
  final userController = Get.put(UserStatusController());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor:
        AppColors.primaryColor500, // Set the desired status bar color here.
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final appController = Get.put(ApplicationController());
  final getApiController = Get.put(GetApiController());
  final parameterizedGetApiController =
  Get.put(ParameterizedGetApiController());
  final postApiController = Get.put(PostApiController());
  final userStatusController = Get.put(UserStatusController());
  final pvcController = Get.put(PvcController());
  final tncController = Get.put(TncController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.orange, // Set your primary color to green
      ),
      defaultTransition: Transition.zoom,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => FlickerClass()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/otp', page: () => OTPPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/privacy_policy', page: () => PrivacyPolicyPage()),
        GetPage(name: '/terms_conditions', page: () => TermsConditionsPage()),
        GetPage(name: '/register_success', page: () => RegisterSuccessPage()),
        GetPage(name: '/bottom_home', page: () => MyBottomNavigationPage()),
        GetPage(name: '/product_listing', page: () => ProductListingPage()),
        GetPage(name: '/orders', page: () => MyOrdersPage()),
      ],
    );
  }
}