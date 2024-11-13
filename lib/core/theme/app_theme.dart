import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
 static ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    fontFamily: 'Cairo',
    appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(fontFamily: 'Cairo')),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: const Color(0xffF4F4F5),
    colorScheme: const ColorScheme.light(
      
      primary:AppColors.primaryColor,
      
      // background: const Color(0xff2F80ED).withOpacity(.3),
      brightness: Brightness.light,
      primaryContainer: Colors.white,
      secondaryContainer: Colors.grey,
    ),
  );
}