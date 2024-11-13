import 'package:diet/core/handlers/shared_handler.dart';
import 'package:diet/core/network/dio_helper.dart';
import 'package:diet/core/routing/diet_routes.dart';
import 'package:diet/core/routing/navigator.dart';
import 'package:diet/core/theme/app_theme.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHandler.init();
  await DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RichDiet',
      theme: AppTheme.lightTheme,
      routes: AppNavigator.routes,
      // home: const LoginScreen(),
      initialRoute: AppRoutes.splash,
    );
  }
}
