import 'package:diet/core/routing/diet_routes.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class RegisterAlreadyHaveAnAccount extends StatelessWidget {
  const RegisterAlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already an existing user? ",
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
            "Login",
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
