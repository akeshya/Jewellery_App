import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_navigation_page.dart';
import 'components/loader_widget_component.dart';
import 'controllers/user_status_controller.dart';
import 'pages/SignUpPages/login_page.dart';

class FlickerClass extends StatelessWidget {
  FlickerClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStatusController = Get.find<UserStatusController>();

    return Scaffold(backgroundColor: Colors.white,
      body: Obx(() =>
          userStatusController.isLoadingStatus.isTrue
          ? loaderWidget()
          : userStatusController.isUserLoggedIn.isTrue
          ? MyBottomNavigationPage()
          : LoginPage())
    );
  }
}