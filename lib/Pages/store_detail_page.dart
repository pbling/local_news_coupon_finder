import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_news_coupon_finder/Contents/store_detail_info_view.dart';

import '../Contents/coupon_slide_view.dart';
import '../Contents/news_list_view.dart';
import '../Datas/coupon_service_.dart';
import '../Datas/models.dart';
import '../Datas/news_service_.dart';


class StoreDetailPage extends StatefulWidget {
  final Store selectedStore;
  StoreDetailPage({required this.selectedStore});

  @override
  _storeDetailPageState createState() => _storeDetailPageState();
}

class _storeDetailPageState extends State<StoreDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<News>> _newsFuture;
  late Future<List<Coupon>> _couponFuture;
  late int _selectedTabbar = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _newsFuture = _fetchNews();
    _couponFuture = _fetchCoupons();
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the tab controller
    super.dispose();
  }


  Future<List<News>> _fetchNews() async {
    return await NewsNewService().getCurrentNewsList();
  }

  Future<List<Coupon>> _fetchCoupons() async {
    return await CouponNewService().getCurrentCouponList();
  }

  @override
  Widget build(BuildContext context) {

    final tabMenu = ['상점정보', '상점소식'];

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
                        widget.selectedStore.storeId,
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


      body: FutureBuilder(
        future: Future.wait([_newsFuture, _couponFuture]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<News> newsList = snapshot.data![0];
            List<Coupon> couponList = snapshot.data![1];

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[

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
                    width:  360.w,
                    height: 180.h,
                    padding: EdgeInsets.only(left: 25.w, right: 25.w, top : 30.h, bottom: 15.h),
                    child: Column(
                      children: [
                        // 상점명 + 지역
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150.w,
                              child: Text(
                                widget.selectedStore.storeId,
                                style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              width: 150.w,
                              height: 24.h,
                              child: Text(
                                '성북구 지역 · 고기요리',
                                style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF999999)
                                ),
                                textAlign: TextAlign.right,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 10),
                        // 좋아요 정보
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 11.w,
                              height: 15.h,
                              child: Icon(
                                Icons.favorite,
                                color: Color(0xFF5EF3D5),
                                size: 15.sp,
                              ),
                              alignment: Alignment.center,
                            ),
                            SizedBox(width: 6.w),
                            Container(
                              width: 150.w,
                              child: Text(
                                '300명이 Pick',
                                style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF999999)
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 22.h),
                        // 좋아요, 홈페이지, 연락
                        Container(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          width: 310.w,
                          height: 48.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('좋아요 저장');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 20.sp,
                                      color: Color(0xFF999999),
                                    ),
                                    SizedBox(width: 7.8.w),
                                    Text(
                                      '나의 Pick',
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF999999)
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 0.5,
                                height: 48.h,
                                color: Color(0xFF999999),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('홈페이지');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.home_outlined,
                                      size: 20.sp,
                                      color: Color(0xFF999999),
                                    ),
                                    SizedBox(width: 7.8.w),
                                    Text(
                                      '홈페이지',
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF999999)
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 0.5,
                                height: 48.h,
                                color: Color(0xFF999999),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('전화연결');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.call,
                                      size: 20.sp,
                                      color: Color(0xFF999999),
                                    ),
                                    SizedBox(width: 7.8.w),
                                    Text(
                                      '전화연결',
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF999999)
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  CouponSlideView(couponList: couponList),
//                  Container(child : NewsListView(newsList: newsList)),

                  Container(
                    width: 360.w,
                    height: 15.h,
                    color: Color(0xFFF5F5F5),
                  ),

                  Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        onTap: (index) {
                          print(index);
                          setState(() {
                            _selectedTabbar = index;
                          });
                          },
                        tabs: [
                          Tab(
                            height: 40.h,
                            child:Text(
                              '상정정보',
                              style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Tab(
                            height: 40.h,
                            child:Text(
                              '행사소식',
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Builder(builder: (_) {
                        if (_selectedTabbar == 0) {
                          return StoreDetailInfoView(store: widget.selectedStore);//1st custom tabBarView
                        } else {
                          return NewsListView(newsList: newsList); //3rd tabView
                        }
                      }),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
