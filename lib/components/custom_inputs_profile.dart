import 'package:flutter/material.dart';

import '../utils/CustomColors.dart';
import 'common_components.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final String labelText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? Function(String?)? validator;

  CustomTextField({
    required this.controller,
    required this.enabled,
    required this.labelText,
    required this.prefixIcon,
    required this.keyboardType,
    this.maxLength,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            regularDarkText(labelText, color: Colors.black),
          ],
        ),
        TextFormField(
          style: TextStyle(color: CustomColors.COLOR_PRIMARY_500),
          keyboardType: keyboardType,
          maxLength: maxLength,
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.orange.shade50,
            border: InputBorder.none,
            hintText: 'Enter $labelText',
            hintStyle: TextStyle(color: CustomColors.COLOR_PRIMARY_500),
            prefixIcon: Icon(prefixIcon, color: CustomColors.COLOR_PRIMARY_500, size: 20),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          ),
          validator: validator,
        )
      ],
    );
  }
}