import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController controller;
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: const TextStyle(
              color: AppColors.hint, fontSize: 14, fontWeight: FontWeight.w500),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey),
          )),
    );
  }
}
