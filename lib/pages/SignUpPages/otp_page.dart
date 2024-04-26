import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
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

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String primaryPhoneNumber = getString(Constants.PRIMARY_PHONE_NUMBER) ?? '';

    print('primary in otp screen is: $primaryPhoneNumber');

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.otpImage, width: 220, height: 180),
                ],
              ),
              regularDarkText(
                  "Please Enter The 6 Digit Code\n Sent To\n $primaryPhoneNumber",
                  fontSize: 18,
                  lineHeight: 1.5,
                  color: Color(0xFF171A1F)),
              PinCodeTextField(
                controller: otpController, // Use the controller here
                autofocus: false,
                highlight: true,
                pinBoxColor: Colors.yellow.shade100,
                pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 5),
                maxLength: 6,
                pinBoxBorderWidth: 0,
                pinBoxWidth: 36,
                pinBoxHeight: 42,
                wrapAlignment: WrapAlignment.spaceAround,
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextStyle: TextStyle(fontSize: 16.0),
                pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                highlightAnimation: true,
                highlightAnimationBeginColor: Colors.black,
                highlightAnimationEndColor: Colors.white12,
                keyboardType: TextInputType.number,
              ),
              Container(
                  color: Color(0xFFFFE2D3),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 5),
                    child: regularDarkText('Resend Code',
                        fontSize: 16, color: Color(0xFFFD9F70)),
                  )),
              ElevatedButton(
                onPressed: () async {
                  if (otpController.text.length == 6) {
                    setData(Constants.SMS_CODE, otpController.text);
                    await loginRegisterController.verifyOTP().then((value) {
                      Get.offAllNamed('/');
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: Color(0xFFCC7B25),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 12)),
                child: regularDarkText("Verify OTP",
                    fontSize: 15, color: Colors.white),
              ),
            ]),
      ),
    );
  }
}