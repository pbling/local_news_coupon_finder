import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Contents/store_list_view.dart';
import '../Datas/models.dart';
import '../Datas/store_service_.dart';


class KeywordSearchPage extends StatefulWidget {
  @override
  _KeywordSearchPageState createState() => _KeywordSearchPageState();
}

class _KeywordSearchPageState extends State<KeywordSearchPage> {
  late Future<void> _refreshFuture;
  bool init = false;
  bool beforeSearch = true;
  late List<Store> _searchResults = [];
  TextEditingController _searchKeywordController = TextEditingController();
  String _submittedKeyword = '';


  // 가짜 인기 검색어 목록 (테스트용)
  List<String> _popularKeywords = [
    "네일",
    "피부관리",
    "할인",
    "오픈",
    "이벤트",
    "기념품",
    "무료",
    "체험권",
    "카페",
    "메뉴",
  ];

  @override
  void initState() {
    if (!init) {
      init = true;
      beforeSearch = true;
    }
    super.initState();
  }

  Future<void> _onSearching(String keyword) async {
    List<Store> results = [];
    results = await StoreNewService().getKeywordSearchedStoreList(keyword);
    setState(() {
      _searchResults = results;
      beforeSearch = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          bottomOpacity: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: min(18.h, 18.sp),
            ),
            onPressed: () {
              Navigator.pop(context); // 이전 화면으로 돌아가기
            },
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 360.w,
                height: 59.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 60.w),


                    Container(
                      width: 280.w,
                      height: 50.h,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFF6F6F6), // 배경색 설정
                      ),
                      child: TextField(
                        controller: _searchKeywordController,
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: min(16.sp, 16.h),
                        ),
                        onChanged: (value) {
                          setState(() {
                            print(value);
                          });
                        },
                        onSubmitted: (value) {
                          setState(() {_submittedKeyword = value;});
                          _submittedKeyword.isNotEmpty ? _onSearching(_submittedKeyword) : '';
                        },
                        decoration: InputDecoration(
                          hintText: '검색어를 입력하세요.',
                          hintStyle: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: min(16.sp, 16.h),
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 1.h,
                color: Color(0xFFF5F5F5),
              ),
            ],
          ),
        ),
        body : Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icon/star.png',
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '인기 검색어',
                          style: TextStyle(
                            fontSize: min(14.h, 14.sp),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: _popularKeywords.map((keyword) {
                        return GestureDetector(
                          onTap: () {
                            _searchKeywordController.text = keyword;
                            _onSearching(keyword);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Color(0xFFD4D4D8), // 테두리 색상
                                width: 1, // 테두리 두께
                              ),
                            ),
                            child: Text(
                              keyword,
                              style: TextStyle(
                                fontSize: min(14.h, 14.sp),
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              _searchResults.isEmpty && !beforeSearch?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height : 220.h),
                  Image.asset(
                    'assets/images/icon/noresult.png', // 이미지 경로
                    width: 80.w,
                    height: 80.h,
                    color: Colors.grey,// 이미지 색상 변경 (예시)
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '빠르게 상점을 추가하겠습니다.',
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: min(14.h, 14.sp),
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ) :
              Expanded(
                  child: SingleChildScrollView(
                    child: StoreListView(storeList: _searchResults)
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
