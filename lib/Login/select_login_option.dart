import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_id_member.dart';


class SelectLoginOption extends StatefulWidget {
  SelectLoginOption({Key?key}) : super(key:key);

  @override
  _selectLoginOptionState createState() => _selectLoginOptionState();
}

class _selectLoginOptionState extends State<SelectLoginOption> {

  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  Widget snsLoginButton(String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          width: 40.w, // 버튼의 높이
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
  // iOS에 대한 버튼 UI 반환
  Widget _buildIOSButtons() {

    return Container(
      width: 180.w,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          snsLoginButton('assets/images/icon/naver.png', () {
            print('간편로그인 - Naver');
            // 네이버 코드 입력
          }),
          SizedBox(width: 27.w),
          snsLoginButton('assets/images/icon/kakao.png', () {
            print('간편로그인 - Kakao');
            // 카카오 코드 입력
          }),
          SizedBox(width: 27.w),
          snsLoginButton('assets/images/icon/apple.png', () {
            print('간편로그인 - Apple');
            // 카카오 코드 입력
          }),
        ],
      ),
    );
  }

  // Android에 버튼 UI 반환
  Widget _buildAndroidButtons() {
    return Container(
      width: 180.w,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          snsLoginButton('assets/images/icon/naver.png', () {
            print('간편로그인 - Naver');
            // 네이버 코드 입력
          }),
          SizedBox(width: 27.w),
          snsLoginButton('assets/images/icon/kakao.png', () {
            print('간편로그인 - Kakao');
            // 카카오 코드 입력
          }),
        ],
      ),
    );
  }


  // 일반 회원가입 버튼 반환
  Widget _buildUserButton(){
    return Container(
      width: 180.w,
      height: 40.h,
      child: Center(
        child: snsLoginButton('assets/images/icon/user.png',
                (){print('일반로그인 - ID');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginIdMember()),
            );}
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body : SafeArea (
        child: Container(
          width: 360.w,
          height: 685.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 동네곳곳 로고
                Image.asset(
                  'assets/images/icon/logo.png',
                  width: 180.w,
                  height: 40.h,
                ),

                SizedBox(height: 30.h),

                // SNS 간편로그인
                Container(
                  width: 280.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70.w,
                        height: 1.0,
                        color: Color(0xFF999999),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 120.w,
                        child: Text(
                          'SNS 간편 로그인',
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            color: Color(0xFF999999),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 70.w,
                        height: 1.0,
                        color: Color(0xFF999999),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 21.h),
                _buildIOSButtons(),
                //if(!kIsWeb) Platform.isIOS? _buildAndroidButtons() : _buildIOSButtons(),

                //Platform.isAndroid? _buildIOSButtons() :_buildAndroidButtons(),
                /*
              // SNS 아이콘
              Container(
                width: screenSize.width * 240 / design_w,
                height: screenSize.height * 40 / design_h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        print('간편로그인');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            screenSize.width * 20 / design_w),
                        child: Image.asset(
                          'assets/images/login/sns1.png',
                          fit: BoxFit.fill, // 이미지를 부모 위젯에 꽉 차게 표시
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 27 / design_w),
                    InkWell(
                      onTap: () {
                        print('간편로그인');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            screenSize.width * 20 / design_w),
                        child: Image.asset(
                          'assets/images/login/sns2.png',
                          fit: BoxFit.fill, // 이미지를 부모 위젯에 꽉 차게 표시
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 27 / design_w),
                    InkWell(
                      onTap: () {
                        print('간편로그인');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            screenSize.width * 20 / design_w),
                        child: Image.asset(
                          'assets/images/login/sns3.png',
                          fit: BoxFit.fill, // 이미지를 부모 위젯에 꽉 차게 표시
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 27 / design_w),
                    InkWell(
                      onTap: () {
                        print('간편로그인');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            screenSize.width * 20 / design_w),
                        child: Image.asset(
                          'assets/images/login/sns4.png',
                          fit: BoxFit.fill, // 이미지를 부모 위젯에 꽉 차게 표시
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/

                SizedBox(height: 30.h),

                // 회원 로그인
                Container(
                  width: 280.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70.w,
                        height: 1.0,
                        color: Color(0xFF999999),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 120.w,
                        child: Text(
                          '회원 로그인',
                          style:
                          TextStyle(
                            fontFamily: "Pretendard",
                            color: Color(0xFF999999),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 70.w,
                        height: 1.0,
                        color: Color(0xFF999999),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 21.h),
                _buildUserButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
