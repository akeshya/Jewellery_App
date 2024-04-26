import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/utils/app_constants.dart';
import 'package:shopping_cart/utils/get_storage.dart';

class UserStatusController extends GetxController {

  RxBool isLoadingStatus = true.obs;
  RxBool isUserLoggedIn = false.obs;

  RxString userId = 'ui'.obs;
  RxString userImage = 'null'.obs;
  RxString phoneNumber = 'pn'.obs;
  RxString companyName = 'cn'.obs;
  RxString branchName = 'bn'.obs;
  RxString gstNumber = 'gn'.obs;
  RxString shipmentAddress = 'sa'.obs;
  RxString contactPersonName = 'cpn'.obs;
  RxString email = 'em'.obs;
  RxString additionalPhoneNumber = 'apn'.obs;

  var phoneController = TextEditingController().obs;
  var companyNameController = TextEditingController().obs;
  var branchNameController = TextEditingController().obs;
  var gstController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var personNameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var additionalPhoneController = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkUserLoginStatus();
  }

  void checkUserLoginStatus() async {
    bool? loginStatus = getBool(Constants.IS_LOGGED_IN);
    print('loginStatus :::::: $loginStatus');
    if (loginStatus == true) {
      userId.value = (getString(Constants.USER_ID))!;
      phoneNumber.value = (getString(Constants.PRIMARY_PHONE_NUMBER))!;
      if(phoneNumber.value != 'pn') {
        phoneController.value.text = phoneNumber.value;
      }
      companyName.value = (getString(Constants.COMPANY_NAME))!;
      if(companyName.value != 'cn') {
        companyNameController.value.text = companyName.value;
      }
      branchName.value = (getString(Constants.BRANCH_NAME))!;
      if(branchName.value != 'bn') {
        branchNameController.value.text = branchName.value;
      }
      gstNumber.value = (getString(Constants.GST_NUMBER))!;
      if(gstNumber.value != 'gn') {
        gstController.value.text = gstNumber.value;
      }
      shipmentAddress.value = (getString(Constants.SHIPPING_ADDRESS))!;
      if(shipmentAddress.value != 'sa') {
        addressController.value.text = shipmentAddress.value;
      }
      contactPersonName.value = (getString(Constants.CONTACT_PERSON_NAME))!;
      if(contactPersonName.value != 'cpn') {
        personNameController.value.text = contactPersonName.value;
      }
      email.value = (getString(Constants.CONTACT_PERSON_EMAIL))!;
      if(email.value != 'em') {
        emailController.value.text = email.value;
      }
      additionalPhoneNumber.value = (getString(Constants.ADDITIONAL_PHONE))!;
      if(additionalPhoneNumber.value != 'apn') {
        additionalPhoneController.value.text = additionalPhoneNumber.value;
      }
      userImage.value = (getString(Constants.USER_IMAGE))!;
      isUserLoggedIn.value = true;
    }
    isLoadingStatus.value = false;
  }

  Future<void> handleLogout() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
    isUserLoggedIn.value = false;
    clearData();
    Get.offAllNamed('/');
    Toast.error('Your account logged out.');
  }
}