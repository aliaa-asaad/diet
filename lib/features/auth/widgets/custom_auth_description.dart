import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAuthDescription extends StatelessWidget {
  final String description;
  const CustomAuthDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.grey,
      ),
    );
  }
}
