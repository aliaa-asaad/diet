import 'dart:io';

import 'package:diet/core/routing/diet_routes.dart';
import 'package:diet/core/theme/assets/icons.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/profile/domain/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ProfileModel> content = [
      ProfileModel(
          title: 'Orders',
          icon: AppIcons.orders,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.total);
          }),
      ProfileModel(
        title: 'Supscriptions',
        icon: AppIcons.plans,
      ),
      ProfileModel(
        title: 'Notifications',
        icon: AppIcons.notification,
      ),
      ProfileModel(
        title: 'Addresses',
        icon: AppIcons.addresses,
      ),
      ProfileModel(
        title: 'Wishlist',
        icon: AppIcons.wishlist,
      ),
      ProfileModel(
        title: 'Edit Profile',
        icon: AppIcons.edit,
      ),
      ProfileModel(
        title: 'Refer and earn',
        icon: AppIcons.refer,
      ),
      ProfileModel(
        title: 'Share the app',
        icon: AppIcons.share,
      ),
      ProfileModel(
        title: 'Rate the app',
        icon: AppIcons.rate,
      ),
      ProfileModel(
        title: 'Report an issue',
        icon: AppIcons.edit,
      ),
      ProfileModel(
        title: 'Logout',
        icon: AppIcons.logout,
      ),
    ];

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          onTap: content[index].onTap,
          minVerticalPadding: EdgeInsets.zero.vertical,
          contentPadding: EdgeInsets.zero,
          title: Text(
            content[index].title,
            style: TextStyle(
              color:
                  index == content.length - 1 ? AppColors.red : AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: SvgPicture.asset(
            content[index].icon,
          ),
          trailing: index == content.length - 1
              ? null
              : Platform.isIOS
                  ? const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grey,
                    )
                  : const Icon(
                      Icons.arrow_forward,
                      color: AppColors.grey,
                    ),
        );
      },
      itemCount: content.length,
    );
  }
}
