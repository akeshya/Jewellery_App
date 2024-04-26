import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/controllers/GetControllers/pvc_controller.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import '../../components/common_components.dart';
import 'package:get/get.dart';

class PrivacyPolicyPage extends StatelessWidget {
  PrivacyPolicyPage({Key? key}) : super(key: key);

  final pvcController = Get.find<PvcController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar('Privacy Policy', context, null),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(() =>
          Container(
            width: MediaQuery.of(context).size.width,
            height: double.maxFinite,
            child: ListView(
              children: [
              regularDarkText(pvcController.pvcUpdate.value, color: Color(0xFF9095A1), fontSize: 14),
                SizedBox(height: 40),
                commonHorizontalLine(),
                SizedBox(height: 40),
                Text(pvcController.pvcExtra.value, style: TextStyle(color: Color(0xFF323743), fontSize: 14, fontFamily: 'LatoMed', height: 2, fontWeight: FontWeight.w400)),
                ...infoSections()
              ],),
          ),
        ),
      ),
    );
  }

  List<Widget> infoSections() {
    return List.generate(pvcController.pvcList.length, (index) {
        return Container(
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black45)),
          child: ExpansionTile(
            backgroundColor: AppColors.primaryColor500,
            iconColor: Colors.white,
            textColor: Colors.white,
            title: Row(
              children: [
                buildIcon(index),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        pvcController.pvcList[index].heading,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            children: [
              ListTile(
                title: Text(
                  "${index+1}. ${pvcController.pvcList[index].subHeading}",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${pvcController.pvcList[index].description}",
                  style: TextStyle(
                      fontSize: 15),
                ),
              ),
            ],
          ),
        );
    });
  }

  var iconList = [
    CupertinoIcons.exclamationmark_circle,
    CupertinoIcons.exclamationmark_circle,
    Icons.email,
    CupertinoIcons.square_stack_3d_up,
    Icons.security,
  ];

  Widget buildIcon(int index) => Icon(
    index > iconList.length ? iconList[0] : iconList[index],
    size: 16,
    color: Color.fromARGB(255, 85, 176, 251),
  );
}