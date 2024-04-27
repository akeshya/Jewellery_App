import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_cart/controllers/user_status_controller.dart';
import 'package:shopping_cart/utils/app_colors.dart';

Future<void> takePhoto(String from) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null && from == 'profile') {
    Get.find<UserStatusController>().updatePickedFile(pickedFile);
  }
}

Future<void> cropImage(XFile pickedFile, BuildContext context, String from) async {
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: pickedFile.path,
    compressFormat: ImageCompressFormat.jpg,
    compressQuality: 50,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: AppColors.primaryColor,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      IOSUiSettings(
        title: 'Cropper',
      ),
      WebUiSettings(
        context: context,
        presentStyle: CropperPresentStyle.dialog,
        boundary: const CroppieBoundary(
          width: 520,
          height: 520,
        ),
        viewPort: const CroppieViewPort(
          width: 480,
          height: 480,
          type: 'circle',
        ),
        enableExif: true,
        enableZoom: true,
        showZoomer: true,
      ),
    ],
  );
  if (croppedFile != null && from == 'profile') {
    Get.find<UserStatusController>().updateProfileImage(croppedFile);
  }
}