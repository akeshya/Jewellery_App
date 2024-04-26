import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/application_controller.dart';

Future<bool> exitMaterialApp(BuildContext context) async {
  bool exit = false;
  final width = MediaQuery.of(context).size.width;

  final appController = Get.find<ApplicationController>();

  if (appController.currentSelectedTabIndex.value != 0) {
    appController.setCurrentSelectedTab(0);
    return false;
  } else {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              width: width * 0.7,
              height: width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        child: Text(
                          'EXIT',
                          style: TextStyle(
                              fontFamily: 'LatoMed',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                          child: Text(
                        'Do you want to exit?',
                        style: TextStyle(fontFamily: 'LatoMed'),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * 0.25,
                        height: width * 0.1,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const FittedBox(
                            child: Text(
                              'No',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'LatoMed',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.25,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            exit = true;
                          },
                          child: const FittedBox(
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'LatoMed',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
    return exit; // Prevent the default back button behavior
  }
}
