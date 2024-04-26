import 'package:flutter/material.dart';
import 'package:shopping_cart/components/common_components.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar('Shopping Cart', null, null),
        body:Container());
  }
}