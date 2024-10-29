import 'package:diet/core/routing/diet_routes.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginForgetPasswordButton extends StatelessWidget {
  const LoginForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.forgetPassword);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
