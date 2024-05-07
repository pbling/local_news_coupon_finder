import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Login/update_password.dart';

class FindPassword extends StatefulWidget {

  @override
  _findPasswordState createState() => _findPasswordState();
}

class _findPasswordState extends State<FindPassword>{

  TextEditingController _idController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _phoneConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child : Scaffold(
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
                        "비밀번호 찾기",
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
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: .20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '아이디 입력',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: min(16.sp, 16.h),
                      fontFamily: "Pretendard"
                  ),
                  textAlign: TextAlign.left,
                ),

                SizedBox(height: 10.h),
                Container(
                  width: 320.w,
                  height: 45.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 320.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF6F6F6), // 배경색 설정
                        ),
                        child: TextField(
                          controller: _idController,
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

                    ],
                  ),
                ),

                SizedBox(height: 25.h),

                Text(
                  '휴대폰번호 입력',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: min(16.sp, 16.h),
                      fontFamily: "Pretendard"
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 6.h),
                Text(
                  '번호만 입력해주세요.',
                  style : TextStyle(
                      color : Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: min(12.sp, 12.h),
                      fontFamily: "Pretendard"
                  ),
                  textAlign: TextAlign.left,
                ),


                SizedBox(height: 10.h),

                Container(
                  width: 320.w,
                  height: 45.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 240.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF6F6F6), // 배경색 설정
                        ),
                        child: TextField(
                          controller: _phoneController,
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
                            hintText: '휴대폰번호',
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
                      Container(
                        width: 70.w,
                        height: 30.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.grey, // 버튼 배경색 변경
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0), // 버튼 모양을 직사각형으로 변경
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: (){

                            },
                            child: Center(
                              child :Text(
                                '인증번호',
                                style: TextStyle(
                                  fontFamily: "Pretendard",
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: min(11.sp, 11.h), // 텍스트 컬러 변경
                                ),
                              ),
                            )
                        ),
                      )

                    ],
                  ),
                ),



                SizedBox(height: 8.h),

                Container(
                  width: 320.w,
                  height: 45.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 240.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF6F6F6), // 배경색 설정
                        ),
                        child: TextField(
                          controller: _phoneConfirmController,
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
                            hintText: '인증번호 입력',
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
                      Container(
                        width: 70.w,
                        height: 30.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.grey, // 버튼 배경색 변경
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0), // 버튼 모양을 직사각형으로 변경
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: (){

                            },
                            child: Center(
                              child :Text(
                                '확인',
                                style: TextStyle(
                                  fontFamily: "Pretendard",
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: min(11.sp, 11.h), // 텍스트 컬러 변경
                                ),
                              ),
                            )
                        ),
                      )

                    ],
                  ),
                ),


                SizedBox(height: 21.h),
                // 로그인하기
                Container(
                  width: 320.w,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () {
                      print('다음');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePassword()),
                      );
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
                        '다음',
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
