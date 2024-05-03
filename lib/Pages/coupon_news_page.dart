import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Contents/location_search_bar.dart';
import 'package:local_news_coupon_finder/Contents/tab_image_list_view.dart';

import '../Contents/coupon_news_list_view.dart';
import '../Datas/category_service_.dart';
import '../Datas/coupon_news_service_.dart';
import '../Datas/models.dart';


// Init 시점
// 대분류 카테고리 데이터 획득 - 카테고리 이름 목록, 카테고리 icon url 목록
// 로그인 여부 확인
// 로그인 true - 쿠폰 다운로드, 상점 Pick 허용 + 탭 카테고리 나의 Pick 추가
// 로그인 false - 쿠폰 다운로드, 상점 Pick 클릭 시점에 팝업 발생 - 로그인하러 가기, 취소
// 위치정보 여부 확인
// 위치 true - 거리가 가까운 상점의 소식, 쿠폰 획득
// 위치 false - 최신 소식, 쿠폰 획득
// 데이터 획득
// 위치정보가 바뀌면 위치 true - 데이터 획득

class CouponNewsPage extends StatefulWidget {
  @override
  _CouponNewsPageState createState() => _CouponNewsPageState();
}

class _CouponNewsPageState extends State<CouponNewsPage> {

  late Future<void> _refreshFuture;
  bool init = false;
  bool _isLogined = false;
  bool _isLocationInfo = false;
  String _locationInfo = '';

  late int _selectedButton = 0;
  late String _selectedCategory = '전체';

  List<CouponNews> _latestCouponNewsList = [];
  List<CouponNews> _searchedCouponNewsList = [];
  List<CouponNews> _allResults = [];

  List<String> _categoryNameList = [];
  List<String> _categoryIconList = [];

  @override
  void initState() {
    if (!init) {
      _refreshFuture = _onRefresh();
      init = true;
    }
    super.initState();
  }

  Future<void> _onRefresh() async {
    _allResults.clear();
    _searchedCouponNewsList.clear();
    _latestCouponNewsList.clear();

    getCategoryList();

    // 위치정보 여부 체크 ***
    await _checkIsLocationInfo();
    _checkLoginStatus();

    if(_isLocationInfo){
      // 거리가 가까운 상점의 소식, 쿠폰 획득 ***
      await _getNearCurrentData();
    } else {
      // 최신 소식, 쿠폰 획득 ***
      await _getCurrentData();
    }

    _selectedButton = 0;
    _selectedCategory = '전체';
    filterTabButton(_selectedCategory, _selectedButton);

    setState(() {});
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
    String locationInfo;
    locationInfo = '손곡로 67';

    setState(() {
      _isLocationInfo = true;
      _locationInfo = locationInfo;
    });
  }

  // 거리가 가까운 상점의 소식, 쿠폰 획득 ***
  Future<void> _getNearCurrentData() async{
    _latestCouponNewsList.addAll(await CouponNewsNewService().allCouponNewsItems());
    setState(() {
    });
  }

  // 최신 소식, 쿠폰 획득 ***
  Future<void> _getCurrentData() async{
    _latestCouponNewsList.addAll(await CouponNewsNewService().allCouponNewsItems());
    setState(() {
    });
  }


  void _handleLocationChange(String newLocation) {
    // 거리순 + 최신순 정보 획득
    print('위치정보 변경');
    _getNearCurrentData();
    _onRefresh();
  }

  void _handleTabIndexChanged(int index) async {
    String categoryName = '';
    categoryName = _categoryNameList[index];

    setState(() {
      _selectedCategory = categoryName;
    });

    filterTabButton(_selectedCategory, _selectedButton);
  }

