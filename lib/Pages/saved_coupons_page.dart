import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Contents/coupon_list_view.dart';

import '../Contents/store_list_view.dart';
import '../Datas/models.dart';

class SavedCouponsPage extends StatefulWidget {

  final List<Coupon> savedCouponList;
  SavedCouponsPage({required this.savedCouponList});

  @override
  _savedCouponsPageState createState() => _savedCouponsPageState();
}

class _savedCouponsPageState extends State<SavedCouponsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print(widget.savedCouponList);

    return SafeArea(
      child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(360.w, 50.h),
        child: AppBar(
          toolbarHeight: 50.h,
          backgroundColor: Colors.red,
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
                      "저장한 동네 쿠폰",
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
      body : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.savedCouponList.isEmpty?
            Center(
                child: Text('저장한 상점이 없습니다.')
            ) :
            CouponListView(couponList: widget.savedCouponList),
          ],
        ),
      ),
    ),);
  }
}