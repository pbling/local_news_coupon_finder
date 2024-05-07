import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../Datas/models.dart';
import '../Pages/news_detail_page.dart';


class NewsListView extends StatefulWidget {

  final List<News> newsList;
  NewsListView({Key?key, required this.newsList}) : super(key:key);

  @override
  _newsListViewState createState() => _newsListViewState();
}


class _newsListViewState extends State<NewsListView> {

  bool isStored = false;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 360.w,
      height: (330 * widget.newsList.length).h,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.newsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top:20.h, bottom: 20.h),
                child : GestureDetector(
                  onTap: () {
                    print('news cilck : ' + widget.newsList[index].newsId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(selectedNews: widget.newsList[index]),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            size: min(16.sp, 16.h),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '오픈 특가 행사합니다.',
                            style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: min(16.sp, 16.h),
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),

                      // 가게 대표 사진
                      SizedBox(height: 20.h),
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
                            DateFormat('yyyy-MM-dd').format(widget.newsList[index].createdDate),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: min(12.sp, 12.h),
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
                                  fontSize: min(12.sp, 12.h),
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
                          '모든 제품을 사장님이 직접 각국에서 소싱해 오셔서 최신 트랜드를 느끼실 수 있습니다.',
                          //widget.newsList[index].newsDetail,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: min(16.sp, 16.h),
                            fontFamily: "Pretendard",
                            color: Colors.black,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 360.w,
                height: 15.h,
                color: Color(0xFFF5F5F5),
              )
            ],
          );
        },
      ),
    );
  }
}
