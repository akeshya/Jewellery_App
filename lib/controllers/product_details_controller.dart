import 'package:get/get.dart';

class ProductDetailsController extends GetxController {

  RxBool showMore = false.obs;

  RxString productSize = '0'.obs;
  RxInt productQuantity = 1.obs;
  RxInt selectedProductSize = 0.obs;

  RxDouble sizeHeight = 120.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  getHeightForSizeOptions(int sizeOptionsCount) {
    selectedProductSize.value = 0;
    if (sizeOptionsCount <= 5) {
      sizeHeight.value = 120.0;
    } else if (sizeOptionsCount <= 10) {
      sizeHeight.value = 240.0;
    } else if (sizeOptionsCount <= 15) {
      sizeHeight.value = 360.0;
    } else {
      sizeHeight.value = 480.0;
    }
  }
}