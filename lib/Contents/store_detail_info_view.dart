import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  bool isMenuPhoto = false;
  bool isStorePhoto = false;

  double totalHeight = 0;

  List<Schedule> scheduleList = [];
  List<Menu> menuList = [];

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

    isMenuPhoto = true;
    isStorePhoto = true;

    setState(() {});
  }

  void calculateContainerHeight(){
    double height = 0;

    if(isScheduleList){
      height = height + (27 * scheduleList.length) + 320;
    } else {
      height = height + 270;
    }
    if(isMenuList){
      height = height + (27 * menuList.length) + 80 + 10;
    }
    if(isMenuPhoto){
      height = height + 205 + 10;
    }
    if(isStorePhoto){
      height = height + 205;
    }
    totalHeight = height + 40;
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
            height: isScheduleList? ((25*scheduleList.length) + 320).h : 270.h,
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
                            size: 16.sp,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '운영시간',
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height : 15.h),

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
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height : 1.5.h),
                                ]
                            );
                          },
                        ),
                      ),
                      
                      SizedBox(height: 21.h),
                    ],
                  ),
                ),

                // 상점주소
                Container(
                  child : Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.map_outlined,
                            size: 16.sp,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '상점위치',
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height : 15.h),
                      Container(
                        padding: EdgeInsets.only(left: 25.w),
                        child : Text(
                          '서울 성북구 보국문로 81-1 1층',
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: 14.sp,
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

          isMenuList? Container(
              width: 360.w,
              height: 10.h,
              color: Color(0xFFF5F5F5)
          ): SizedBox(height: 0),

          // 메뉴목록
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
            width: 360.w,
            height: isMenuList? ((27 * menuList.length) + 80).h : 0,
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
                            size: 16.sp,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '상품목록',
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height : 15.h),

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
                                      fontSize: 14.sp,
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

          isMenuPhoto? Container(
            width: 360.w,
            height: 10.h,
            color: Color(0xFFF5F5F5),
          ) : SizedBox(height: 0),

          // 메뉴사진
          Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
              width: 360.w,
              height: isMenuPhoto? 205.h : 0,
              child: Column(
                children: [
                  Visibility(
                    visible: isMenuPhoto,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.list_alt_rounded,
                              size: 16.sp,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              '상품사진',
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Container(
                          height: 140.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left : 10.w, right: 10.w, top: 20.h, bottom: 20.h),
                                child : GestureDetector(
                                  onTap: () {
                                    // 사진 클릭 시 팝업을 띄웁니다.
                                    showDialog(
                                      context: context,
                                      builder: (context) => PhotoSlideView(
                                        imageUrl:
                                        'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
                                      ),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
                                      width: 100.w,
                                      height: 100.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
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

          isStorePhoto? Container(
            width: 360.w,
            height: 10.h,
            color: Color(0xFFF5F5F5),
          ) : SizedBox(height: 0),

          // 상점사진
          Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
              width: 360.w,
              height: isStorePhoto? 205.h : 0,
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
                              Icons.storefront,
                              size: 16.sp,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              '상점사진',
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Container(
                          height: 140.0.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left : 10.w, right: 10.w, top: 20.h, bottom: 20.h),
                                child : GestureDetector(
                                  onTap: () {
                                    // 사진 클릭 시 팝업을 띄웁니다.
                                    showDialog(
                                      context: context,
                                      builder: (context) => PhotoSlideView(
                                        imageUrl:
                                        'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
                                      ),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      'https://cdn.pixabay.com/photo/2013/08/10/18/13/candies-171342_1280.jpg',
                                      width: 100.w,
                                      height: 100.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
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
        ],
      ),
    );
  }
}
