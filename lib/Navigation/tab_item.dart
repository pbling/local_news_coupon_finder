import 'package:flutter/material.dart';
import 'package:local_news_coupon_finder/Pages/coupon_news_page.dart';
import 'package:local_news_coupon_finder/Pages/home_page.dart';
import 'package:local_news_coupon_finder/Pages/map_search_page.dart';
import 'package:local_news_coupon_finder/Pages/my_page.dart';
import 'package:local_news_coupon_finder/Pages/story_page.dart';

enum TabItem { home, search, couponNews, story, my}

const Map<TabItem, String> tabName = {
  TabItem.home: 'HomePage',
  TabItem.search: 'SearchPage',
  TabItem.couponNews: 'CouponNewsPage',
  TabItem.story : 'StoryPage',
  TabItem.my : 'MyPage',
};

const Map<TabItem, Color> activeTabColor = {
  TabItem.home: Color(0xFF5EF3D5),
  TabItem.search: Color(0xFF5EF3D5),
  TabItem.couponNews: Color(0xFF5EF3D5),
  TabItem.story : Color(0xFF5EF3D5),
  TabItem.my : Color(0xFF5EF3D5),
};

const Map<TabItem, int> tabIdx = {
  TabItem.home: 0,
  TabItem.search: 1,
  TabItem.couponNews: 2,
  TabItem.story : 3,
  TabItem.my : 4,
};

Map<TabItem, Widget> tabScreen = {
  TabItem.home: HomePage(),
  TabItem.search: MapSearchPage(),
  TabItem.couponNews: CouponNewsPage(),
  TabItem.story : StoryPage(),
  TabItem.my : MyPage(),
};