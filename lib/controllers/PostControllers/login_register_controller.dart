import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import 'package:shopping_cart/model/login_modal.dart';
import 'package:shopping_cart/utils/api_constants.dart';
import 'package:shopping_cart/utils/api_exception.dart';
import 'package:shopping_cart/utils/app_constants.dart';
import 'package:shopping_cart/utils/get_storage.dart';
import '../../model/register_modal.dart';
import '../user_status_controller.dart';

class LoginRegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var loginData = LoginModal(data: {}, message: 'message', status: false).obs;
  var registerData = RegisterModal(message: 'message', status: false).obs;

  RxBool pvcChecked = false.obs;
  RxBool tncChecked = false.obs;

  static const Duration otpTimeout = Duration(seconds: 120);

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loginController() async {
    String primaryPhoneNumber = getString(Constants.PRIMARY_PHONE_NUMBER) ?? '';
    print('Primary phone number: $primaryPhoneNumber');

    if (primaryPhoneNumber.isEmpty) {
      Toast.error("Phone number is missing. Please enter your phone number.");
      return;
    }

    final data = {'primary_phone_number': primaryPhoneNumber};

    try {
      var loginResponse = await Get.find<PostApiController>().postControllers(
          ApiConstants.baseUrl + ApiConstants.loginEndPoint, data);

      print("Login API Response: ${loginResponse.data}");

      if (loginResponse.statusCode == 200 && loginResponse.data['status']) {
        loginData.value = loginModalFromJson(json.encode(loginResponse.data));
        await setLoginData();
      } else {
        Toast.error("Login failed. Please try again.");
      }
    } catch (e) {
      handleApiError(e, "Login failed. Please try again.");
    }
  }

  Future<void> verifyPhoneNumber() async {
    String primaryPhoneNumber = getString(Constants.PRIMARY_PHONE_NUMBER) ?? '';
    if (primaryPhoneNumber.isEmpty) {
      Toast.error("Phone number is missing.");
      return;
    }

    print('Verifying phone number: +91$primaryPhoneNumber');

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91$primaryPhoneNumber',
        timeout: otpTimeout,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          print("Auto verification completed.");
        },
        verificationFailed: (FirebaseAuthException e) {
          handleFirebaseError(e, "Phone verification failed.");
        },
        codeSent: (String verificationId, int? resendToken) {
          setData(Constants.VERIFICATION_ID, verificationId);
          print("Verification ID: $verificationId");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("Auto retrieval timeout: $verificationId");
        },
      );
    } catch (e) {
      handleGeneralError(e, "Too many requests. Try again later.");
    }
  }

  Future<void> verifyOTP(String userEnteredOTP) async {
    final verificationId = getString(Constants.VERIFICATION_ID) ?? '';

    if (userEnteredOTP.isEmpty || verificationId.isEmpty) {
      Toast.error("Invalid OTP. Please try again.");
      return;
    }

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userEnteredOTP,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      print('User signed in: ${userCredential.user}');

      if (userCredential.user != null) {
        await setLoginData();
      }
    } catch (e) {
      handleGeneralError(e, "Invalid OTP. Please try again.");
    }
  }

  Future<void> registerUser(Map<String, String> data) async {
    print('Registration data: $data');

    try {
      var registerResponse = await Get.find<PostApiController>().postControllers(
          ApiConstants.baseUrl + ApiConstants.registerEndPoint, data);

      print("Register API Response: ${registerResponse.data}");

      if (registerResponse.statusCode == 200 && registerResponse.data['status']) {
        registerData.value = registerModalFromJson(json.encode(registerResponse.data));
      } else {
        Toast.error("Registration failed. Please try again.");
      }
    } catch (e) {
      handleApiError(e, "Registration failed. Please try again.");
    }
  }

  Future<void> setLoginData() async {
    try {
      final data = loginData.value.data;
      if (data.isEmpty) {
        Toast.error("Failed to set login data. Please try again.");
        return;
      }

      print('Setting login data: $data');

      setData(Constants.IS_LOGGED_IN, true);
      setData(Constants.USER_ID, data['id'].toString());
      setData(Constants.PRIMARY_PHONE_NUMBER, data['primary_phone_number']);
      setData(Constants.COMPANY_NAME, data['company_name']);
      setData(Constants.BRANCH_NAME, data['branch_name'] ?? 'bn');
      setData(Constants.GST_NUMBER, data['gst_number'] ?? 'gn');
      setData(Constants.SHIPPING_ADDRESS, data['shipping_address']);
      setData(Constants.CONTACT_PERSON_NAME, data['contact_person_name'] ?? 'cpn');
      setData(Constants.CONTACT_PERSON_EMAIL, data['email'] ?? 'em');
      setData(Constants.ADDITIONAL_PHONE, data['additional_phone_number'] ?? 'apn');
      setData(Constants.USER_IMAGE, data['user_image'] ?? 'uim');
      setData(Constants.NOTIFICATION_ENABLED, true);

      Get.find<UserStatusController>().isUserLoggedIn.value = true;
      Toast.success('Login Successful');
    } catch (e) {
      handleGeneralError(e, "Failed to save login data.");
    }
  }

  Future<void> resendOTP() async {
    String primaryPhoneNumber = getString(Constants.PRIMARY_PHONE_NUMBER) ?? '';
    if (primaryPhoneNumber.isEmpty) {
      Toast.error("Phone number is missing.");
      return;
    }

    print('Resending OTP to: +91$primaryPhoneNumber');

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91$primaryPhoneNumber',
        timeout: otpTimeout,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          print("Auto verification completed.");
        },
        verificationFailed: (FirebaseAuthException e) {
          handleFirebaseError(e, "Failed to resend OTP.");
        },
        codeSent: (String verificationId, int? resendToken) {
          setData(Constants.VERIFICATION_ID, verificationId);
          print("New Verification ID: $verificationId");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("Auto retrieval timeout: $verificationId");
        },
      );
    } catch (e) {
      handleGeneralError(e, "Too many requests. Try again later.");
    }
  }

 void handleApiError(dynamic e, String fallbackMessage) {
  if (e is ApiException) {
    String errorMessage = e.message;
    print("❌ ApiException: $errorMessage (Status: ${e.statusCode})");
    Toast.error(errorMessage);
  } else {
    handleGeneralError(e, fallbackMessage);
  }
}

  void handleFirebaseError(FirebaseAuthException e, String fallbackMessage) {
    print("Firebase Error: ${e.message}");
    Toast.error(e.message ?? fallbackMessage);
  }

  void handleGeneralError(dynamic e, String message) {
    print("❌ Error: $e");
    Toast.error(message);
  }
}
