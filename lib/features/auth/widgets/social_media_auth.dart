import 'package:flutter/material.dart';
import 'package:diet/features/auth/widgets/facebook_button.dart';
import 'package:diet/features/auth/widgets/google_button.dart';

class SocialMediaAuth extends StatelessWidget {
  const SocialMediaAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child:FacebookButton())
        ,
        const SizedBox(width: 16),
       Expanded(child: GoogleButton()),
      ],
    );
  }
}
