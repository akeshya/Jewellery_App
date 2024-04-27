import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/common_components.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/PostControllers/add_to_cart_controller.dart';
import 'package:shopping_cart/controllers/PostControllers/get_cart_item_controller.dart';
import 'package:shopping_cart/controllers/product_details_controller.dart';
import 'package:shopping_cart/model/product_list_modal.dart';
import 'package:shopping_cart/utils/CustomColors.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import '../components/size_quantity_selector.dart';
import '../image_carosol.dart';
import '../model/search_product_modal.dart';

class ProductDetailsPage extends StatelessWidget {
  dynamic product;
  ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  final productDetailsController = Get.put(ProductDetailsController());
  final addToCartController = Get.find<AddToCartController>();

  @override
  Widget build(BuildContext context) {
    print('product is: $product');

    if (product is SearchItem) {
      // Convert SearchItem to Product or handle accordingly
      product = convertSearchItemToProduct(product);
    }

    productDetailsController.showMore.value = false;

    List<Productsize> availableSizeOptions = List<Productsize>.from(
      (product.productsize as List<Productsize>)
          .where((element) => element.productQuantity > 0)
          .toSet()
          .toList(),
    );

    print('aval sizes are: $availableSizeOptions');

    List<String> sizeOptions = List<String>.from(
      availableSizeOptions.map((element) => element.size).toSet().toList(),
    );

    print('size options are: ${product.id} $sizeOptions');

    if (sizeOptions.isNotEmpty) {
      productDetailsController.productSize.value = sizeOptions[0];
      productDetailsController.productQuantity.value = 1;
      productDetailsController.getHeightForSizeOptions(sizeOptions.length);
    } else {
      productDetailsController.sizeHeight.value = 0.0;
    }

    print('size options are: ${product.id} $sizeOptions');
    print(
        'size options are: ${product.id} ${productDetailsController.productSize.value}');

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            ImageCarousel(
              product: product,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: commonBackButton(context),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  style: TextStyle(
                                    color: AppColors.primaryColor500,
                                    fontFamily: 'LatoBold',
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              regularDarkText('Size', fontSize: 15),
                              regularDarkText(
                                  sizeOptions.isNotEmpty
                                      ? 'Available in stock'
                                      : 'Out of stock',
                                  fontSize: 18)
                            ],
                          ),
                          Obx(
                            () => Container(
                                height:
                                    productDetailsController.sizeHeight.value,
                                child: GridView.count(
                                  crossAxisCount: 5, // Number of columns
                                  childAspectRatio: 0.6,
                                  physics:
                                      NeverScrollableScrollPhysics(), // Disable scrolling
                                  children: List.generate(
                                    sizeOptions.length,
                                    (index) {
                                      return SizeQuantitySelector(
                                        sizeOptions: sizeOptions,
                                        selectedSizeIndex:
                                            productDetailsController
                                                .selectedProductSize.value,
                                        initialSize: sizeOptions[
                                            index], // Initial size value
                                        initialQuantity:
                                            1, // Initial quantity value
                                        quantityList: List<int>.generate(
                                            availableSizeOptions[index]
                                                .productQuantity,
                                            (index) => index + 1),
                                        onSizeQuantityChanged:
                                            (size, quantity) {
                                          // Handle the size and quantity change here
                                          print(
                                              "Selected size: $size, Selected quantity: $quantity");
                                          productDetailsController
                                              .productSize.value = size;
                                          productDetailsController
                                              .productQuantity.value = quantity;
                                        },
                                      );
                                    },
                                  ),
                                )),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Gross Weight'),
                                  Obx(() => regularDarkText(
                                      '${(product.productsize[productDetailsController.selectedProductSize.value].productWeight * productDetailsController.productQuantity.value).toStringAsFixed(2)} grams',
                                      fontSize: 20,
                                      lineHeight: 1.25))
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  print(
                                      'selected size: ${productDetailsController.productSize.value}');
                                  print(
                                      'selected quantity: ${productDetailsController.productQuantity.value}');

                                  if (sizeOptions.isNotEmpty) {
                                    if (productDetailsController
                                            .productQuantity.value >
                                        0) {
                                      print('product id : ${product.id}');
                                      bool isAddedToCart =
                                          await addToCartController.addToCarts(
                                              product.id,
                                              productDetailsController
                                                  .productQuantity.value,
                                              productDetailsController
                                                  .productSize.value,
                                              product
                                                      .productsize[
                                                          productDetailsController
                                                              .selectedProductSize
                                                              .value]
                                                      .productWeight *
                                                  productDetailsController
                                                      .productQuantity.value);
                                      if (isAddedToCart) {
                                        Toast.success('Product added to cart successfully.');
                                        Get.find<CartController>()
                                            .getCartItems();
                                      }
                                    } else {
                                      Toast.error('Product size is out of stock.');
                                    }
                                  }
                                },
                                child: Card(
                                  color: sizeOptions.isEmpty
                                      ? Colors.grey
                                      : CustomColors.COLOR_PRIMARY,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 50),
                                    child: Text(
                                      'Add to cart',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Product convertSearchItemToProduct(SearchItem searchItem) {
    return Product(
      id: searchItem.id,
      name: searchItem.name,
      catagoryId: searchItem.catagoryId,
      subCatagoryId: searchItem.subCatagoryId,
      image: List<String>.from(searchItem.image),
      cname: searchItem.cname,
      subName: "",  // Provide a default value or use logic to determine subName
      productsize: List<Productsize>.from(searchItem.productsize),
    );
  }
}