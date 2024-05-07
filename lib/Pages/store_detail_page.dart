import 'dart:math';

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

    return SafeArea(child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(360.w, 50.h),
        child: AppBar(
          toolbarHeight: 50.h,
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: min(16.h, 16.sp),
            ),
            onPressed: () {
              Navigator.pop(context); // 이전 화면으로 돌아가기
            },
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
                width: 360.w,
                height: 49.h,
                child: Row(
                  children: [
                    SizedBox(width: 50.w),
                    Text(
                      widget.selectedStore.storeId,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: min(16.h, 16.sp),
                          fontFamily: "Pretendard"
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                height: 1.h, // 회색 줄의 높이
                color: Color(0xFFF5F5F5), // 회색 줄의 색상
              ),
            ],
          ),
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
                    height: 220.h,
                    color: Colors.yellow,
                    padding: EdgeInsets.only(left: 25.w, right: 25.w, top : 30.h,),
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
                                    fontSize: min(20.sp, 20.h),
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
                                    fontSize: min(14.sp, 14.h),
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
                                size: min(15.sp, 15.h),
                              ),
                              alignment: Alignment.center,
                            ),
                            SizedBox(width: 6.w),
                            Container(
                              width: 150.w,
                              child: Text(
                                '300명 Pick',
                                style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: min(12.sp, 12.h),
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

                        SizedBox(width: 6.w),
                        Container(
                          width: 300.w,
                          height: 70.h,
                          child: Text(
                            '진심을 다해 선보이는 스시 오마카세 \n 콜키지는 에약 시 요청사항에 적어주시면 감사하겠습니다.',
                            style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: min(14.sp, 14.h),
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 3,
                          ),
                          alignment: Alignment.centerLeft,
                        ),

                        SizedBox(height: 15.h),
                        // 좋아요, 홈페이지, 연락
                        Container(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          width: 310.w,
                          height: 35.h,
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
                                      size: min(20.sp, 20.h),
                                      color: Color(0xFF999999),
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      'Pick',
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: min(14.sp, 14.h),
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
                                height: 35.h,
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
                                      size: min(20.sp, 20.h),
                                      color: Color(0xFF999999),
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      '홈페이지',
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: min(14.sp, 14.h),
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
                                      size: min(20.sp, 20.h),
                                      color: Color(0xFF999999),
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      '전화',
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: min(14.sp, 14.h),
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
                              '상점정보',
                              style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: min(14.sp, 14.h),
                                  fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Tab(
                            height: 40.h,
                            child:Text(
                              '행사소식',
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: min(14.sp, 14.h),
                                fontWeight: FontWeight.w800,
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
    ),);
  }
}
