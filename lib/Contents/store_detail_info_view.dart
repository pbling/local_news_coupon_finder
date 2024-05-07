import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Contents/photo_list_view.dart';
import 'package:local_news_coupon_finder/Contents/photo_slide_view.dart';

import '../Datas/models.dart';

class StoreDetailInfoView extends StatefulWidget {

  final Store store;
  StoreDetailInfoView({Key?key, required this.store}) : super(key:key);

  @override
  _storeDetailInfoViewState createState() => _storeDetailInfoViewState();
}

class _storeDetailInfoViewState extends State<StoreDetailInfoView> {
  bool isScheduleList = false;
  bool isMenuList = false;
  bool isStorePhoto = false;

  double totalHeight = 0;

  List<Schedule> scheduleList = [];
  List<Menu> menuList = [];
  List<String> photoList = [];

  @override
  void initState(){
    super.initState();
    checkDataInfo();
  }

  void checkDataInfo() {
    if(widget.store.storeDetail.timeSchedule.length>0){
      isScheduleList = true;
      scheduleList.addAll(widget.store.storeDetail.timeSchedule);
    }
    if(widget.store.storeDetail.menuList.length>0){
      isMenuList = true;
      menuList.addAll(widget.store.storeDetail.menuList);
    }

    photoList = ['https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
      'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
      'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
      'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
      'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
      'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
      'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
      'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg'];
    isStorePhoto = true;

    setState(() {});
  }

  void calculateContainerHeight(){
    double height = 0;

    if(isScheduleList){
      height = height + (25 * scheduleList.length) + 290;
    } else {
      height = height + 260;
    }
    if(isMenuList){
      height = height + (25 * menuList.length) + 70;
      height = height + 15;
    }
    if(isStorePhoto){
      height = height + max(220.h, 220.w) + 100.h;
      height = height + 15;
    }
    totalHeight = height + 70.h;
    print(totalHeight);
  }

  @override
  Widget build(BuildContext context) {

    var cameraPosition = NCameraPosition(
      target: NLatLng(37.506932467450326, 127.05578661133796),
      zoom: 15,
      bearing: 45,
      tilt: 30,
    );

    calculateContainerHeight();

    return Container(
      width : 360.w,
      height: totalHeight.h,

      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
            width: 360.w,
            height: isScheduleList? ((25*scheduleList.length) + 290).h : 260.h,
            child: Column(
              children: [

                // 운영시간
                Visibility(
                  visible: isScheduleList,
                  child: Column(
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.access_time,
                            size: min(16.sp, 16.h),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '운영시간',
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: min(16.sp, 16.h),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height : 10.h),

                      Container(
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 25.w),
                          shrinkWrap: true,
                          itemCount: scheduleList.length,
                          itemBuilder: (context, index) {
                            final schedule = scheduleList[index];
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${schedule.day}　:　${schedule.time}',
                                    style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontSize: min(14.sp, 14.h),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height : 1.5.h),
                                ]
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                isScheduleList? SizedBox(height: 20.h) : SizedBox(),

                // 상점주소
                Container(
                  child : Column(
                    children:[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.map_outlined,
                            size: min(16.sp, 16.h),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '상점위치',
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: min(16.sp, 16.h),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height : 10.h),
                      Container(
                        padding: EdgeInsets.only(left: 25.w),
                        child : Text(
                          '서울 성북구 보국문로 81-1 1층',
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: min(14.sp, 14.h),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),

                      SizedBox(height: 15.h),
                      Container(
                        width: 350.w,
                        height: 150.h,
                        color: Colors.amber,
                        /*
                  child: NaverMap(
                    options: NaverMapViewOptions(
                      initialCameraPosition: cameraPosition,
                      minZoom: 10, // default is 0
                      maxZoom: 16, // default is 21
                      maxTilt: 30, // default is 63
                    ),
                    onMapReady: (controller) {},
                  ),
                   */
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),


          // 구분선
          isMenuList? Container(
            color: Color(0xFFF5F5F5),
            height: 15.h,
          ) : SizedBox(),


          // 메뉴목록
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
            width: 360.w,
            height: isMenuList? ((25 * menuList.length) + 70).h : 0,
            color: Colors.red,
            child: Column(
              children: [
                Visibility(
                  visible: isMenuList,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.menu_book_rounded,
                            size: min(16.sp, 16.h),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '상품정보',
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: min(16.sp, 16.h),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height : 10.h),

                      Container(
                        padding: EdgeInsets.only(left : 25.w),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: menuList.length,
                          itemBuilder: (context, index) {
                            final menu = menuList[index];
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${menu.menuName}　:　${menu.menuPrice}',
                                    style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontSize: min(14.sp, 14.h),
                                      fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                  SizedBox(height : 1.5.h),
                                ]
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),

          // 구분선
          isStorePhoto? Container(
            color: Color(0xFFF5F5F5),
            height: 15.h,
          ) : SizedBox(),

          // 사진목록
          Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
              width: 360.w,
              height: isStorePhoto? max(220.h, 220.w) + 100.h : 0,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Visibility(
                    visible: isStorePhoto,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.photo_album_outlined,
                              size: min(16.sp, 16.h),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              '상점사진',
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: min(16.sp, 16.h),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height : 10.h),

                        PhotoListView(imageUrls: photoList),
                      ],
                    )
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
