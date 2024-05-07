import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Datas/models.dart';


class CouponNewsListView extends StatefulWidget {
  final List<CouponNews> couponNewsList;
  CouponNewsListView({Key?key, required this.couponNewsList}) : super(key:key);

  @override
  _couponNewsListViewState createState() => _couponNewsListViewState();
}

class _couponNewsListViewState extends State<CouponNewsListView> {

  late List<bool> isDownload;
  late List<bool> isStored;

  @override
  void initState() {
    super.initState();
    // 각 쿠폰에 대한 초기 클릭 상태 설정
    isDownload = List.generate(widget.couponNewsList.length, (index) => false);
    isStored = List.generate(widget.couponNewsList.length, (index) => false);

    for(var item in isDownload){
      item = false;
    }
    for(var item in isStored){
      item = false;
    }
  }

  String isstartEndDate(int index){

    String duration = '';

    if(widget.couponNewsList[index].startDate != null && widget.couponNewsList[index].endDate != null) {
      String start = DateFormat('yyyy.MM.dd').format(widget.couponNewsList[index].startDate ?? DateTime.now());
      String end = DateFormat('MM.dd').format(widget.couponNewsList[index].endDate ?? DateTime.now());
      duration = start +'~'+ end;
    } else {
      duration = '';
    }
    return duration;
  }

  String isCouponOrNews(List<CouponNews> list, int index){
    String itemType ='';

    if(list[index].couponId != ''){
      itemType =  'coupon';
    } else if(list[index].newsId != ''){
      itemType = 'news';
    }
    else{
      itemType = '';
    }
    print(itemType);
    return itemType;
  }

  double getHeight(){
    int numCoupon = 0;
    int numNews = 0;
    double h = 0.0;

    for(var i =0; i < widget.couponNewsList.length ; i++){
      if(widget.couponNewsList[i].couponId != ''){
        numCoupon += 1;
      } else if(widget.couponNewsList[i].newsId != ''){
        numNews += 1;
      }
    }

    h = 225.0 * numCoupon + 350.0 * numNews;

    print(numCoupon);
    print(numNews);
    print('height ' + h.toString());
    return h;
  }


  @override
  Widget build(BuildContext context) {

    double viewHeight = getHeight();

    return Container(
      width: 360.w,
      height: viewHeight.h,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.couponNewsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              isCouponOrNews(widget.couponNewsList, index) == 'coupon'?
              Container(
                color: Colors.white,
                height: 210.h,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top:20.h, bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 360.w,
                      height: 50.h,
                      child: Row(
                        children: [
                          //가게사진
                          InkWell(
                            onTap: () {
                              print('가게사진 클릭');
                            },
                            child: ClipOval(
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2024/03/14/08/52/pug-8632718_1280.jpg',
                                fit: BoxFit.cover,
                                width: min(40.w, 40.h),
                                height: min(40.w, 40.h),
                              ),
                            ),
                          ),

                          SizedBox(width: 10.w),
                          // 가게명, 업종
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //가게명
                                Text(
                                  widget.couponNewsList[index].storeId,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: min(18.h, 18.sp),
                                    fontFamily: "Pretendard",
                                  ),
                                ),

                                SizedBox(height: 2.h),
                                // 업종
                                Text(
                                  widget.couponNewsList[index].storeId,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: min(14.h, 14.sp),
                                    fontFamily: "Pretendard",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height : 18.h),
                    // 쿠폰 정보
                    Container(
                      width: 360.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFFD4D4D8),
                          )
                      ),
                      child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                                  height: 100.h,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.couponNewsList[index].detail,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: min(16.h, 16.sp),
                                          fontFamily: "Pretendard",
                                        ),
                                        maxLines: 1,
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        isstartEndDate(index),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: min(14.h, 14.sp),
                                          fontFamily: "Pretendard",
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Container(
                                        height: 20.h,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.storefront,
                                              size: min(14.sp, 14.h),
                                              color: Color(0xFF5EF3D5),
                                            ),
                                            SizedBox(width: 4.03.w),
                                            Text(
                                              widget.couponNewsList[index].storeId,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: min(14.h, 14.sp),
                                                fontFamily: "Pretendard",
                                                color: Color(0xFF5EF3D5),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child : GestureDetector(
                                onTap:(){
                                  setState(() {
                                  });
                                  print('다운로드 아이콘 클릭');
                                } ,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD4D4D8),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        bottomLeft: Radius.circular(0),
                                        topRight: Radius.circular(20),
                                        // 좌측만 둥글게
                                        bottomRight:
                                        Radius.circular(20), // 좌측만 둥글게
                                      )),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.file_download,
                                          color: Colors.white,
                                          size: min(30.h, 30.sp),
                                        ),
                                        SizedBox(height: 3.h),
                                        Text(
                                          '000개 남음',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: min(10.h, 10.sp),
                                            fontFamily: "Pretendard",
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ) :
              Container(
                color: Colors.white,
                height: 335.h,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top:20.h, bottom: 20.h),
                child : GestureDetector(
                  onTap: () {
                    print('news cilck : ' + widget.couponNewsList[index].newsId);
                    // newsId 로 news 객체 받아와서
                    // newsdetailpage로 이동
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 가게명, 업종 표출
                      Container(
                        width: 360.w,
                        height: 50.h,
                        child: Row(
                          children: [
                            //가게사진
                            InkWell(
                              onTap: () {
                                print('가게사진 클릭');
                              },
                              child: ClipOval(
                                child: Image.network(
                                  'https://cdn.pixabay.com/photo/2024/03/14/08/52/pug-8632718_1280.jpg',
                                  fit: BoxFit.cover,
                                  width: min(40.w, 40.h),
                                  height: min(40.w, 40.h),
                                ),
                              ),
                            ),

                            SizedBox(width: 10.w),
                            // 가게명, 업종
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //가게명
                                  Text(
                                    widget.couponNewsList[index].storeId,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: min(18.h, 18.sp),
                                      fontFamily: "Pretendard",
                                    ),
                                  ),

                                  SizedBox(height: 2.h),
                                  // 업종
                                  Text(
                                    widget.couponNewsList[index].storeId,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: min(14.h, 14.sp),
                                      fontFamily: "Pretendard",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 가게 대표 사진
                      SizedBox(height: 18.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/11/22/21/57/apparel-1850804_1280.jpg',
                          width: double.infinity,
                          height: 130.h,
                          fit : BoxFit.cover,
                        ),
                      ),

                      // 소식 등록일
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Text(
                            widget.couponNewsList[index].createdDate,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: min(14.h, 14.sp),
                              fontFamily: "Pretendard",
                              color: Color(0xFF999999),
                            ),
                            textAlign: TextAlign.right,
                          ),

                          Container(
                            alignment: Alignment.centerRight,
                            width: 55.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xFFEDEDED),
                            ),
                            child: Center(
                              child: Text(
                                '소식',
                                //'소식　${widget.storeList[index].newsNumber}개',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: min(12.h, 12.sp),
                                  fontFamily: "Pretendard",
                                  color: Color(0xFF5EF3D5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // 소식 정보
                      SizedBox(height: 10.h),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '모든 제품을 사장님이 직접 각국에서 소싱해 오셔서 최신 트랜드를 느끼실 수 있습니다. 모든 제품을 사장님이 직접 각국에서 소싱해 오셔서 최신 트랜드를 느끼실 수 있습니다.',
                          //widget.newsList[index].newsDetail,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: min(16.h, 16.sp),
                            fontFamily: "Pretendard",
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.h)
            ],
          );
        },
      ),
    );
  }
}