  void filterTabButton(String cateName, int btIndex) {

    List<CouponNews> categoryFilteredList = [];
    List<CouponNews> buttonFilteredList = [];

    if (cateName == '전체' || cateName == '나의 Pick') {
      print('전체 탭 or Pick 클릭');
      categoryFilteredList.addAll(_latestCouponNewsList);
    }
    else {
      for (var i = 0; i < _latestCouponNewsList.length; i++) {
        if (_latestCouponNewsList[i].category == cateName) {
          categoryFilteredList.add(_latestCouponNewsList[i]);
        }
      }
    }

    if (categoryFilteredList.isNotEmpty) {
      if (btIndex == 0) {
        print('전체 버튼 클릭');
        buttonFilteredList = categoryFilteredList;
      }
      else if (btIndex == 1) {
        print('쿠폰 버튼 클릭');
        for (var i = 0; i < categoryFilteredList.length; i++) {
          if (categoryFilteredList[i].couponId != '') {
            print(categoryFilteredList[i].couponId);
            buttonFilteredList.add(categoryFilteredList[i]);
          }
        }
      }
      else if (btIndex == 2) {
        print('소식 버튼 클릭');
        for (var i = 0; i < categoryFilteredList.length; i++) {
          if (categoryFilteredList[i].newsId != '') {
            buttonFilteredList.add(categoryFilteredList[i]);
          }
        }
      }
    }
    else {
      print('카테고리 검색결과 없음');
    }

    setState(() {
      _searchedCouponNewsList = buttonFilteredList;
      print(_searchedCouponNewsList.length);
    });
  }

  void getCategoryList() async {

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
          return _buildCouponNewsPageWidget();
        }
      },
    );
  }

  @override
  Widget _buildCouponNewsPageWidget() {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 50.h,
        flexibleSpace: LocationSearchBar(onLocationChanged: _handleLocationChange),
      ),

      body: Column(
        children: [
          // 서브카테고리 메뉴
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, top: 15.h, bottom: 15.h),
                  child: TabWithImageListView(
                    tabItems: _categoryNameList,
                    tabImages: _categoryIconList,
                    onTabIndexChanged: _handleTabIndexChanged,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 50.h,
                  margin: EdgeInsets.only(right: 20.w, bottom: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildButton(0),
                      SizedBox(width: 8.w),
                      _buildButton(1),
                      SizedBox(width: 8.w),
                      _buildButton(2),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,
                  color : Color(0xFFF5F5F5),
                ),
              ],
            ),
          ),

          _searchedCouponNewsList.isEmpty?
          Column(
            children: [
              SizedBox(height: 200.h),
              Text(
                '검색 결과가 없습니다.',
                style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey
                ),
              ),
            ],
          ) :
          Flexible(child: SingleChildScrollView(
              child: CouponNewsListView(couponNewsList: _searchedCouponNewsList)
          ),),
        ],
      ),
    );
  }

  Widget _buildButton(int buttonIndex) {
    bool isSelected = buttonIndex == _selectedButton;
    String buttonName = '';
    Widget? image;

    switch (buttonIndex) {
      case 0:
        buttonName = '전체';
        break;
      case 1:
        buttonName = '쿠폰';
        image = Row(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  isSelected ? Colors.black : Colors.black12,
                  BlendMode.srcIn),
              child: Image.asset(
                  width: 18.8.w,
                  height: 12.5.h,
                  'assets/images/icon/coupon.png'
              ),
            ),
            SizedBox(width: 6.3.w),
          ],
        );
        break;
      default:
        buttonName = '소식';
        image = Row(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  isSelected ? Colors.black : Colors.black12,
                  BlendMode.srcIn),
              child: Image.asset(
                  width: 18.8.w,
                  height: 12.5.h,
                  'assets/images/icon/news.png'
              ),
            ),
            SizedBox(width: 6.3.w),
          ],
        );
        break;
    }

    return ElevatedButton(
        onPressed: () async {
          setState(() {
            _selectedButton = buttonIndex;
          });
          filterTabButton(_selectedCategory, _selectedButton);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.white : Colors.white,
          foregroundColor: isSelected ? Colors.black : Color(0xffededed),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Color(0xffededed)),
          ),
          elevation: isSelected ? 3 : 0,
          // 클릭된 버튼일 경우 그림자 효과
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
        ),
        child: Row(
          children: [
            if (image != null) image,
            Text(
              buttonName,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  fontFamily: "Pretendard"
              ),
            ),
          ],
        )
    );
  }

}
