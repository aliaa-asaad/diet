import 'package:diet/core/theme/assets/icons.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/cart/view/screens/cart_screen.dart';
import 'package:diet/features/home/home_screen.dart';
import 'package:diet/features/nav_bar/domain/nav_bar_model.dart';
import 'package:diet/features/plans/view/screens/plans_screen.dart';
import 'package:diet/features/profile/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;
  final List<NavBarModel> _body = [
    NavBarModel(
      title: 'Home',
      icon: AppIcons.home,
      body: const HomeScreen(),
    ),
    NavBarModel(
      title: 'Plans',
      icon: AppIcons.plans,
      body: const PlansScreen(),
    ),
    NavBarModel(
      title: 'Cart',
      icon: AppIcons.cart,
      body: const CartScreen(),
    ),
    
    NavBarModel(
      title: 'Profile',
      icon: AppIcons.profile,
      body: const ProfileScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_selectedIndex].body,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
          unselectedIconTheme: const IconThemeData(color: AppColors.grey),
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grey,
          selectedLabelStyle: const TextStyle(
            color: AppColors.primaryColor,
          ),
          currentIndex: _selectedIndex,
          unselectedLabelStyle: const TextStyle(
            color: AppColors.grey,
          ),
          
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: List<BottomNavigationBarItem>.generate(
            _body.length,
            (index) => BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(_body[index].icon,
                  color: AppColors.primaryColor),
              icon: SvgPicture.asset(_body[index].icon,
                  color:   AppColors.grey),
              label: _body[index].title,
            ),
          ),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
