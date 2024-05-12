import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Datas/coupon_service_.dart';
import 'package:local_news_coupon_finder/Datas/store_service_.dart';
import 'package:local_news_coupon_finder/Login/select_login_option.dart';
import 'package:local_news_coupon_finder/Login/update_password.dart';
import 'package:local_news_coupon_finder/Pages/pick_stores_page.dart';
import 'package:local_news_coupon_finder/Pages/saved_coupons_page.dart';

import '../Datas/models.dart';
import '../Datas/user_service.dart';


class MemberInfoModifyPage extends StatefulWidget {
  @override
  State<MemberInfoModifyPage> createState() => _MemberInfoModifyPageStatus();
}

class _MemberInfoModifyPageStatus extends State<MemberInfoModifyPage> {

  late Future<void> _refreshFuture;
  bool init = false;

  late bool _isLoginedUser;

  @override
  void initState() {
    if (!init) {
      _refreshFuture = _onRefresh();
      init = true;
    }
    super.initState();
  }


  Future<void> _onRefresh() async {
    _checkLoginStatus();

    setState(() {});
  }

  Future<void> _checkLoginStatus() async{
    bool checkResult;
    checkResult = true;

    setState(() {
      _isLoginedUser = checkResult;
    });
  }

  Future<void> _showWithdrawalDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.white,
          title: Text(
            '회원 탈퇴',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: min(14.h, 14.sp),
                fontFamily: "Pretendard"
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '회원 탈퇴를 하시겠습니까?\n탈퇴 후에는 정보 복구가 불가합니다.',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: min(14.h, 14.sp),
                      fontFamily: "Pretendard"
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                '확인',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: min(14.h, 14.sp),
                    fontFamily: "Pretendard"
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                print('회원탈퇴 처리');
                // 회원탈퇴 함수
              },
            ),
            TextButton(
              child: Text(
                '취소',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: min(14.h, 14.sp),
                    fontFamily: "Pretendard"
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 현재 로그인된 사용자 정보 가져오기

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
                width: 360.w,
                height: 50.h,
                child:  Stack(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 50.w),
                        Text(
                          '회원정보 변경',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16.0.sp,
                              fontFamily: "Pretendard"
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFF5F5F5), // 회색 줄의 높이
                height: 1, // 회색 줄의 색상
              ),
            ],
          ),
        ),
        body: _buildMemberInfoModifyPage(context),
      ),
    );
  }

  Widget _buildMemberInfoModifyPage(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 사용자 정보
          Padding (
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 22.h, bottom: 20.h),
            child: Container(
              width: 360.w,
              height: 123.h,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // 로그인 사진 정보
                  CircleAvatar(
                    radius: 35.w,
                    backgroundColor: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        print('프로필 사진 수정');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/icon/user.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  // 로그인 유저 정보
                  SizedBox(width: 20.w),
                  Container(
                    width: 140.w,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'UserID',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Pretendard",
                          ),
                          textAlign: TextAlign.left,
                        ),

                        SizedBox(height: 7.h),
                        Text(
                          '동네곳곳 주민입니다.',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Pretendard",
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 블랭크
          Container(
            width: 360.w,
            height: 27.h,
            color: Color(0xFFF5F5F5),
          ),

          // 메뉴 목록
          Padding (
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 27.h, bottom: 20.h),
            child: Container(
              width: 360.w,
              height: 250.h,
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('비밀번호 변경');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdatePassword(),
                        ),
                      );

                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(360.w,55.h),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor : Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.password_rounded,
                              color: Colors.black,
                              size : min(18.sp, 18.h),
                            ), // 아이콘

                            SizedBox(width: 10.w),
                            Container(
                              width: 140.w,
                              height: 20.h,
                              child: Text(
                                '비밀번호 변경',
                                style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize:  min(16.sp, 16.h),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right : 20.w,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size : min(20.sp, 20.h),
                          ),
                        ),
                      ],
                    )
                  ),

                  Divider(
                    color: Color(0xFFF5F5F5),
                    thickness: 1.0,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      print('회원탈퇴');
                      _showWithdrawalDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(360.w, 55.h),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor : Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                                Icons.account_circle_outlined,
                                color: Colors.black,
                                size : min(20.sp, 20.h),
                            ),

                            SizedBox(width: 10.w),
                            Container(
                              width: 140.w,
                              height: 20.h,
                              child: Text(
                                '회원 탈퇴',
                                style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: min(16.sp, 16.h),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right : 20.w,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size : min(20.sp, 20.h),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
