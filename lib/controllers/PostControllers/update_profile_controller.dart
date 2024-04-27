import 'dart:convert';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as myDio;
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import 'package:shopping_cart/controllers/user_status_controller.dart';
import 'package:shopping_cart/utils/app_constants.dart';
import 'package:shopping_cart/utils/get_storage.dart';
import '../../model/update_profile_modal.dart';
import '../../utils/api_constants.dart';

class UpdateProfileController extends GetxController {

  final userStatusController = Get.find<UserStatusController>();

  RxBool isUpdating = false.obs;

  var updatedData = Profile(id: 0, primaryPhoneNumber: 'primaryPhoneNumber', companyName: 'companyName', branchName: 'branchName', gstNumber: 'gstNumber', shippingAddress: 'shippingAddress', contactPersonName: 'contactPersonName', email: 'email', additionalPhoneNumber: 'additionalPhoneNumber', userImage: 'userImage').obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> updateProfile(String companyName, String branchName, String gstNumber, String shippingAddress, String contactPersonName, String email, String additionalPhoneNumber, String userImage) async {

    isUpdating.value = true;

    myDio.FormData formData = myDio.FormData.fromMap({
      'id': getString(Constants.USER_ID),
      'company_name': companyName,
      'branch_name': branchName,
      'gst_number': gstNumber,
      'shipping_address': shippingAddress,
      'contact_person_name': contactPersonName,
      'email': email,
      'additional_phone_number': additionalPhoneNumber
    });

    print('form data is: ${formData.fields}');

    print('user image is: $userImage');

    if (userStatusController.profileImage.value != null) {
      print('profile image path is: ${userStatusController.profileImage.value!.path}');
      final fileContent = await myDio.MultipartFile.fromFile(
        userStatusController.profileImage.value!.path,
        filename: userStatusController.profileImage.value!.path.split('/').last,
      );

      formData.files.add(MapEntry('user_image', fileContent));

      print('fileContent: $fileContent');
    }

    print('form data is : $formData');

    var responseData = await Get.find<PostApiController>().postControllers(
        ApiConstants.baseUrl + ApiConstants.updateProfileEndPoint, formData);
    print('update response is: $responseData');

    if (responseData.statusCode == 200) {
      if(responseData.statusMessage == 'OK') {
            final updateProfileModal = updateProfileModalFromJson(json.encode(responseData.data));

            if(updateProfileModal.status) {
              updatedData.value = updateProfileModal.data;
              await setUserDatas();
            }
      }
    }
    else {
      print(responseData.statusMessage);
    }
    isUpdating.value = false;
  }

  Future<void> setUserDatas() async {
    print('setting login data ${updatedData.value}');
    setData(Constants.IS_LOGGED_IN, true);
    setData(Constants.USER_ID, updatedData.value.id.toString());
    setData(Constants.PRIMARY_PHONE_NUMBER, updatedData.value.primaryPhoneNumber);
    setData(Constants.COMPANY_NAME, updatedData.value.companyName);
    setData(Constants.BRANCH_NAME, updatedData.value.branchName ?? 'bn');
    setData(Constants.GST_NUMBER, updatedData.value.gstNumber ?? 'gn');
    setData(Constants.SHIPPING_ADDRESS, updatedData.value.shippingAddress);
    setData(Constants.CONTACT_PERSON_NAME, updatedData.value.contactPersonName ?? 'cpn');
    setData(Constants.CONTACT_PERSON_EMAIL, updatedData.value.email ?? 'em');
    setData(Constants.ADDITIONAL_PHONE, updatedData.value.additionalPhoneNumber ?? 'apn');
    setData(Constants.USER_IMAGE, updatedData.value.userImage ?? 'uim');

    userStatusController.checkUserLoginStatus();

    Toast.success('Profile updated Successfully');
  }
}