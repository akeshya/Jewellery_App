import 'package:flutter/material.dart';
import 'package:shopping_cart/components/common_components.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: commonAppBar('Notifications', null, null),
      body: Container(),
    );
  }
}
