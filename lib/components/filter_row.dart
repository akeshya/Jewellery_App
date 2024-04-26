import 'package:flutter/material.dart';
import '../utils/CustomTextStyle.dart';
import '../utils/app_colors.dart';

Widget filterRow(IconData icon, String title) {
  return Container(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.primaryColor500,
          ),
          SizedBox(width: 4),
          Text(
            title,
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: AppColors.primaryColor500, fontSize: 14),
          )
        ],
      ),
    ),
  );
}