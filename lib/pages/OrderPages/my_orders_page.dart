import 'package:flutter/material.dart';
import 'package:shopping_cart/components/common_components.dart';

class MyOrdersPage extends StatelessWidget {
  MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar('My Orders', null, null),
      body: Container(),
    );
  }
}