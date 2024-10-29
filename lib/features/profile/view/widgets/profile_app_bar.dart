
import 'package:diet/core/theme/assets/icons.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      const Text(
              'Profile',
              style: TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
              ),
            ),
             IconButton(
    icon: SvgPicture.asset(AppIcons.setting),
    onPressed: () {},
              ),
      ],
    );
  }
}
