import 'package:flutter/material.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/product_details_controller.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import '../utils/CustomColors.dart';
import 'package:get/get.dart';

class SizeQuantitySelector extends StatefulWidget {
  final List<String> sizeOptions;
  final int selectedSizeIndex;
  final String initialSize;
  final List<int> quantityList;
  final int initialQuantity;
  final void Function(String size, int quantity) onSizeQuantityChanged;

  SizeQuantitySelector({
    required this.sizeOptions,
    required this.selectedSizeIndex,
    required this.initialSize,
    required this.quantityList,
    required this.initialQuantity,
    required this.onSizeQuantityChanged,
  });

  @override
  _SizeQuantitySelectorState createState() => _SizeQuantitySelectorState();
}

class _SizeQuantitySelectorState extends State<SizeQuantitySelector> {
  String selectedSize = '0';
  int selectedQuantity = 0;

  final productDetailsController = Get.find<ProductDetailsController>();

  @override
  void initState() {
    super.initState();
    selectedSize = widget.initialSize;
    selectedQuantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
      return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: GestureDetector(
                  onTap: () => setState(() {
                    if(widget.quantityList.isEmpty) {
                      Toast.error('Product size is out of stock');
                      widget.onSizeQuantityChanged(selectedSize, 0);
                      productDetailsController.selectedProductSize.value = widget.sizeOptions.indexOf(selectedSize);
                    } else {
                      widget.onSizeQuantityChanged(
                          selectedSize, selectedQuantity);
                      productDetailsController.selectedProductSize.value =
                          widget.sizeOptions.indexOf(selectedSize);
                    }
                  }),
                  child: Obx(() =>
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: widget.sizeOptions.indexOf(selectedSize) == productDetailsController.selectedProductSize.value ? AppColors.primaryColor500 : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: widget.sizeOptions.indexOf(selectedSize) == productDetailsController.selectedProductSize.value ? Colors.white : Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          selectedSize.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.sizeOptions.indexOf(selectedSize) == productDetailsController.selectedProductSize.value ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Obx(() =>
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: widget.sizeOptions.indexOf(selectedSize) == productDetailsController.selectedProductSize.value ? CustomColors.COLOR_PRIMARY : Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child:  DropdownButton<int>(
                          value: widget.sizeOptions.indexOf(selectedSize) == productDetailsController.selectedProductSize.value ? selectedQuantity : null, // Enable if size matches
                          onChanged: selectedSize == widget.sizeOptions[productDetailsController.selectedProductSize.value]
                              ? (value) {
                            setState(() {
                              selectedQuantity = value!;
                              widget.onSizeQuantityChanged(selectedSize, selectedQuantity);
                            });
                          }
                              : null, // Disable if size doesn't match
                          items: widget.quantityList.take(100).map((quantity) {
                            return DropdownMenuItem<int>(
                              value: quantity,
                              child: Text(quantity.toString()),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}