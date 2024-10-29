import 'package:diet/core/theme/assets/icons.dart';
import 'package:diet/core/theme/assets/images.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileWalletCard extends StatelessWidget {
  const ProfileWalletCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              image: AssetImage(AppImages.profileWalletCard),
              fit: BoxFit.cover)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Last Charged : 01-01-2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Your Wallet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 15,
                      width: 5,
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '280,00AED',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: SvgPicture.asset(AppIcons.manage),
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                    backgroundColor: Colors.white, padding: EdgeInsets.zero),
                onPressed: () {},
              ),
              const SizedBox(height: 4),
              const Text(
                'Manage',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
