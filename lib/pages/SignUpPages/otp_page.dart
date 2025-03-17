import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/PostControllers/login_register_controller.dart';
import 'package:shopping_cart/utils/app_images.dart';
import '../../components/common_components.dart';
import '../../utils/app_constants.dart';
import '../../utils/get_storage.dart';

class OTPPage extends StatefulWidget {
  OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final loginRegisterController = Get.find<LoginRegisterController>();
  final TextEditingController otpController = TextEditingController();
  bool _isVerifying = false;

  @override
  Widget build(BuildContext context) {
    String primaryPhoneNumber = getString(Constants.PRIMARY_PHONE_NUMBER) ?? '';

    print('Primary phone number in OTP screen: $primaryPhoneNumber');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: commonBackButton(context),
        ),
        centerTitle: true,
        title: regularDarkText(
          'Verify Your Mobile',
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(AppImages.otpImage, width: 220, height: 180),

            regularDarkText(
              "Please enter the 6-digit code\nsent to\n$primaryPhoneNumber",
              fontSize: 18,
              lineHeight: 1.5,
              color: Color(0xFF171A1F),
              textAlign: TextAlign.center,
            ),

            PinCodeTextField(
              controller: otpController,
              autofocus: false,
              highlight: true,
              pinBoxColor: Colors.yellow.shade100,
              pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 5),
              maxLength: 6,
              pinBoxBorderWidth: 1, // Added a border for better visibility
              pinBoxWidth: 40,
              pinBoxHeight: 48,
              wrapAlignment: WrapAlignment.spaceAround,
              pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
              pinTextStyle: TextStyle(fontSize: 16.0),
              pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
              pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
              highlightAnimation: true,
              highlightAnimationBeginColor: Colors.black,
              highlightAnimationEndColor: Colors.white12,
              keyboardType: TextInputType.number,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () => loginRegisterController.resendOTP(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE2D3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: regularDarkText('Resend Code', fontSize: 16, color: Color(0xFFFD9F70)),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: _isVerifying
                  ? null
                  : () async {
                      if (otpController.text.length < 6) {
                        Toast.error('Please enter a valid 6-digit OTP');
                        return;
                      }

                      setState(() => _isVerifying = true);
                      setData(Constants.SMS_CODE, otpController.text);

                      try {
  await loginRegisterController.verifyOTP(primaryPhoneNumber);
  Get.offAllNamed('/');
} catch (e) {
  print("Error in OTP Verification: $e");
  Toast.error('Something went wrong. Please try again later.');
}
                      setState(() => _isVerifying = false);
                    },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                backgroundColor: Color(0xFFCC7B25),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              ),
              child: _isVerifying
                  ? CircularProgressIndicator(color: Colors.white)
                  : regularDarkText("Verify OTP", fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
