import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Contents/location_search_bar.dart';
import 'package:local_news_coupon_finder/Contents/map_view.dart';
import 'package:local_news_coupon_finder/Contents/tab_image_list_view.dart';

import '../Datas/category_service_.dart';
import '../Datas/models.dart';
import '../Datas/store_service_.dart';


// Init 시점
// 로그인 여부 확인
// 로그인 true - 탭 카테고리 나의 Pick 추가
// 로그인 false
// 위치정보 여부 확인
// 위치 true - 카메라 Position 위치정보로 변경
// 위치 false - 카메라 Position Default 값 사용
// 데이터 획득
// 위치정보가 바뀌면 카메라 Position 변경

class MapSearchPage extends StatefulWidget {
  @override
  _mapSearchPageState createState() => _mapSearchPageState();
}

enum SortOption { distance, latest }


class _mapSearchPageState extends State<MapSearchPage> {

  late Future<void> _refreshFuture;
  bool init = false;
  bool _isLogined = false;
  late LocationPos _locationPos;

  List<Store> _favoriteStoreList = [];
  List<Store> _searchedStoreList = [];
  List<Store> _allStoreList = [];

  List<String> _categoryNameList = [];
  List<String> _categoryIconList = [];

  late int _selectedTab;

  @override
  void initState() {
    if (!init) {
      _refreshFuture = _onRefresh();
      init = true;
    }
    super.initState();
  }

  Future<void> _onRefresh() async {
    List<Future<void>> futures = [];

    futures.add(getStoreList());
    futures.add(getCategoryList());
    futures.add(_checkLoginStatus());
    futures.add(_checkIsLocationInfo());

    await Future.wait(futures);

    setState(() {
      _selectedTab = 0;
      getFilteredStoreList(_selectedTab);
    });
  }

  Future<void> getStoreList() async {
    _favoriteStoreList.clear();
    _searchedStoreList.clear();
    _allStoreList.clear();

    if(_isLogined){
      _favoriteStoreList.addAll(await StoreNewService().getCurrentStoreList());
    }
    _allStoreList.addAll(await StoreNewService().getCurrentStoreList());
  }

  void getFilteredStoreList(int index){
    List<Store> filterResults = [];
    String categoryName = '';
    categoryName = _categoryNameList[index];

    if(categoryName == "전체"){
      filterResults.addAll(_allStoreList);
    }
    else if(categoryName == "나의 Pick"){
      filterResults.addAll(_favoriteStoreList);
    }
    else{
      for(var i = 0; i < _allStoreList.length ; i++){
        if(_allStoreList[i].category == categoryName){
          filterResults.add(_allStoreList[i]);
        }
      }
    }
    setState(() {
      _searchedStoreList = filterResults;
    });
  }

  // 로그인 여부 체크 ***
  Future<void> _checkLoginStatus() async{
    bool logined;
    logined = false;
    setState(() {
      _isLogined = logined;
    });
  }

  // 위치정보 여부 체크 ***
  Future<void> _checkIsLocationInfo() async{
    LocationPos locationInfo = LocationPos(37.506932467450326, 127.05578661133796);
    setState(() {
      _locationPos = locationInfo;
    });
  }

  Future<void> getCategoryList() async {

    print('getCategoryList');

    List<String> categoryNames = [];
    List<String> categoryIcons = [];
    List<Category> categories = [];

    categories.addAll(await CategoryNewService().getAllCategories());

    for (Category category in categories) {
      categoryNames.add(category.categoryName);
      categoryIcons.add(category.iconUrl);
    }

    if(_isLogined){
      categoryNames.insert(0, "나의 Pick");
      categoryIcons.insert(0, '');

      categoryNames.insert(0, "전체");
      categoryIcons.insert(0, '');

    } else {
      categoryNames.insert(0, "전체");
      categoryIcons.insert(0, '');
    }

    setState(() {
      _categoryNameList = categoryNames;
      _categoryIconList = categoryIcons;
    });


    print(_categoryNameList);
  }


  void _handleTabIndexChanged(int index) {
    setState(() {
      _selectedTab = index;
      print('변경됨' + index.toString());
    });
    getFilteredStoreList(index);
  }

  void _handleLocationChange(String newLocation) {
    // 거리순 + 최신순 정보 획득
    print('위치정보 변경');
    _checkIsLocationInfo();
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
          return _buildMapSearchPageWidget();
        }
      },
    );
  }

  @override
  Widget _buildMapSearchPageWidget() {
    return Container(
        child : Column(
        children: [
          // 서브카테고리 메뉴
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
              child: TabWithImageListView(
                tabItems: _categoryNameList,
                tabImages: _categoryIconList,
                onTabIndexChanged: _handleTabIndexChanged,
              ),
            ),
          ),
          Expanded(
              child: Container(
                width: 360.w,
                child: MapView(storeList: _searchedStoreList, cameraPosInfo: _locationPos),
              )
          )
        ],
      )
    );
  }
}