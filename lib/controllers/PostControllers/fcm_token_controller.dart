import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import 'package:shopping_cart/utils/app_constants.dart';
import 'package:shopping_cart/utils/get_storage.dart';
import '../../utils/api_constants.dart';

class FcmTokenController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateToken();
  }

  updateToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);

    if(fcmToken != null) {
      try {
        final data = {
          'user_id': getString(Constants.USER_ID),
          'tokens': fcmToken
        };

        var tokenResponse = await Get.find<PostApiController>().postControllers(
            ApiConstants.baseUrl + ApiConstants.tokenEndPoint, data);

        if(tokenResponse.statusCode == 200) {
          print('token updated:');
        }
      } catch (e) {
        print('token error is: $e');
      }
    }
  }
}
