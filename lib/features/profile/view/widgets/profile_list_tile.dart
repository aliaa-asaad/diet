

import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      
      leading: const CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
            'https://picsum.photos/200/300'),
      ),
      title: const Text(
        'Mohammed Ali',
        style: TextStyle(
          color: AppColors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Text(
        'Mohamed@example.com',
        style: TextStyle(
          color: AppColors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
     
      onTap: () {},
    );
  }
}