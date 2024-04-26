import 'dart:convert';
import 'package:get/get.dart';
import '../../model/tnc_modal.dart';
import '../../utils/api_constants.dart';
import 'get_api_controller.dart';

class TncController extends GetxController {
  RxBool loadingTnc = true.obs;
  var tncUpdate = ''.obs;
  var tncList = <Tnc>[].obs;

  RxBool isChecked = false.obs;
  RxInt selectedButton = 0.obs;

  void selectButton(int buttonIndex) {
    selectedButton.value = buttonIndex;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTncList();
  }

  Future<void> getTncList() async {
    tncList.clear();
    loadingTnc.value = true;

    var tncResponse = await Get.find<GetApiController>()
        .getControllers(ApiConstants.baseUrl + ApiConstants.tncEndPoint);

    if (tncResponse.statusCode == 200) {
      if(tncResponse.data != null) {
        final tncListModal = tncListModalFromJson(json.encode(tncResponse.data));
        tncUpdate.value = tncListModal.updatedAt;
        tncList.value = tncListModal.data;
      }
    }

    loadingTnc.value = false;
  }
}