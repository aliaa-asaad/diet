import 'package:diet/core/routing/diet_routes.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginDontHaveAnAccount extends StatelessWidget {
  const LoginDontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.register);
          },
          child: const Text(
            "Create new one",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
