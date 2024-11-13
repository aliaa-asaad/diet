import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;
  final bool? isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Widget? suffixIcon;

  const CustomFormField({
    super.key,
    this.validator,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.isPassword = false,
    this.textInputType,
    this.suffixIcon,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType ?? TextInputType.text,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword != null && widget.isPassword == true
          ? passwordVisible
          : false,
      decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword != null && widget.isPassword == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(
                    passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.primaryColor,
                  ),
                )
              : widget.suffixIcon ?? const SizedBox(),
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
