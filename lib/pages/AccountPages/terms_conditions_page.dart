import 'package:flutter/material.dart';
import 'package:shopping_cart/controllers/GetControllers/tnc_controller.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import '../../components/common_components.dart';
import 'package:get/get.dart';

class TermsConditionsPage extends StatelessWidget {
  TermsConditionsPage({Key? key}) : super(key: key);

  final tncController = Get.find<TncController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar('Terms & Conditions', context, null),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Obx(() =>
            ListView(
              children: [
                regularDarkText(tncController.tncUpdate.value, color: Color(0xFF9095A1), fontSize: 14),
                SizedBox(height: 40),
                commonHorizontalLine(),
                SizedBox(height: 40),

                ...buildTncs(),

                CheckboxListTile(
                  title: Text(
                    "I have read & agree with above T&Cs",
                    style: TextStyle(fontSize: 14),
                  ),
                  value: tncController.isChecked.value,
                  onChanged: (bool? newValue) {
                    tncController.isChecked.value = newValue!;
                  },
                  activeColor: AppColors.primaryColor500,
                  checkColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border:
                        Border.all(color: Color.fromARGB(255, 232, 226, 226))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primaryColor500),
                              borderRadius: BorderRadius.circular(1)),
                          child: ElevatedButton(
                            onPressed: () => tncController.selectButton(0),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              tncController.selectedButton.value == 0 ? AppColors.primaryColor500 : Colors.white,
                            ),
                            child: Text(
                              "Decline",
                              style: TextStyle(
                                  color: tncController.selectedButton.value == 0
                                      ? Colors.white
                                      : AppColors.primaryColor500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.primaryColor500),
                                borderRadius: BorderRadius.circular(1)),
                            child: ElevatedButton(
                              onPressed: () => tncController.selectButton(1),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: tncController.selectedButton.value == 1
                                    ? AppColors.primaryColor500
                                    : Colors.white,
                              ),
                              child: Text(
                                "Accept",
                                style: TextStyle(
                                    color: tncController.selectedButton.value == 1
                                        ? Colors.white
                                        : AppColors.primaryColor500),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              ],),
          ),
        ),
      ),
    );
  }

  List<Widget> buildTncs() {
    return List.generate(tncController.tncList.length, (index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 10, bottom: 15),
          child: Text(
            '${index+1}. ${tncController.tncList[index].heading}',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
        Text(
          '${tncController.tncList[index].subHeading}',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        )
      ]),
    ));
  }
}