import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:local_news_coupon_finder/Pages/coupon_news_page.dart';
import 'package:local_news_coupon_finder/Pages/map_search_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Pages/my_page.dart';
import 'package:local_news_coupon_finder/Pages/story_page.dart';

import '../Contents/location_search_bar.dart';
import 'home_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MapSearchPage(),
    CouponNewsPage(),
    StoryPage(),
    MyPage(),
  ];

  List<AppBar> _appBars = [
    AppBar(
      bottomOpacity: 0.0,
      backgroundColor: Colors.white,
      toolbarHeight: 50.h,
      flexibleSpace: Align(
        alignment: Alignment.center,
        child: LocationSearchBar(),
      ),
    ),
    AppBar(
      bottomOpacity: 0.0,
      backgroundColor: Colors.white,
      toolbarHeight: 50.h,
      flexibleSpace: Align(
        alignment: Alignment.center,
        child: LocationSearchBar(),
      ),
    ),
    AppBar(
      bottomOpacity: 0.0,
      backgroundColor: Colors.white,
      toolbarHeight: 50.h,
      flexibleSpace: Align(
        alignment: Alignment.center,
        child: LocationSearchBar(),
      ),
    ),
    AppBar(
      bottomOpacity : 0.0,
      backgroundColor: Colors.white,
      toolbarHeight: 50.h,
      flexibleSpace : Container(
        alignment: Alignment.centerLeft,
        color: Colors.white,
        width: 360.w,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 21.w),
            Container(
              width: 16.w,
              height: 20.h,
              child: Image.asset(
                'assets/images/icon/place.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              '동네곳곳 이야기',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: min(16.h, 16.sp),
                fontFamily: "Pretendard",
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    ),
    AppBar(
      bottomOpacity : 0.0,
      backgroundColor: Colors.white,
      toolbarHeight: 50.h,
      flexibleSpace : Container(
        alignment: Alignment.centerLeft,
        color: Colors.white,
        width: 360.w,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 21.w),
            Container(
              width: 16.w,
              height: 20.h,
              child: Image.asset(
                'assets/images/icon/place.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              '마이 페이지',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: min(16.h, 16.sp),
                fontFamily: "Pretendard",
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    ),
  ];

  String _currentLocation = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleLocationChange(String newLocation) {
    setState(() {
      _currentLocation = newLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size(360.w, 50.h), child: _appBars[_selectedIndex]),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          width: 360.w,
          height: 72.h, // 원하는 높이로 조정
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on_rounded),
                label: '내주변',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded),
                label: '쿠폰소식',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.import_contacts_rounded),
                label: '이야기',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'MY',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            unselectedItemColor: Color(0xFF999999),
            selectedItemColor: Color(0xFF111111),
            selectedIconTheme: IconThemeData(
              size: min(20.h, 20.sp),
            ),
            unselectedIconTheme: IconThemeData(
              size: min(20.h, 20.sp),
            ),
            selectedLabelStyle: TextStyle(
              fontSize: min(12.h, 12.sp),
              fontWeight: FontWeight.w500,
              fontFamily: "Pretendard",
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: min(12.h, 12.sp),
              fontWeight: FontWeight.w500,
              fontFamily: "Pretendard",
            ),
          ),
        ),
      ),
    );
  }
}