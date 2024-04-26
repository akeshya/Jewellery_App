import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

Widget loaderWidget() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(color: AppColors.primaryColor500),
    ),
  );
}