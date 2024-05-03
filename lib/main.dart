import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Contents/splash_screen.dart';
import 'Navigation/navigation.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await NaverMapSdk.instance.initialize(
      clientId: 'hnlakuva17',
      onAuthFailed: (ex) {
        print('*********** naver map auth error: $ex *****************');
      }
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 685),
      builder: (context, child) => MaterialApp(
        home: SplashScreen(),  // 또는 기타 시작 페이지
      ),
    );
  }
}