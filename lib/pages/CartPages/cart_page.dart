import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/common_components.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/GetControllers/product_list_controller.dart';
import 'package:shopping_cart/controllers/PostControllers/add_to_cart_controller.dart';
import 'package:shopping_cart/controllers/PostControllers/get_cart_item_controller.dart';
import 'package:shopping_cart/controllers/PostControllers/place_order_controller.dart';
import 'package:shopping_cart/model/product_list_modal.dart';
import 'package:shopping_cart/utils/CustomColors.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import 'package:shopping_cart/utils/refresh_data.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final cartController = Get.find<CartController>();
  final addCartController = Get.find<AddToCartController>();
  final placeOrderController = Get.put(PlaceOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar('Shopping Cart', null, null),
        body: RefreshIndicator(
          onRefresh: () => cartController.getCartItems(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox.expand(
              child: Obx(
                () => ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final GlobalKey popupKey = GlobalKey();

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Card(
                            elevation: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 100,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(cartController
                                              .cartItems[index].image[0]))),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: regularDarkText(
                                                    cartController
                                                        .cartItems[index].name,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        Text(
                                            '${cartController.cartItems[index].productSize} INCH',
                                            style: TextStyle(color: Colors.grey)),
                                        regularDarkText(
                                            '${cartController.cartItems[index].productWeight} GRAMS',
                                            color: Colors.black)
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5),
                                  child: Obx(
                                    () => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: PopupMenuButton<int>(
                                            key: popupKey,
                                            itemBuilder: (BuildContext context) {
                                              Product actualProduct = Get.find<ProductsListController>()
                                                    .productsList
                                                    .firstWhere((product) =>
                                                product.id == cartController.cartItems[index].productId);

                                              return List.generate(
                                                actualProduct.productsize
                                                    .firstWhere((size) =>
                                                        size.size ==
                                                        cartController
                                                            .cartItems[index]
                                                            .productSize)
                                                    .productQuantity,
                                                (value) {
                                                  return PopupMenuItem<int>(
                                                    value: value + 1,
                                                    child: Text('gg${value + 1}'),
                                                  );
                                                },
                                              );
                                            },
                                            child: IconButton(
                                              onPressed: () {
                                                _showPopupMenu(
                                                    context, index, popupKey);
                                              },
                                              icon: Icon(Icons.edit,
                                                  color: Colors.grey),
                                              splashRadius: 15,
                                              iconSize: 20,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: IconButton(
                                            onPressed: () async {
                                              await addCartController.addToCarts(
                                                  cartController
                                                      .cartItems[index].productId,
                                                  0,
                                                  cartController
                                                      .cartItems[index].productSize.toString(),
                                                  0);
                                              Toast.error('${cartController.cartItems[index].name} deleted from cart');
                                              await cartController.getCartItems();
                                            },
                                            icon: Icon(Icons.delete,
                                                color: Colors.grey),
                                            splashRadius: 15,
                                            iconSize: 20,
                                          ),
                                        ),
                                        Text(
                                          'x${cartController.cartItems[index].productQuantity}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => cartController.cartItems.length == 0
              ? Container()
              : Container(
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                regularDarkText('Total Weight:',
                                    color: Colors.black, fontSize: 12),
                                regularDarkText(
                                    '${cartController.totalWeight.value} GRAMS'),
                              ],
                            )),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            regularDarkText('Total Quantity:',
                                color: Colors.black, fontSize: 12),
                            regularDarkText(
                                cartController.cartItems.length.toString()),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            if (cartController.cartItems.length > 0) {
                              await placeOrderController.placeOrder();
                              if (placeOrderController.isOrderPlaced.isTrue) {
                                int orderLength =
                                    cartController.cartItems.length;
                                double totalWeight =
                                    cartController.totalWeight.value;
                                await cartController.getCartItems();
                                await refreshProducts();
                                Get.toNamed(
                                    '/order_confirm?order_length=$orderLength&total_weight=${totalWeight.toStringAsFixed(2)}');
                              }
                            }
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: CustomColors.COLOR_PRIMARY,
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: regularDarkText('CONFIRM ORDER',
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }

  void _showPopupMenu(BuildContext context, int index, GlobalKey popupKey) {
    Product actualProduct = Get.find<ProductsListController>()
          .productsList
          .firstWhere((product) =>
              product.id == cartController.cartItems[index].productId);

    final RenderBox button =
        popupKey.currentContext!.findRenderObject() as RenderBox;
    final Offset overlay = Offset(button.localToGlobal(Offset.zero).dx,
        button.localToGlobal(Offset.zero).dy + button.size.height);
    showMenu<int>(
      context: context,
      position: RelativeRect.fromRect(
        overlay & button.size,
        Offset.zero & button.size,
      ),
      items: List.generate(
        actualProduct.productsize
            .firstWhere((size) =>
                size.size == cartController.cartItems[index].productSize.toString())
            .productQuantity,
        (value) {
          return PopupMenuItem<int>(
            value: value + 1,
            child: Center(
                child: Text('${value + 1}',
                    style: TextStyle(
                        color: value + 1 ==
                                cartController.cartItems[index].productQuantity
                            ? AppColors.primaryColor
                            : Colors.black))),
          );
        },
      ),
    ).then((value) async {
      if (value != null) {
        // Handle the selected quantity (value)
        // You can update the quantity here.
        await addCartController.addToCarts(
            cartController.cartItems[index].productId,
            value,
            cartController.cartItems[index].productSize.toString(),
            actualProduct.productsize
                    .firstWhere((element) =>
                        element.size ==
                        cartController.cartItems[index].productSize.toString())
                    .productWeight *
                value);
        await cartController.getCartItems();
        Toast.success('${cartController.cartItems[index].name} quantity updated to $value');
      }
    });
  }
}