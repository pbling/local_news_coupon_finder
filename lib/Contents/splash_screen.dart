import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Pages/test_page.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        splash: Center(
          child: Container(
            width: 185.22.w,
            height: 44.h,
            child: Image.asset('assets/images/icon/logo.png'),
          ),
        ),
        nextScreen: MyHomePage(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 500,
      ),
    );
  }
}