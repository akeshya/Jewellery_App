import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/PostControllers/place_order_controller.dart';
import 'package:shopping_cart/utils/app_images.dart';
import '../../components/common_components.dart';
import '../../controllers/application_controller.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        width: width,
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(AppImages.orderPlacedSuccess,
                    width: 75, height: 75),
                SizedBox(height: 20),
                regularDarkText('Order placed successfully!', fontSize: 20),
                SizedBox(height: 20),
                regularDarkText(
                    'You can check your orders status in my orders section.',
                    color: Colors.grey,
                    fontSize: 14),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: height * 0.3,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            regularDarkText('Total weight',
                                color: Colors.black54, fontSize: 14),
                            regularDarkText(
                                '${Get.parameters['total_weight']} GRAMS',
                                color: Colors.black,
                                fontSize: 18)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            regularDarkText('Total Quantity:',
                                color: Colors.black54, fontSize: 14),
                            regularDarkText('${Get.parameters['order_length']}',
                                color: Colors.black, fontSize: 18)
                          ],
                        ),
                        commonHorizontalLine(),
                        Card(
                          elevation: 0,
                          color: Colors.green.shade50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:
                                regularDarkText('Success', color: Colors.green),
                          ),
                        ),
                        commonHorizontalLine(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                regularDarkText('How was your experience?',
                    color: Colors.black, fontSize: 14),
                SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            ),
            GestureDetector(
                onTap: () async {
                  Get.find<PlaceOrderController>().isOrderPlaced.value = false;
                  Get.find<ApplicationController>()
                      .setCurrentSelectedTab(0);
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(AppImages.backToHome, height: 44),
                )),
          ],
        ),
      ),
    );
  }
}