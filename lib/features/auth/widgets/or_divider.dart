import 'package:flutter/material.dart';
import 'package:diet/core/theme/colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.lightGrey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "OR",
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.lightGrey,
          ),
        ),
      ],
    );
  }
}
