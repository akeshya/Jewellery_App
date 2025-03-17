import 'package:screen_protector/screen_protector.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/utils/get_storage.dart';

import '../components/custom_toast.dart';
import '../utils/app_constants.dart';

class ApplicationController extends GetxController {
  RxInt currentSelectedTabIndex = 0.obs;
  RxBool notificationEnabled = false.obs;

  secureScreen() async {
    await ScreenProtector.preventScreenshotOn();
  }

  @override
  void onInit() {
    super.onInit();
    secureScreen();
    checkNotificationStatus();
  }

  void setCurrentSelectedTab(int index) {
    Constants.IS_VALID
        ? currentSelectedTabIndex.value = index
        : Toast.error('Server Error');
  }

  Future<void> checkNotificationStatus() async {
    bool? notificationStatus = getBool('notificationsEnabled');
    notificationEnabled.value = notificationStatus ?? true;
  }

  // Function to enable notifications
  Future<void> enableNotifications(bool status) async {
    setData('notificationsEnabled', status);
    checkNotificationStatus();
  }
}
