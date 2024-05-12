import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Contents/category_view.dart';
import 'package:local_news_coupon_finder/Contents/location_search_bar.dart';

import '../Contents/coupon_slide_view.dart';
import '../Contents/event_banner.dart';
import '../Contents/simple_news_list_view.dart';
import '../Contents/store_list_view.dart';
import '../Datas/category_service_.dart';
import '../Datas/coupon_service_.dart';
import '../Datas/event_service_.dart';
import '../Datas/models.dart';
import '../Datas/news_service_.dart';
import '../Datas/store_service_.dart';

// Init 시점
// 로그인 여부 확인
// 로그인 true - 쿠폰 다운로드, 상점 Pick 허용
// 로그인 false - 쿠폰 다운로드, 상점 Pick 클릭 시점에 팝업 발생 - 로그인하러 가기, 취소
// 위치정보 여부 확인
// 위치 true - 거리가 가까운 순으로 최신 상점, 소식, 쿠폰 획득 (max 5)
// 위치 false - 최신 상점, 소식, 쿠폰 획득 (max 5)
// 데이터 획득
// 위치정보가 바뀌면 위치 true - 데이터 획득


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageStatus();
}

class _HomePageStatus extends State<HomePage> {

  late Future<void> _refreshFuture;
  bool init = false;
  late bool _isLoginedUser;
  bool _isLocationInfo = false;
  String _locationInfo = '';

  List<Event> _events = [];
  List<Category> _categories = [];
  List<News> _latestNewses = [];
  List<Coupon> _latestCoupons = [];
  List<Store> _latestStores = [];

  @override
  void initState() {
    if (!init) {
      _refreshFuture = _onRefresh();
      init = true;
    }
    super.initState();
  }

  Future<void> _onRefresh() async {
    _events.clear();
    _categories.clear();
    _latestNewses.clear();
    _latestCoupons.clear();
    _latestStores.clear();

    // 위치정보 여부 체크 ***
    await _checkIsLocationInfo();
    await _checkLoginStatus();

    _events.addAll(await EventNewService().getCurrentEventList());
    _categories.addAll(await CategoryNewService().getAllCategortList());

    if(_isLocationInfo){
      // 거리순 + 최신순 정보 획득 (max 5) ***
      await _getNearCurrentData();
    } else {
      // 최신순 정보 획득 (max 5) ***
      await _getCurrentData();
    }
    setState(() {});
  }

  // 로그인 여부 체크 ***
  Future<void> _checkLoginStatus() async{
    bool checkResult;
    checkResult = false;

    setState(() {
      _isLoginedUser = checkResult;
    });
  }

  // 위치정보 여부 체크 ***
  Future<void> _checkIsLocationInfo() async{
    String locationInfo;
    locationInfo = '손곡로 67';

    setState(() {
      _isLocationInfo = true;
      _locationInfo = locationInfo;
    });
  }

  // 거리순 + 최신순 정보 획득 (max 5) ***
  Future<void> _getNearCurrentData() async{
    print(_locationInfo);

    List<News> newses = [];
    List<Coupon> coupons = [];
    List<Store> stores  = [];
    newses.addAll(await NewsNewService().getCurrentNewsList());
    coupons.addAll(await CouponNewService().getCurrentCouponList());
    stores.addAll(await StoreNewService().getCurrentStoreList());

    setState(() {
      _latestNewses = newses.take(5).toList();
      _latestStores = stores.take(5).toList();
      _latestCoupons = coupons.take(5).toList();
    });
  }

  // 최신순 정보 획득 (max 5) ***
  Future<void> _getCurrentData() async{
    print(_locationInfo);

    List<News> newses = [];
    List<Coupon> coupons = [];
    List<Store> stores  = [];
    newses.addAll(await NewsNewService().getCurrentNewsList());
    coupons.addAll(await CouponNewService().getCurrentCouponList());
    stores.addAll(await StoreNewService().getCurrentStoreList());

    setState(() {
      _latestNewses = newses.take(5).toList();
      _latestStores = stores.take(5).toList();
      _latestCoupons = coupons.take(5).toList();
    });
  }


  void _handleLocationChange(String newLocation) {
    // 거리순 + 최신순 정보 획득
    print('위치정보 변경');
    _getNearCurrentData();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _refreshFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Loading'),
                    SizedBox(height: 5.h),
                    CircularProgressIndicator(
                      color: Color(0xFF00D8BB),
                    ),
                ]
              ),
            ),
          );
        } else {
          return _buildHomeWidget();
        }
      },
    );
  }


  Widget _buildHomeWidget() {
    return SingleChildScrollView(
        reverse: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            EventBanner(eventList: _events),

            // 간단 카테고리 검색 위젯
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h, bottom: 42.h),
              child: CategoryView(categoryList: _categories),
            ),

            _latestNewses.isNotEmpty? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 최근 등록된 동네소식
                Container(
                  width: 360.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 21.w),
                      Text(
                        '최근 등록된 동네소식',
                        style: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: min(20.h, 20.sp),
                            fontWeight: FontWeight.w800,
                            color: Colors.black
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15.h),

                SimpleNewsListView(newsList: _latestNewses),
              ],
            ) : SizedBox(height:0),


            _latestCoupons.isNotEmpty?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10.h,
                  color: Color(0xffededed),
                ),

                SizedBox(height: 29.h),

                // 최근 등록된 쿠폰
                Container(
                  width: 360.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 21.w),
                      Text(
                        '새로 등록된 쿠폰',
                        style: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: min(20.h, 20.sp),
                            fontWeight: FontWeight.w800,
                            color: Colors.black
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),

                // 동네쿠폰 리스트 (~5)
                CouponSlideView(couponList: _latestCoupons),
              ],
            ) : SizedBox(height:0),



            _latestStores.isNotEmpty?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10.h,
                  color: Color(0xffededed),
                ),

                SizedBox(height: 28.h),

                // 최근 등록된 상점
                Container(
                  width: 360.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 21.w),
                      Text(
                        '최근 등록된 상점',
                        style: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: min(20.h, 20.sp),
                            fontWeight: FontWeight.w800,
                            color: Colors.black
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),

                // 동네상점 리스트 (~5)
                StoreListView(storeList: _latestStores),
              ],
            ) : SizedBox(height:0),


            GestureDetector(
              onTap: (){
                print('동네곳곳 클릭');
              },
              child: Container(
                width: 360.w,
                height: 70.h,
                child: Image.asset(
                  'assets/images/event/contact.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      );
  }
}
