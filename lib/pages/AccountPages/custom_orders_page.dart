import 'package:flutter/material.dart';
import '../../components/common_components.dart';

class CustomOrdersPage extends StatelessWidget {
  CustomOrdersPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: commonBackButton(context),
        ),
        title: regularDarkText('Custom Order', fontSize: 20),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(),
    );
  }
}