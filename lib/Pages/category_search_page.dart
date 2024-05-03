import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Contents/tab_button_list_view.dart';

import '../Contents/store_list_view.dart';
import '../Datas/models.dart';
import '../Datas/store_service_.dart';


class CategorySearchPage extends StatefulWidget {
  final String mainMenu;
  final List<String> subMenuList;
  CategorySearchPage({required this.mainMenu, required this.subMenuList});

  @override
  _categorySearchPageState createState() => _categorySearchPageState();
}

class _categorySearchPageState extends State<CategorySearchPage> {

  late Future<void> _refreshFuture;
  bool init = false;

  late List<String> _currentSubMenuList;
  List<Store> _currentStoreList = [];
  List<Store> _searchResults = [];

  late int _selectedTab;
  late String _selectedDropdown;

  @override
  void initState() {
    if (!init) {
      _refreshFuture = _onRefresh();
      init = true;
    }
    super.initState();
  }

  Future<void> _onRefresh() async {
    await getCurrentStores();
    getCurrentSubcategory();

    _selectedTab = 0;
    _selectedDropdown = '최신순';
    filterStoreList(_selectedTab);
  }

  Future<void> getCurrentStores() async {
    List<Store> stores = [];
    stores = await StoreNewService().getCategoryFilteredStores(widget.mainMenu);

    setState(() {
      _currentStoreList = stores;
    });
  }

  void getCurrentSubcategory(){
    List<String> subCategories = [];
    subCategories.addAll(widget.subMenuList);
    subCategories.insert(0, '전체');

    print(widget.subMenuList);
    print(subCategories);

    setState(() {
      _currentSubMenuList = subCategories;
    });

  }

  void _handleTabIndexChanged(int index) {
    // 클릭한 탭 인덱스를 받고 상태를 업데이트
    setState(() {
      _selectedTab = index;
      print('변경됨' + index.toString());
    });
    filterStoreList(index);
  }


  void filterStoreList(int index){
    List<Store> filterResults = [];
    String subCategory = _currentSubMenuList[index];

    if(index == 0)
    {
      print('전체 선택');
      filterResults = _currentStoreList;
    }
    else {
      for (var store in _currentStoreList) {
        if (store.subCategory == subCategory) {
          filterResults.add(store);
        }
      }
    }

    setState(() {
      _searchResults = filterResults;
      print(_searchResults.length);
    });
  }

  void updateStoreList(String dropdownVal){
    if(_searchResults.isNotEmpty){
      if(dropdownVal == '최신순')
      {
        print('최신순 정렬 셋팅');
        _searchResults.sort((a, b) => b.createdDate.compareTo(a.createdDate));
      }
      else
      {
        // 주소 정보여부 체크
        print('주소 정보 체크');

        _searchResults.sort((a, b) => b.storeId.compareTo(a.storeId));
      }
    }
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
          return _buildCategorySearchPageWidget();
        }
      },
    );
  }

  @override
  Widget _buildCategorySearchPageWidget() {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52.h,
        bottomOpacity : 0.0,
        backgroundColor: Colors.white,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              width: 300.w,
              height: 50.h,
              child: Row(
                children: [
                  SizedBox(width: 25.w),
                  Text(
                    '주변 동네상점 검색',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.0.sp,
                        fontFamily: "Pretendard"
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              height: 1, // 회색 줄의 높이
              color: Color(0xFFF5F5F5), // 회색 줄의 색상
            ),
          ],
        ),
      ),

      body : Column(
        children: [
          // 서브카테고리 메뉴
          Container(
            color: Colors.white,
            child: Padding(
              padding : EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
              child: TabButtonListView(
                tabItems: _currentSubMenuList,
                onTabIndexChanged: _handleTabIndexChanged,
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _searchResults.isEmpty?
                  SizedBox() : Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left : 17.w, top: 30.h, bottom: 13.h),
                    height: 80.h,
                    child : Container(
                      width: 109.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child : Container(
                        alignment: Alignment.center,
                        child : DropdownButton(
                          items: [
                            DropdownMenuItem(
                              value: '최신순',
                              child: Text('최신순　　'),
                            ),
                            DropdownMenuItem(
                              value: '거리순',
                              child: Text('거리순　　'),
                            ),
                          ],
                          value: _selectedDropdown, // 현재 선택된 값
                          onChanged: (value) {
                            setState(() {
                              _selectedDropdown = value.toString();
                            });
                            // 여기에 선택된 값에 따라 필요한 동작을 추가
                            updateStoreList(_selectedDropdown);
                          },
                          underline: Container(),
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 14.sp,
                            fontFamily: "Pretendard",
                          ),
                          dropdownColor: Colors.white,
                        ),
                      ),
                    ),
                  ),


                  // 검색 결과
                  _searchResults.isEmpty?
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
                  ) : Container(
                      child: StoreListView(storeList: _searchResults)
                  ),
                ],
              ),
            ),
          ),
          ),
        ],
      ),
    );

  }
}