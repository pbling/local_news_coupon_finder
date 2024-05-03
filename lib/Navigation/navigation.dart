import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_news_coupon_finder/Navigation/tab_item.dart';
import 'package:local_news_coupon_finder/Navigation/tab_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var _currentTab = TabItem.home;
  bool _isLogined = false;

  @override
  void initState(){
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //_isLogined = prefs.getBool('isLoggedIn')??false;
      _isLogined = true;
    });
    if(_isLogined)
    {
      _checkIsNewCouponNews();
    }
  }


  Future<bool> _checkIsNewCouponNews() async{
    DateTime? lastLogin = await getLastLoginDate();
    bool isNewCouponNews;
    //userId와 lastLogin 정보를 넘기고 db에 userId가 저장한 favorite 상점여부 체크
    //있다면, 그 상점의 소식, 쿠폰 리스트에서 lastLogin 이후 등록된 정보가 있는지 체크
    //있으면 true, 없으면 false 반환
    //CheckNewData(userId, lastLogin)

    isNewCouponNews = true;
    return isNewCouponNews;
  }


  Future<DateTime> getLastLoginDate() async{
    DateTime lastLoginDate;
    lastLoginDate = DateTime(2024, 3, 11);
    return lastLoginDate;
  }


  final _navigatorKeys ={
    TabItem.home : GlobalKey<NavigatorState>(),
    TabItem.search : GlobalKey<NavigatorState>(),
    TabItem.couponNews : GlobalKey<NavigatorState>(),
    TabItem.story : GlobalKey<NavigatorState>(),
    TabItem.my : GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem){
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    }
    else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab]!.currentState!.maybePop();

        if (isFirstRouteInCurrentTab) {
          // 메인 화면이 아닌 경우
          if (_currentTab != TabItem.home) {
            // 메인 화면으로 이동
            _selectTab(TabItem.home);
            // 앱 종료 방지
            return false;
          }
        }

        /// 네비게이션 바의 첫번째 스크린인 경우, 앱 종료
        return isFirstRouteInCurrentTab;
      },
      child : SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              _buildOffstageNavigator(TabItem.home),
              _buildOffstageNavigator(TabItem.search),
              _buildOffstageNavigator(TabItem.couponNews),
              _buildOffstageNavigator(TabItem.story),
              _buildOffstageNavigator(TabItem.my),
            ],
          ),
          bottomNavigationBar: BottomNavigation(
            currentTab: _currentTab,
            onSelectTab: _selectTab,
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    /// (offstage == false) -> 트리에서 완전히 제거된다.
    return Offstage(
        offstage: _currentTab != tabItem,
        child: TabNavigator(
          navigatorKey: _navigatorKeys[tabItem],
          tabItem: tabItem,
        ));
  }
}