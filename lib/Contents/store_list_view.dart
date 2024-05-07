import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Datas/models.dart';
import '../Pages/store_detail_page.dart';

class StoreListView extends StatefulWidget {

  final List<Store> storeList;
  StoreListView({Key?key, required this.storeList}) : super(key:key);

  @override
  _StoreListViewState createState() => _StoreListViewState();
}

class _StoreListViewState extends State<StoreListView> {

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 355.h * widget.storeList.length + 15,

      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.storeList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left : 20.w, right : 20.w, top : 17.h, bottom: 17.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 박스 상단부분 상점 이미지
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/11/22/21/57/apparel-1850804_1280.jpg',
                          width: double.infinity,
                          height: 160.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                            });
                            print('즐겨찾기 상점에 추가');
                          },
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: isFavorite ?
                              Colors.cyanAccent.withOpacity(0.5) : Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isFavorite ?
                              Icons.favorite : Icons.favorite_border,
                              color: Colors.white,
                              size: 24.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // 박스 하단부분 상점 설명
                  Container(
                    padding: EdgeInsets.only(left : 20.w, right: 20.w, top: 20.h, bottom: 20.h),
                    child : GestureDetector(
                      onTap: () {
                        print('store cilck : ' + widget.storeList[index].storeId);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoreDetailPage(selectedStore: widget.storeList[index]),
                          ),
                        );
                      },
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 가게명, 지역
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.storeList[index].storeId,
                                //'가게명 표출',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: min(18.h, 18.sp),
                                  fontFamily: "Pretendard",
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                //widget.storeList[index].storeId,
                                '성북구 지역 · 뷰티',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: min(14.h, 14.sp),
                                  fontFamily: "Pretendard",
                                  color: Color(0xFF999999),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),

                          // 가게 정보
                          SizedBox(height: 15.h),
                          Text(
                            '신장개업했습니다! 이벤트 확인해보세요~ 좋은 혜택이 많이 있습니다.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: min(16.h, 16.sp),
                              fontFamily: "Pretendard",
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          // 소식, 쿠폰 갯수, 좋아요 갯수,
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Container(
                                width: 55.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xFFEDEDED),
                                ),
                                child: Center(
                                  child: Text(
                                    '소식 00개',
                                    //'소식　${widget.storeList[index].newsNumber}개',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: min(10.h, 10.sp),
                                      fontFamily: "Pretendard",
                                      color: Color(0xFF5EF3D5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                width: 55.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xFFEDEDED),
                                ),
                                child: Center(
                                  child: Text(
                                    '쿠폰 00개',
                                    //'소식　${widget.storeList[index].newsNumber}개',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: min(10.h, 10.sp),
                                      fontFamily: "Pretendard",
                                      color: Color(0xFF5EF3D5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Spacer(),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Color(0xFF5EF3D5),
                                    size: min(12.h, 12.sp),
                                  ),
                                  SizedBox(width: 5.5.w), // 하트 아이콘과 좋아요 수 사이의 간격
                                  Text(
                                    '000명이 PICK',
                                    //'${widget.storeList[index].favoriteNumber}명이 좋아합니다.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: min(12.h, 12.sp),
                                      fontFamily: "Pretendard",
                                      color: Color(0xFF999999),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
