import 'dart:async';

import 'package:diet/core/handlers/shared_handler.dart';
import 'package:diet/core/routing/diet_routes.dart';
import 'package:diet/core/theme/assets/images.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      if (await SharedHandler.instance!
          .getData(key: SharedKeys().isLogin, valueType: ValueType.bool))
        {Navigator.pushReplacementNamed(context, AppRoutes.navBar);}
      else
       { Navigator.pushReplacementNamed(context, AppRoutes.login);}
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (width == 150) {
        setState(() {
          width = 130;
          height = 200;
        });
      } else if (width == 130) {
        setState(() {
          width = 150;
          height = 154;
        });
      }
      // timer.cancel();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  double height = 180;
  double width = 150;
  late Timer timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              width: width,
              height: height,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                AppImages.logo,
                width: 130,
              ),
            ),
          ),
          const Positioned(
            bottom: 85,
            right: 0,
            left: 0,
            //     top: 0,
            child: Text(
              'Richdiets 2023',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
