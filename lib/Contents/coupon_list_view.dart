import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Datas/models.dart';


class CouponListView extends StatefulWidget {
  final List<Coupon> couponList;
  CouponListView({Key?key, required this.couponList}) : super(key:key);

  @override
  _couponListViewState createState() => _couponListViewState();
}

class _couponListViewState extends State<CouponListView> {

  @override
  void initState() {
    super.initState();

  }

  String isstartEndDate(int index){

    String duration = '';

    if(widget.couponList[index].startDate != null && widget.couponList[index].endDate != null) {
      String start = DateFormat('yy.MM.dd').format(widget.couponList[index].startDate ?? DateTime.now());
      String end = DateFormat('yy.MM.dd').format(widget.couponList[index].endDate ?? DateTime.now());
      duration = start + '~' + end;
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
    numCoupon = widget.couponList.length;
    double h = 0.0;

    h = 232.0 * numCoupon;

    print(numCoupon);
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
        itemCount: widget.couponList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top:20.h, bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 360.w,
                      height: 60.h,
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
                                width: 40.w,
                                height: 40.h,
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
                                  widget.couponList[index].storeId,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18.sp,
                                    fontFamily: "Pretendard",
                                  ),
                                ),

                                SizedBox(height: 2.h),
                                // 업종
                                Text(
                                  widget.couponList[index].storeId,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    fontFamily: "Pretendard",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height : 20.h),
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
                                        widget.couponList[index].couponDetail,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16.sp,
                                          fontFamily: "Pretendard",
                                        ),
                                        maxLines: 1,
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        isstartEndDate(index),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          fontFamily: "Pretendard",
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Container(
                                        height: 20.h,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/icon/place.png',
                                              width: 13.w,
                                              height: 15.h,
                                              fit: BoxFit.fitHeight,
                                            ),
                                            SizedBox(width: 6.12.w),
                                            Text(
                                              widget.couponList[index].storeId,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
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
                                  child: Icon(
                                    Icons.file_download,
                                    color: Colors.white,
                                    size: 35.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                width: 360.w,
                height: 10.h,
                color: Color(0xFFF5F5F5),
              )
            ],
          );
        },
      ),
    );
  }
}
