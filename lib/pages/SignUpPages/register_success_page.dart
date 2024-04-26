import 'package:flutter/material.dart';
import 'package:shopping_cart/components/common_components.dart';
import 'package:shopping_cart/controllers/PostControllers/login_register_controller.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/utils/app_images.dart';
import '../../controllers/user_status_controller.dart';

class RegisterSuccessPage extends StatelessWidget {
  final registerController = Get.find<LoginRegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.successImage, width: 60, height: 60),
            SizedBox(height: 40),
            regularDarkText('Successfull',
                fontSize: 24, color: Color(0xFF171A1F)),
            SizedBox(height: 20),
            regularDarkText('You have successfully registered in\n our app.',
                fontSize: 16, color: Color(0xFF424856)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await registerController.loginController();
                  await registerController.setLoginData();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: Color(0xFFCC7B25),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                child: regularDarkText("Start Shopping",
                    fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      )),
    );
  }
}