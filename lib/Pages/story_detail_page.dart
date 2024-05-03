import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import '../Datas/models.dart';

class StoryDetailPage extends StatefulWidget {
  final Story selectedStory;

  StoryDetailPage({required this.selectedStory});

  @override
  _storyDetailPageState createState() => _storyDetailPageState();
}

class _storyDetailPageState extends State<StoryDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  String generatePageURL() {
    String pageIdentifier = 'story/${widget.selectedStory.storyId}';
    String baseURL = 'https://example.com/';
    return baseURL + pageIdentifier;
  }

  void sharePage() {
    String pageURL = generatePageURL();
  }


  @override
  Widget build(BuildContext context) {

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
              width: 360.w,
              height: 50.h,
              child:  Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 50.w),
                      Text(
                        '곳곳이야기',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16.0.sp,
                            fontFamily: "Pretendard"
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 20.w,
                    child: GestureDetector(
                      onTap: () {
                        print('공유하기');
                        sharePage();
                      },
                      child: Container(
                        width: 20.w,
                        height: 23.h,
                        child: Icon(
                          Icons.share,
                          size: 25.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFF5F5F5), // 회색 줄의 높이
              height: 1, // 회색 줄의 색상
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              width: 360.w,
              height: 250.h,
              child:  Swiper(
                itemBuilder: (context, index) {
                  //final image = widget.selectedStore.storeImage[index];
                  final image = 'https://cdn.pixabay.com/photo/2016/11/22/21/57/apparel-1850804_1280.jpg';
                  return Image.network(
                    image,
                    fit: BoxFit.cover,
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                itemCount: 3,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top : 10.h, bottom: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 360.w,
                    height: 75.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 45.w,
                          height: 45.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(23),
                            child: Image.asset(
                              'assets/images/login/store.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: 10.w),
                        // 가게명, 업종
                        Container(
                          width: 200.w, // Container의 크기를 조절합니다.
                          height: 50.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //가게명
                              Text(
                                widget.selectedStory.storeId,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16.sp,
                                  fontFamily: "Pretendard",
                                ),
                              ),

                              SizedBox(height: 2.h),
                              // 업종
                              Text(
                                widget.selectedStory.storeId,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  fontFamily: "Pretendard",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),



                ],
              ),
            ),

            Container(
              color: Color(0xFFF5F5F5), // 회색 줄의 높이
              height: 1, // 회색 줄의 색상
            ),

            Container(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top : 30.h, bottom: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.selectedStory.storyTitle,
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    DateFormat('yyyy-MM-dd').format(widget.selectedStory.createdDate),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      fontFamily: "Pretendard",
                      color: Color(0xFF999999),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 15.h),

                  Container(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Text(
                      widget.selectedStory.storyDetail,
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      maxLines: 80,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
