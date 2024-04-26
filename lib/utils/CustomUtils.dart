import 'package:flutter/material.dart';

import '../components/custom_toast.dart';

class Utils {

  static bool isNumeric(String number) {
    if (number == null) {
      return false;
    }
    return double.tryParse(number) != null;
  }

  static bool isValidEmail(String email) {
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static bool validateGSTNumber(String gstNumber) {
    // Define the regular expression for GST number validation
    RegExp gstRegExp = RegExp(
      r"^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}[1-9A-Z]{2}$",
    );

    if (gstRegExp.hasMatch(gstNumber)) {
      return true;
    } else {
      Toast.error("Invalid GST Number please enter valid GST number");
      return false;
    }
  }
}
