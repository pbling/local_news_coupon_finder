import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePassword extends StatefulWidget {

  @override
  _updatePasswordState createState() => _updatePasswordState();
}

class _updatePasswordState extends State<UpdatePassword>{

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

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
                          "비밀번호 변경",
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
          body: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: .20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '비밀번호 입력',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: min(16.sp, 16.h),
                        fontFamily: "Pretendard"
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '영문, 숫자, 특수문자 조합하여 8~20자로 설정해주세요.',
                    style : TextStyle(
                        color : Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: min(12.sp, 12.h),
                        fontFamily: "Pretendard"
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10.h),
                  // 비밀번호 입력란
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 320.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFF6F6F6), // 배경색 설정
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: min(14.sp, 14.h),
                          fontFamily: "Pretendard"
                      ),
                      onChanged: (value) {
                        setState(() {
                        });
                      },
                      decoration: InputDecoration(
                        hintText: '비밀번호',
                        hintStyle: TextStyle(
                          fontSize: min(14.sp, 14.h),
                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),

                  SizedBox(height: 8.h),
                  // 비밀번호 확인
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 320.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFF6F6F6), // 배경색 설정
                    ),
                    child: TextField(
                      controller: _passwordConfirmController,
                      obscureText: true,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: min(14.sp, 14.h),
                          fontFamily: "Pretendard"
                      ),
                      onChanged: (value) {
                        setState(() {
                        });
                      },
                      decoration: InputDecoration(
                        hintText: '비밀번호 확인',
                        hintStyle: TextStyle(
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
                    width: 320.w,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        print('변경하기');

                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Color(0xFF5EF3D5),
                        minimumSize: Size(280.w, 40.h),
                      ),
                      child : Container(
                        width : 320.w,
                        child: AutoSizeText(
                          '변경하기',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: min(16.sp, 16.h),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
    );
  }
}
