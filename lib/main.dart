import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Contents/splash_screen.dart';
import 'package:local_news_coupon_finder/Pages/test_page.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NaverMapSdk.instance.initialize(
    clientId: 'hnlakuva17',
    onAuthFailed: (ex) {
      print('*********** naver map auth error: $ex *****************');
    },
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return FlutterWebFrame(
        maximumSize: Size(360, 760), // Maximum size
        enabled: kIsWeb, // default is enable, when disable content is full size
        backgroundColor: Colors.white, // Background color/white space
        builder: (context) {
          return ScreenUtilInit(
            designSize: Size(360, 760),
            builder: (context, child) => MaterialApp(home: SplashScreen()),
          );
        }
    );
  }
}