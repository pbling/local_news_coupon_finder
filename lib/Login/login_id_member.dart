import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'find_password.dart';
import 'join_userInfo.dart';


class LoginIdMember extends StatefulWidget {
  LoginIdMember({Key?key}) : super(key:key);

  @override
  _loginIdMemberState createState() => _loginIdMemberState();
}

class _loginIdMemberState extends State<LoginIdMember> {

  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  void _showLoginErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              '로그인 실패',
              style: TextStyle(
                fontFamily: "Pretendard",
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: min(14.sp, 14.h),
              )
          ),
          content: Text(
              '입력하신 정보와 일치하는 회원이 없습니다.',
              style: TextStyle(
                fontFamily: "Pretendard",
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: min(14.sp, 14.h),
              )
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  void _login(){
    bool loginSuccess = false;
    if(loginSuccess){
      // 로그인 성공 시, 마이페이지로 이동

    } else {
      // 로그인 실패 시, 에러 팝업 표시
      _showLoginErrorDialog();
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(360.w, 50.h),
            child: AppBar(
              toolbarHeight: 50.h,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: min(16.h, 16.sp),
                ),
                onPressed: () {
                  Navigator.pop(context); // 이전 화면으로 돌아가기
                },
              ),
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    width: 360.w,
                    height: 49.h,
                    child: Row(
                      children: [
                        SizedBox(width: 50.w),
                        Text(
                          "로그인",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: min(16.h, 16.sp),
                              fontFamily: "Pretendard"
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1.h, // 회색 줄의 높이
                    color: Color(0xFFF5F5F5), // 회색 줄의 색상
                  ),
                ],
              ),
            ),
          ),
          body : Container(
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
                  // ID, PWD 입력
                  Container(
                    width: 280.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFF6F6F6), // 배경색 설정
                    ),
                    child: TextField(
                      controller: _userIdController,
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: min(14.sp, 14.h),
                      ),
                      decoration: InputDecoration(
                        hintText: '아이디',
                        hintStyle: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: min(14.sp, 14.h),
                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),

                  SizedBox(height: 15.h),
                  Container(
                    width: 280.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFF6F6F6), // 배경색 설정
                    ),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: min(14.sp, 14.h),
                      ),
                      decoration: InputDecoration(
                        hintText: '비밀번호',
                        hintStyle: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: min(14.sp, 14.h),
                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),

                  SizedBox(height: 21.h),
                  // 로그인하기
                  Container(
                    width: 280.w,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        print('로그인');
                        // 로그인 처리

                        _login();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Color(0xFF5EF3D5),
                        minimumSize: Size(280.w, 40.h),
                      ),
                      child : Container(
                        width : 280.w,
                        child: Text(
                          '로그인',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: min(16.sp, 16.h),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),
                  // 회원가입

                  Container(
                    width: 200.w,
                    height: 44.h,
                    child :Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        //회원가입
                        Container(
                          width: 60.w,
                          height: 20.h,
                          child: GestureDetector(
                            onTap: () {
                              print('회원가입');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => JoinUserInfo()),
                              );
                            },
                            child: Text(
                              '회원가입',
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                color: Colors.blue,
                                fontSize: min(16.sp, 16.h),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        Container(
                          width: 1,
                          height: 44.h,
                          color: Color(0xFF999999),
                        ),

                        //비밀번호찾기
                        Container(
                          width: 60.w,
                          height: 20.h,
                          child: GestureDetector(
                            onTap: () {
                              print('비밀번호찾기');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FindPassword()),
                              );
                            },
                            child: Text(
                              '비밀번호 찾기',
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                color: Colors.blue,
                                fontSize: min(16.sp, 16.h),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
