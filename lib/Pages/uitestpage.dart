import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Pages/story_detail_page.dart';

import '../Datas/models.dart';
import '../Datas/story_service_.dart';

class uitestpage extends StatefulWidget {
  @override
  State<uitestpage> createState() => _uitestpageStatus();
}

class _uitestpageStatus extends State<uitestpage> {

  late Future<void> _refreshFuture;
  bool init = false;

  @override
  void initState() {
    if (!init) {
      _refreshFuture = _onRefresh();
      init = true;
    }
    callnexttime();
    super.initState();
  }

  void callnexttime(){
    print('init 상태가 true입니다.');
  }

  Future<void> _onRefresh() async {
    print('init 상태가 false 입니다.');
    setState(() {});
  }


  @override
  void didUpdateWidget(uitestpage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget이 업데이트될 때 호출되는 함수 호출
    callupdatetime();
  }

  void callupdatetime() {
    print('Widget이 업데이트되었습니다.');
    print(14.sp.toString() +' '+ 14.h.toString() +' '+ 14.w.toString());
    checkUserInfo();
  }

  void checkUserInfo(){
    print('사용자 최근 주소정보 데이터가 업데이트 되었습니다.');
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
          return _buildStoryPageWidget();
        }
      },
    );
  }

  @override
  Widget _buildStoryPageWidget() {


    return Container(
        child : Column(
          children: [
            Container(
             width: 100.w,
             height: 100.h,
             color: Colors.yellow,
             child: Center(
               child: Text(
                 '테스트합니다.',
                 style: TextStyle(
                   fontSize: min(14.h, 14.sp),
                 ),
               ),
             ),
           ),

            Container(
                height : 20.h,
                color : Colors.blue
            ),

            Container(
              width: 100.sw,
              height: 100.sh,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  '이건 sw, sh를 적용',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),


            Container(
                height : 20.sh,
                color : Colors.blue
            ),





          ],
        )
    );
  }
}
