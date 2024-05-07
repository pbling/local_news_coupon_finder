import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Datas/models.dart';
import '../Pages/news_detail_page.dart';

class SimpleNewsListView extends StatefulWidget {

  final List<News> newsList;
  SimpleNewsListView({Key?key, required this.newsList}) : super(key:key);

  @override
  _simpleNewsListViewState createState() => _simpleNewsListViewState();
}


class _simpleNewsListViewState extends State<SimpleNewsListView> {

  bool isStored = false;

  @override
  Widget build(BuildContext context) {

    print(widget.newsList.length);

    return Container(
      width: 360.w,
      height: 138.h * (widget.newsList.length >= 5 ? 5 : widget.newsList.length) ,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.newsList.length >= 5 ? 5 : widget.newsList.length,
        itemBuilder: (context, index){
          return GestureDetector(
              onTap: () {
                print('simple news cilck : ' + widget.newsList[index].newsId);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailPage(selectedNews: widget.newsList[index]),
                  ),
                );
              },
              child: Container(
                width: 360.w,
                height : 138.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Color(0xFFEDEDED),
                      height: 1.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w, top : 15.h, bottom : 10.h),
                      child : Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10), // 둥근 모서리 반지름 설정
                            child: Image.network(
                              'https://cdn.pixabay.com/photo/2016/11/22/21/57/apparel-1850804_1280.jpg', // 이미지 파일 경로 설정
                              width: 109.w, // 이미지의 너비 설정
                              height: 110.h, // 이미지의 높이 설정
                              fit: BoxFit.cover, // 이미지를 둥근 모서리에 맞게 자르기 위해 설정
                            ),
                          ),

                          SizedBox(width: 15.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 상점정보
                              Row(
                                children: [
                                  Icon(
                                    Icons.storefront,
                                    size: min(14.sp, 14.h),
                                    color: Color(0xFF5EF3D5),
                                  ),
                                  SizedBox(width: 4.03.w),
                                  Container(
                                    width: 100.w,
                                    child: Text(
                                      widget.newsList[index].storeId,
                                      style : TextStyle (
                                        fontWeight: FontWeight.w500,
                                        fontSize: min(14.h, 14.sp),
                                        color : Color(0xFF00D8BB),
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),

                              // 소식 상세정보
                              SizedBox(height: 10.h),

                              Container(
                                width: 196.w,
                                child: Text(
                                  widget.newsList[index].newsTitle,
                                  style : TextStyle (
                                    fontWeight: FontWeight.w800,
                                    fontSize: min(16.h, 16.sp),
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              // 카테고리
                              SizedBox(height: 10.h),

                              Container(
                                width: 100.w,
                                child: Text(
                                  '성북구 지역 · 뷰티',
                                  style : TextStyle (
                                    fontWeight: FontWeight.w500,
                                    fontSize: min(12.h, 12.sp),
                                    color: Color(0xFF999999),
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                ),
                              ),

                            ],
                          )
                        ],
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
