import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  late List<Store> _searchResults = [];

  TextEditingController _searchKeywordController = TextEditingController();
  String _submittedKeyword = '';

  @override
  void initState() {
    if (!init) {
      init = true;
    }
    super.initState();
  }

  Future<void> _onSearching(String keyword) async {
    List<Store> results = [];
    results = await StoreNewService().getKeywordSearchedStoreList(keyword);
    _searchResults = results;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    print(_searchResults.length);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52.h,
        bottomOpacity : 0.0,
        backgroundColor: Colors.white,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 360.w,
              height: 50.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 60.w),
                  Container(
                    width: 280.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFF5F5F5), // 배경색 설정
                    ),
                    child: TextField(
                      controller: _searchKeywordController,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                      onSubmitted: (value){
                        setState(() {
                          _submittedKeyword = value;
                        });
                        print('submitword : ' + _submittedKeyword);
                        _submittedKeyword.isNotEmpty?_onSearching(_submittedKeyword): '';
                      },
                      decoration: InputDecoration(
                        hintText: '검색어를 입력해주세요.',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "Pretendard",
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
              height: 1, // 회색 줄의 높이
              color: Color(0xFFF5F5F5), // 회색 줄의 색상
            ),
          ],
        ),
      ),
      body : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _searchResults.isNotEmpty? StoreListView(storeList: _searchResults) : SizedBox(),
          ],
        ),
      ),
    );
  }
}