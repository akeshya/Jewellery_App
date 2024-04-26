import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import 'package:shopping_cart/model/login_modal.dart';
import 'package:shopping_cart/utils/api_constants.dart';
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> loginController() async {
    String primaryPhoneNumber = getString(Constants.PRIMARY_PHONE_NUMBER) ?? '';

    print('primary in login controller is: $primaryPhoneNumber');
    final data = {'primary_phone_number': primaryPhoneNumber};
    var loginResponse = await Get.find<PostApiController>().postControllers(
        ApiConstants.baseUrl + ApiConstants.loginEndPoint, data);

    if (loginResponse.statusCode == 200) {
      final loginModal = loginModalFromJson(json.encode(loginResponse.data));
      loginData.value = loginModal;
    }
  }

  Future<void> verifyPhoneNumber() async {
    String primaryPhoneNumber = getString(Constants.PRIMARY_PHONE_NUMBER) ?? '';

    print('primary in verification is: $primaryPhoneNumber');
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+91' + primaryPhoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {
            setData(Constants.SMS_CODE, credential.smsCode);
            setData(Constants.VERIFICATION_ID, credential.verificationId);
          },
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {
            setData(Constants.VERIFICATION_ID, verificationId);
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
          timeout: Duration(seconds: 120));
    } catch (e) {
      Toast.error(
          'We have blocked all requests from this device due to unusual activity. Try again later.');
    }
  }

  Future<void> verifyOTP() async {
    final verificationId = getString(Constants.VERIFICATION_ID) ?? '';
    final smsCode = getString(Constants.SMS_CODE) ?? '';
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      // Sign in the user with the credential
      await _auth.signInWithCredential(credential).then((value) => {
            print('value: is: ' + value.user.toString()),
          });

      // Authentication successful
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        await setLoginData();
      }
    } catch (e) {
      Toast.error('Authentication failed');
    }
  }

  Future<void> registerUser(Map<String, String> data) async {
    print('registeration data is: $data');
    var registerResponse = await Get.find<PostApiController>().postControllers(
        ApiConstants.baseUrl + ApiConstants.registerEndPoint, data);

    if (registerResponse.statusCode == 200) {
      final registerModal =
          registerModalFromJson(json.encode(registerResponse.data));

      registerData.value = registerModal;
    }
  }

  Future<void> setLoginData() async {
    print('setting login data ${loginData.value}');
    setData(Constants.IS_LOGGED_IN, true);
    setData(Constants.USER_ID, loginData.value.data['id'].toString());
    setData(Constants.PRIMARY_PHONE_NUMBER, loginData.value.data['primary_phone_number']);
    setData(Constants.COMPANY_NAME, loginData.value.data['company_name']);
    setData(Constants.BRANCH_NAME, loginData.value.data['branch_name'] ?? 'bn');
    setData(Constants.GST_NUMBER, loginData.value.data['gst_number'] ?? 'gn');
    setData(Constants.SHIPPING_ADDRESS, loginData.value.data['shipping_address']);
    setData(Constants.CONTACT_PERSON_NAME,
        loginData.value.data['contact_person_name'] ?? 'cpn');
    setData(Constants.CONTACT_PERSON_EMAIL, loginData.value.data['email'] ?? 'em');
    setData(Constants.ADDITIONAL_PHONE,
        loginData.value.data['additional_phone_number'] ?? 'apn');
    setData(Constants.USER_IMAGE, loginData.value.data['user_image'] ?? 'uim');
    setData(Constants.NOTIFICATION_ENABLED, true);

    Get.find<UserStatusController>().isUserLoggedIn.value = true;

    Toast.success('Login Successfully');
  }
}
