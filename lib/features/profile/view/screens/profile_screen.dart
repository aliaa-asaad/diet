import 'package:diet/features/profile/view/widgets/profile_app_bar.dart';
import 'package:diet/features/profile/view/widgets/profile_list_tile.dart';
import 'package:diet/features/profile/view/widgets/profile_list_view.dart';
import 'package:diet/features/profile/view/widgets/profile_wallet_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            ProfileAppBar(),
            ProfileListTile(),
            SizedBox(height: 24),
            ProfileWalletCard(),
            SizedBox(height: 16),
            ProfileListView(),
          ],
        ),
      ),
    );
  }
}
