import 'package:flutter/material.dart';
import 'package:local_news_coupon_finder/Navigation/tab_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'navi_bar_items.dart';

class BottomNavigation extends StatelessWidget {

  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 360.w,
      height: 72.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(0, 2), // 그림자의 위치 조정
          ),
        ],
      ),
      child: Expanded(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            _buildItem(TabItem.home),
            _buildItem(TabItem.search),
            _buildItem(TabItem.couponNews),
            _buildItem(TabItem.story),
            _buildItem(TabItem.my),
          ],
          onTap: (index) => {
            onSelectTab(
                TabItem.values[index]
            ),
          },
          currentIndex: currentTab.index,
          unselectedItemColor: Color(0xFF999999),
          selectedItemColor: Color(0xFF111111),
          selectedIconTheme: IconThemeData(
            size: 24.spMin,
          ),
          unselectedIconTheme: IconThemeData(
            size: 24.spMin,
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 14.spMin,
            fontWeight: FontWeight.w500,
            fontFamily: "Pretendard",
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14.spMin,
            fontWeight: FontWeight.w500,
            fontFamily: "Pretendard",
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return naviBarItems[tabIdx[tabItem]!];
  }
}