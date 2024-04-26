import 'package:flutter/material.dart';
import 'package:shopping_cart/components/common_components.dart';
import '../utils/CustomBorder.dart';
import '../utils/CustomTextStyle.dart';

class CustomTextInput extends StatelessWidget {
  final String topLabel;
  final String label;
  final bool isEditable;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Icon prefixIcon;

  const CustomTextInput({Key? key,
    required this.label,
    required this.isEditable,
    required this.keyboardType,
    this.maxLength,
    this.validator,
    required this.controller, required this.prefixIcon, required this.topLabel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          regularDarkText(topLabel, fontSize: 14, color: Color(0xFF171A1F)),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            enabled: isEditable,
            validator: validator,
            maxLength: maxLength,
            keyboardType: keyboardType,
            style: TextStyle(
                fontFamily: 'LatoBold',
                fontSize: 14,
                color: Color(0xFFCC7B25)), // Change text input color
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFFDF7F2),
              prefixIcon: prefixIcon,
              contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              border: CustomBorder.enabledBorder,
              hintText: label,
              focusedBorder: CustomBorder.focusBorder,
              errorBorder: CustomBorder.errorBorder,
              enabledBorder: CustomBorder.enabledBorder,
              hintStyle: CustomTextStyle.textFormFieldRegular.copyWith(
                fontFamily: 'LatoBold',
                fontSize: 14,
                color: Color(0xFFCC7B25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}