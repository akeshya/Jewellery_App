import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/PostControllers/login_register_controller.dart';
import 'package:shopping_cart/utils/CustomUtils.dart';
import '../../components/common_components.dart';
import '../../components/custom_alert.dart';
import '../../components/input_component.dart';
import '../../utils/app_constants.dart';
import '../../utils/get_storage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginRegisterController());
  final phoneController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              regularDarkText('Welcome.',
                                  fontSize: 32, color: Color(0xFF171A1F)),
                              regularDarkText('Sign in to your account',
                                  fontSize: 20, color: Color(0xFF9095A1))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      CustomTextInput(
                        topLabel: 'Phone Number*',
                        label: 'Enter Phone Number',
                        isEditable: !_isLoading,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        controller: phoneController,
                        prefixIcon: Icon(Icons.phone, color: Color(0xFFCC7B25)),
                        validator: (value) {
  if (value == null || value.isEmpty || value.length < 10) {
    Toast.error('Please enter a 10-digit phone number');
    return 'Please enter a 10-digit phone number';
  } else if (!Utils.isNumeric(value)) {
    Toast.error('Phone number should be only digits');
    return 'Phone number should be only digits';
  }
  return null;
}
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() && !_isLoading) {
                        setData(Constants.PRIMARY_PHONE_NUMBER, phoneController.text.toString().trim());
                        checkUserStatus(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        backgroundColor: Color(0xFFCC7B25),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                    child: _isLoading ? CircularProgressIndicator(color: Colors.white,) : regularDarkText("Get OTP",
                        fontSize: 15, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () => _isLoading ? null : Get.offAllNamed('/register'),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

checkUserStatus(context) async {
  try {
    setState(() {
      _isLoading = true;
    });
    await controller.loginController();

    if (controller.loginData.value.status == true) {
      controller.verifyPhoneNumber().then((value) {
        Get.toNamed('/otp');
      });
    } else {
      Toast.error(controller.loginData.value.message ?? "Login failed.");
    }
  } catch (e) {
    Toast.error("Something went wrong. Try again later.");
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}
}