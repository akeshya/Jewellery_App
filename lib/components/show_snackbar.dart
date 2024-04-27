import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import the Get package

void showSnackBar({
  required String title,
  required String message,
  required Color snackColor
}) {
  Get.snackbar(
    'Success: ',
    message,
    titleText: Text(
      title,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: snackColor,
    duration: title == 'Added' || title == 'Deleted' ? const Duration(milliseconds: 800) : const Duration(milliseconds: 2000)
  );
}