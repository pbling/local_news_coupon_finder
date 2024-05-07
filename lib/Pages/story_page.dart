import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Pages/story_detail_page.dart';

import '../Datas/models.dart';
import '../Datas/story_service_.dart';

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _storyPageStatus();
}

class _storyPageStatus extends State<StoryPage> {

  late Future<void> _refreshFuture;
  bool init = false;
  List<Story> storyList = [];

  @override
  void initState() {
    if (!init) {
      _refreshFuture = _onRefresh();
      init = true;
    }
    super.initState();
  }

  Future<void> _onRefresh() async {
    _getStoryList();
    setState(() {});
  }


  Future<void> _getStoryList() async {
    storyList.clear();
    storyList.addAll(await StoryNewService().getCurrentStoryList());
    setState(() {});
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


  double getHeight() {
    double h = 0.0;
    h = (storyList.length ~/ 2 + 1) * 220.0;
    return h;
  }

  @override
  Widget _buildStoryPageWidget() {

    double viewHeight = getHeight();

    return Container(
      child : Column(
        children: [
          Container(
            width: 360.w,
            height: 110.h,
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top:25.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140.w,
                  height: 80.h,
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap on the first story
                      print('click youtube');
                      // Navigate to the corresponding URL
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: min(50.w, 50.h),
                            height: min(50.w, 50.h),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/icon/youtube.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          // Label text
                          Text(
                            'Youtube',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: min(12.sp, 12.h),
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                // 두 번째 아이템
                Container(
                  width: 140.w,
                  height: 80.h,
                  child: GestureDetector(
                    onTap: () {
                      // Handle tap on the first story
                      print('click blog');
                      // Navigate to the corresponding URL
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: min(50.w, 50.h),
                            height: min(50.w, 50.h),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/icon/blog.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          // Label text
                          Text(
                            'Blog',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: min(12.sp, 12.h),
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        storyList.isEmpty?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height : 180.h),
            Image.asset(
              'assets/images/icon/noresult.png', // 이미지 경로
              width: 80.w,
              height: 80.h,
              color: Colors.grey,// 이미지 색상 변경 (예시)
            ),
            SizedBox(height: 10.h),
            Text(
              '빠르게 추가하겠습니다.',
              style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: min(14.h, 14.sp),
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ) :
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(30.0),
            itemCount: storyList.length,
            itemBuilder: (context, index) {
              return storyItem(storyList[index]);
              },
          ),
        ),
        ],
      ),
    );
  }

  Widget storyItem(Story story) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        // 클릭 시 StoryDetailPage로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StoryDetailPage(selectedStory: story)),
        );
      },
      child: Container(
        width: 200.w, // 적절한 크기 지정
        height: 250.h,
        margin: EdgeInsets.all(20), // 각 항목의 마진
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // 테두리 곡선
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // 그림자 색상 및 투명도
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 3), // 그림자 위치 조정
            ),
          ],
          image: DecorationImage(
            image: NetworkImage("https://res.heraldm.com/content/image/2023/02/24/20230224000260_0.jpg"), // 이미지 URL
            fit: BoxFit.cover, // 이미지 채우기 방식
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 60,
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5), // 텍스트 배경색 투명도
                  borderRadius: BorderRadius.circular(4), // 텍스트 배경 곡선
                ),
                child: Text(
                  "조조칼국수",
                  style: TextStyle(
                    fontSize: min(14.sp, 14.h),
                    color: Colors.white, // 텍스트 색상
                    fontWeight: FontWeight.w800,
                    fontFamily: "Pretendard",
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5), // 텍스트 배경색 투명도
                  borderRadius: BorderRadius.circular(4), // 텍스트 배경 곡선
                ),
                child: Text(
                  //"${story.title} - ${story.storeName}",
                  "30년 전통을 이어온 비결",
                  style: TextStyle(
                    fontSize: min(20.sp, 20.h),
                    color: Colors.white, // 텍스트 색상
                    fontWeight: FontWeight.w800,
                    fontFamily: "Pretendard",
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
