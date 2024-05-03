import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JoinUserInfo extends StatefulWidget {

  @override
  _joinUserInfoState createState() => _joinUserInfoState();
}

class _joinUserInfoState extends State<JoinUserInfo>{

  bool _isIdAvailable = false;

  TextEditingController _idController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

  void _checkIdAvailability() {

    // 아이디 중복 확인

    bool isAvailable = true;
    setState(() {
      _isIdAvailable = isAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                    '회원가입',
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
        child : SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: .20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 아이디
                  Text(
                    '아이디 입력',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.sp,
                        fontFamily: "Pretendard"
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '영문과 숫자를 조합하여 5 ~ 10자로 입력해주세요.',
                    style : TextStyle(
                        color : Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        fontFamily: "Pretendard"
                    ),
                    textAlign: TextAlign.left,
                  ),


                  SizedBox(height: 10.h),
                  // 아이디입력 및 중복확인
                  Container(
                    width: 320.w,
                    height: 42.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 240.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFFF6F6F6), // 배경색 설정
                          ),
                          child: TextField(
                            controller: _idController,
                            onChanged: (value) {
                              setState(() {
                              });
                            },
                            decoration: InputDecoration(
                              hintText: '아이디',
                              hintStyle: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 12.sp,
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
                              onPressed: _checkIdAvailability,
                              child: Center(
                                child :Text(
                                  '중복확인',
                                  style: TextStyle(
                                    fontFamily: "Pretendard",
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp, // 텍스트 컬러 변경
                                  ),
                                ),
                              )
                          ),
                        )

                      ],
                    ),
                  ),

                  SizedBox(height: 25.h),

                  Text(
                    '휴대폰번호 입력',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.sp,
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
                        fontSize: 10.sp,
                        fontFamily: "Pretendard"
                    ),
                    textAlign: TextAlign.left,
                  ),


                  SizedBox(height: 10.h),

                  Container(
                    width: 320.w,
                    height: 42.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 240.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFFF6F6F6), // 배경색 설정
                          ),
                          child: TextField(
                            controller: _idController,
                            onChanged: (value) {
                              setState(() {
                              });
                            },
                            decoration: InputDecoration(
                              hintText: '아이디',
                              hintStyle: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 12.sp,
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
                              onPressed: _checkIdAvailability,
                              child: Center(
                                child :Text(
                                  '본인인증',
                                  style: TextStyle(
                                    fontFamily: "Pretendard",
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp, // 텍스트 컬러 변경
                                  ),
                                ),
                              )
                          ),
                        )

                      ],
                    ),
                  ),


                  SizedBox(height: 25.h),
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
                        print('가입하기');
                        //
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
                          '가입하기',
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
      ),
    );

  }
}
