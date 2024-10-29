import 'package:diet/core/theme/assets/images.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.appBar),
        Positioned(
          bottom: 90,
          left: 0,
          right: 0,
          child: Image.asset(
            AppImages.logo2,
            height: 90,
          ),
        )
      ],
    );
  }
}
