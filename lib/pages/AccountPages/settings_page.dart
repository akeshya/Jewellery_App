import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/common_components.dart';
import 'package:shopping_cart/components/styles.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../controllers/application_controller.dart';
import '../../controllers/user_status_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final appController = Get.find<ApplicationController>();
  final userStatusController = Get.find<UserStatusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: regularDarkText('Settings', fontSize: 20),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container());
  }
}
