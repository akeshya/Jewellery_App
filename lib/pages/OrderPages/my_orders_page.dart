import 'package:flutter/material.dart';
import 'package:shopping_cart/components/common_components.dart';
import 'package:shopping_cart/utils/CustomColors.dart';
import 'package:get/get.dart';

class MyOrdersPage extends StatelessWidget {
  MyOrdersPage({Key? key}) : super(key: key);
  final orderTypes = [
    'Current Orders',
    'All Orders',
    'Past Orders',
    'Custom Orders'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar('My Orders', null, null),
      body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(orderTypes.length, (index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: index==0
                                ? CustomColors.COLOR_PRIMARY
                                : Colors.transparent,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:
                            regularDarkText(orderTypes[index], fontSize: 12),
                      ),
                    ),
                  );
                }),
              ),
            ),
            commonHorizontalLine(),
            Expanded(
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView(
                        children: [
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: CustomColors.COLOR_SECONDARY),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30),
                                        border: Border.all(
                                            color: CustomColors.COLOR_PRIMARY,
                                            width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 5.0),
                                      child: regularDarkText('Current orders',
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  )),
          ],
        ),
    );
  }
}