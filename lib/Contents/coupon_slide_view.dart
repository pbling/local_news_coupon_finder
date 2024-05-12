import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Login/select_login_option.dart';

import '../Datas/models.dart';
import '../Login/select_login_option_navi.dart';


class CouponSlideView extends StatefulWidget {

  final List<Coupon> couponList;
  CouponSlideView({Key?key, required this.couponList}) : super(key:key);

  @override
  _couponSlideViewState createState() => _couponSlideViewState();
}

class _couponSlideViewState extends State<CouponSlideView>  {

  late List<bool> isDownload;
  late bool _isLoginedUser;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    // 각 쿠폰에 대한 초기 클릭 상태 설정
    isDownload = List.generate(widget.couponList.length, (index) => false);
    for(var item in isDownload){
      item = false;
    }
  }

  // 로그인 여부 체크 ***
  Future<void> _checkLoginStatus() async{
    bool checkResult;
    checkResult = false;

    setState(() {
      _isLoginedUser = checkResult;
    });
  }

  // 로그인 다이얼로그
  Future<void> _showLoginDialog() async {
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
            '로그인이 필요합니다.',
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
                  '저장 기능 사용을 위해서는 \n로그인이 필요합니다.',
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
                '취소',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: min(14.h, 14.sp),
                    fontFamily: "Pretendard"
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                '로그인하러 가기',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: min(14.h, 14.sp),
                    fontFamily: "Pretendard"
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                // 위치정보 사용약관 페이지 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectLoginOptWithNavi(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    final itemCount = widget.couponList.length >= 5 ? 5 : widget.couponList.length;
    _checkLoginStatus();

    return Container(
      height: 150.h,
      child: SingleChildScrollView(
        physics: PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(itemCount, (index) {
            final coupon = widget.couponList[index];
            return Padding(
              padding: EdgeInsets.only(left: 20.w, right: 10.w, top : 20.h, bottom: 20.h),
              child: Container(
                width: 230.w,
                height: 110.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Color(0xFFD4D4D8),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child : Padding(
                        padding : EdgeInsets.only(left: 13.w, right: 13.w, top: 18.h, bottom: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              coupon.couponDetail,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: min(14.h, 14.sp),
                                fontFamily: "Pretendard",
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '${DateFormat('yyyy.MM.dd').format(coupon.startDate)}~${DateFormat('MM.dd').format(coupon.endDate)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: min(12.h, 12.sp),
                                fontFamily: "Pretendard",
                                color: Color(0xFF999999),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.storefront,
                                  size: min(14.sp, 14.h),
                                  color: Color(0xFF5EF3D5),
                                ),
                                SizedBox(width: 4.03.w),
                                Text(
                                  coupon.storeId,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: min(14.h, 14.sp),
                                    fontFamily: "Pretendard",
                                    color: Color(0xFF5EF3D5),
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: isDownload[index]? null : (){
                          // 터치 이벤트 처리
                          setState(() {
                            // 아이콘 클릭 상태 토글
                            _isLoginedUser? isDownload[index] = !isDownload[index] : _showLoginDialog();

                          });
                          print('다운로드 아이콘 클릭');
                        } ,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isDownload[index]? Color(0xFFD4D4D8) : Color(0xFF5EF3D5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            border: Border.all(
                              color: isDownload[index]? Color(0xFFD4D4D8) : Color(0xFF5EF3D5),
                              width: 1.0,
                            ),
                          ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_download,
                                  color: Colors.white,
                                  size: min(30.h, 30.sp),
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  '000개\n남음',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: min(10.h, 10.sp),
                                    fontFamily: "Pretendard",
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}