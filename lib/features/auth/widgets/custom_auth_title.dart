import 'package:flutter/material.dart';
import 'package:diet/core/theme/colors.dart';

class CustomAuthTitle extends StatelessWidget {
  final String title;
  const CustomAuthTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.black),
    );
  }
}
