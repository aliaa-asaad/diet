import 'package:flutter/material.dart';
import 'package:diet/core/theme/colors.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue.withOpacity(.1), // Facebook blue
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        fixedSize: const Size(150, 56),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.facebook,
        color: AppColors.blue,
      ),
      label: const Text(
        "Facebook",
        style: TextStyle(
            color: AppColors.blue, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
