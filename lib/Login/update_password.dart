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

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52.h,
        bottomOpacity : 0.0,
        backgroundColor: Colors.white,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              width: 300.w,
              height: 50.h,
              child: Row(
                children: [
                  SizedBox(width: 25.w),
                  Text(
                    '비밀번호 찾기',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.sp,
                        fontFamily: "Pretendard"
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              height: 1, // 회색 줄의 높이
              color: Color(0xFFF5F5F5), // 회색 줄의 색상
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: .20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 비밀번호
                AutoSizeText(
                  '비밀번호 입력',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16.sp,
                      fontFamily: "Pretendard"
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 6.h),
                AutoSizeText(
                  '영문, 숫자, 특수문자를 조합하여 8~20자로 설정해주세요.',
                  style : TextStyle(
                      color : Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      fontFamily: "Pretendard"
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10.h),
                // 비밀번호 입력란
                Container(
                  width: 320.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFF6F6F6), // 배경색 설정
                  ),
                  child: TextField(
                    controller: _passwordController,
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                    decoration: InputDecoration(
                      hintText: '비밀번호',
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
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
                  width: 320.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFF6F6F6), // 배경색 설정
                  ),
                  child: TextField(
                    controller: _passwordConfirmController,
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                    decoration: InputDecoration(
                      hintText: '비밀번호 확인',
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
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
                          fontSize: 16.sp,
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
