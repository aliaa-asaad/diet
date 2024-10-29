import 'package:diet/core/theme/assets/icons.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green.withOpacity(.1), // Facebook blue
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        fixedSize: const Size(150, 56),
      ),
      onPressed: () {},
      icon: SvgPicture.asset(
        AppIcons.google,
      ),
      label: const Text(
        "Google",
        style: TextStyle(
            color: AppColors.green, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
