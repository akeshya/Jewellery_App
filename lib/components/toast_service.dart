import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  show(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.black);
  }

  showLong(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_LONG);
  }

  showInCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        gravity: ToastGravity.CENTER);
  }
}
