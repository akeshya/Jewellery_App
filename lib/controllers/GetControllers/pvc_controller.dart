import 'dart:convert';
import 'package:get/get.dart';
import '../../model/pvc_modal.dart';
import '../../utils/api_constants.dart';
import 'get_api_controller.dart';

class PvcController extends GetxController {
  RxBool loadingPvc = true.obs;
  var pvcList = <Pvc>[].obs;
  var pvcUpdate = ''.obs;
  var pvcExtra = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPvcList();
  }

  Future<void> getPvcList() async {
    pvcList.clear();
    loadingPvc.value = true;

    var pvcResponse = await Get.find<GetApiController>()
        .getControllers(ApiConstants.baseUrl + ApiConstants.pvcEndPoint);

    if (pvcResponse.statusCode == 200) {
      if(pvcResponse.data != null) {
        final pvcListModal = pvcListModalFromJson(json.encode(pvcResponse.data));
        pvcUpdate.value = pvcListModal.updatedAt;
        pvcExtra.value = pvcListModal.extra;
        pvcList.value = pvcListModal.data;
      }
    }

    loadingPvc.value = false;
  }
}