import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JoinTerms extends StatefulWidget {
  @override
  _joinTermsState createState() => _joinTermsState();
}

class _joinTermsState extends State<JoinTerms> {

  List<bool> _isCheckedList = List.generate(3, (index) => false);
  bool _isAllChecked = false;

  @override
  Widget build(BuildContext context) {
    List<String> textList = ['이용약관 (필수)', '개인정보 처리방침 (필수)', '위치기반서비스 약관 (필수)'];

    return SafeArea(
      child: Scaffold(
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
                      '약관동의',
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
        body: Column(
          children: [
            SizedBox(height: 44.h),
            // 서비스이용약관
            Container(
              margin: EdgeInsets.only(left: 30.w),
              alignment: Alignment.topLeft,
              width: 320.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '서비스 이용을 위해',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        fontFamily: "Pretendard"
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height : 2.h),
                  Text(
                    '약관에 동의해 주세요.',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        fontFamily: "Pretendard"
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            Container(
              margin: EdgeInsets.only(left: 15.w),
              alignment: Alignment.topLeft,
              width: 320.w,
              height: 300.h,
              child: Column(
                children: [
                  ListTile(
                    horizontalTitleGap: 0.0,
                    title: Text(
                      '전체 약관에 동의합니다.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: "Pretendard"
                      ),
                      textAlign: TextAlign.left,
                    ),
                    leading: IconButton(
                      icon: _isAllChecked
                          ? Icon(Icons.check_circle)
                          : Icon(Icons.check_circle_outline),
                      onPressed: () {
                        setState(() {
                          _isAllChecked = !_isAllChecked;
                          print('클릭' + _isAllChecked.toString());
                          _isCheckedList = List.generate(3, (
                              index) => _isAllChecked);
                        });
                      },
                    ),
                  ),
                  ...List.generate(
                    _isCheckedList.length,
                        (index) =>
                        ListTile(
                          horizontalTitleGap: 0.0,
                          title: Row(
                            children: [
                              Text(
                                textList[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16.0.sp,
                                  fontFamily: "Pretendard",
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  print('자세한 약관 이동');
                                },
                                child: Text(
                                  '자세히',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueAccent,
                                    fontSize: 14.0.sp,
                                    fontFamily: "Pretendard",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          leading: IconButton(
                            icon: _isCheckedList[index]
                                ? Icon(Icons.check_circle)
                                : Icon(Icons.check_circle_outline),
                            onPressed: () {
                              setState(() {
                                _isCheckedList[index] = !_isCheckedList[index];

                                print('클릭' + _isCheckedList[index].toString());

                                _isAllChecked =
                                    _isCheckedList.every((element) => element);
                              });
                            },
                          ),
                        ),
                  ),
                ],
              ),
            ),


            SizedBox(height:20.h),
            // 다음 버튼
            Center(
                child: Container(
                  width: 320.w,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: _isAllChecked ? () {
                      print('약관동의 완료');

                      // 약관동의 완료 데이터 처리


                    } : null,
                    child: AutoSizeText(
                      '완료',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF666666),
                          fontSize: 18.spMin,
                          fontFamily: "Pretendard"
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((
                          states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Color(0xFFD4D4D8);
                        }
                        return Color(0xFF5EF3D5);
                      },
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}