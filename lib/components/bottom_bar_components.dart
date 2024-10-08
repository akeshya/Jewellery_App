import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import '../utils/CustomColors.dart';

Widget commonBottomTab(int selectedPosition, int tabPosition) {
  bool isCartTab = tabPosition == 3;

  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    color: selectedPosition == tabPosition
        ? CustomColors.COLOR_SECONDARY
        : Colors.white,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              tabPosition == 0
                  ? Icons.home
                  : tabPosition == 1
                  ? Icons.category
                  : tabPosition == 2
                  ? Icons.shopping_basket
                  : tabPosition == 3
                  ? Icons.shopping_cart
                  : Icons.person,
              size: 24,
              color: selectedPosition == tabPosition
                  ? CustomColors.COLOR_PRIMARY_500
                  : CustomColors.COLOR_UNSELECTED_ICON,
            ),
            Text(
              tabPosition == 0
                  ? 'Home'
                  : tabPosition == 1
                  ? 'Categories'
                  : tabPosition == 2
                  ? 'My Orders'
                  : tabPosition == 3
                  ? 'Cart'
                  : 'Account',
              style: TextStyle(
                fontSize: 10,
                color: selectedPosition == tabPosition
                    ? CustomColors.COLOR_PRIMARY_500
                    : CustomColors.COLOR_UNSELECTED_ICON,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}