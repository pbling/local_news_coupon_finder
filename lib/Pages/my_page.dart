import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Datas/coupon_service_.dart';
import 'package:local_news_coupon_finder/Datas/store_service_.dart';
import 'package:local_news_coupon_finder/Login/select_login_option.dart';
import 'package:local_news_coupon_finder/Pages/pick_stores_page.dart';
import 'package:local_news_coupon_finder/Pages/saved_coupons_page.dart';

import '../Datas/models.dart';
import '../Datas/user_service.dart';


class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _myPageStatus();
}

class _myPageStatus extends State<MyPage> {

  late Future<void> _refreshFuture;
  bool init = false;

  late bool _isLoginedUser;
  List<Coupon> _savedCouponList = [];
  List<Store> _pickedStoreList = [];

  @override
  void initState() {
    if (!init) {
      _refreshFuture = _onRefresh();
      init = true;
    }
    super.initState();
  }


  Future<void> _onRefresh() async {
    _savedCouponList.clear();
    _pickedStoreList.clear();

    _checkLoginStatus();

    _savedCouponList.addAll(await CouponNewService().getCurrentCouponList());
    _pickedStoreList.addAll(await StoreNewService().getCurrentStoreList());

    setState(() {});
  }

  Future<void> _checkLoginStatus() async{
    bool checkResult;
    checkResult = true;

    setState(() {
      _isLoginedUser = checkResult;
    });
  }


  @override
  Widget build(BuildContext context) {
    // 현재 로그인된 사용자 정보 가져오기

    return Scaffold(
      body: _isLoginedUser? _buildLoggedInUserPage(context) : _buildLoginPage(context)
    );

  }

  Widget _buildLoginPage(BuildContext context) {
    return Container(
      child: SelectLoginOption(),
    );
  }

  Widget _buildLoggedInUserPage(BuildContext context) {
    return Column(
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
                Text(
                  '나의활동',
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.left,
                ),

                SizedBox(height: 20.h),

                ElevatedButton(
                  onPressed: () {
                    print('저장한 동네 쿠폰');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SavedCouponsPage(savedCouponList: _savedCouponList),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.discount_outlined,
                        color: Colors.black,
                        size : 20.sp,
                      ), // 아이콘

                      SizedBox(width: 10.w),
                      Container(
                        width: 140.w,
                        height: 20.h,
                        child: Text(
                          '저장한 동네 쿠폰',
                          style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      SizedBox(width: 80.w),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size : 20.sp,
                      ),
                    ],
                  ),
                ),

                Divider(
                  color: Color(0xFFF5F5F5),
                  thickness: 1.0,
                ),

                ElevatedButton(
                  onPressed: () {
                    print('나의 Pick 동네 상점 ');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PickStoresPage(pickStoreList: _pickedStoreList),
                      ),
                    );

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                          size : 20.sp
                      ),

                      SizedBox(width: 10.w),
                      Container(
                        width: 140.w,
                        height: 20.h,
                        child: Text(
                          '나의 Pick 상점',
                          style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      SizedBox(width: 80.w),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size : 20.sp,
                      ),// 텍스트
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
