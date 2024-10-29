import 'package:diet/core/routing/diet_routes.dart';
import 'package:diet/core/routing/navigator.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RichDiet',
      
      routes: AppNavigator.routes,
      // home: const LoginScreen(),
      initialRoute: AppRoutes.splash,
    );
  }
}
