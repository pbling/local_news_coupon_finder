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

    return Scaffold(
      appBar: AppBar(
        bottomOpacity : 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 50.h,
        flexibleSpace : Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          width: 360.w,
          height: 50.h,
          child: Row(
            children: [
              SizedBox(width: 21.w),
              Container(
                width: 16.w,
                height: 20.h,
                child: Image.asset(
                  'assets/images/icon/place.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                  '동네곳곳 이야기',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16.0.sp,
                    fontFamily: "Pretendard",
                  ),
                  maxLines: 1,
              ),
            ],
          ),
        ),
      ),
      body : Column(
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
                            width: 80.w, // Adjust width as needed
                            height: 40.w, // Set height equal to width for circular shape
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/icon/youtube.png'),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          // Label text
                          Text(
                            'Youtube',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w), // 각 아이템 사이의 간격 조절
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
                            width: 80.w, // Adjust width as needed
                            height: 40.w,// Set height equal to width for circular shape
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/icon/blog.png'),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          // Label text
                          Text(
                            'Blog',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
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
        Center(
          child: Text(
              '검색 결과가 없습니다.',
              style: TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey
              ),
            ),
        ) :
        Flexible(
          child: SingleChildScrollView(
            reverse: false,
            child : storyList.isNotEmpty ?
            Container(
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
              width: 360.w,
              height: viewHeight.h, // Adjusted height calculation
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                ),
                itemCount: storyList.length, // Set itemCount
                itemBuilder: (context, index) {
                  if (index < storyList.length) {
                    Story story = storyList[index];

                    return GestureDetector(
                        onTap: () {
                          // Handle tap on the story
                          print('click story' + storyList[index].storyId);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StoryDetailPage(
                                      selectedStory: storyList[index]),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 15.h),
                          child: Container(
                            width: 140.w,
                            height: 210.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                // Display the image with curved corners
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                        bottomLeft: Radius.zero,
                                        bottomRight: Radius.zero),
                                    child: Image.network(
                                      //story.imageUrl,
                                      'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
                                      width: 140.w,
                                      height: 80.h, // Adjust as needed
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 90.h,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        // Display the icon
                                        Icon(
                                          Icons.place_rounded,
                                          size: 15.sp,
                                          color: Color(0xFF5EF3D5),
                                        ),
                                        SizedBox(width: 4.w),
                                        // Display the company name
                                        Text(
                                          'Company Name',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 118.h,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Text(
                                      story.storyTitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ) : SizedBox(),
          ),
        ),
        ],
      )
    );
  }
}
