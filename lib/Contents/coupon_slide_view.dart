import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Datas/models.dart';


class CouponSlideView extends StatefulWidget {

  final List<Coupon> couponList;
  CouponSlideView({Key?key, required this.couponList}) : super(key:key);

  @override
  _couponSlideViewState createState() => _couponSlideViewState();
}

class _couponSlideViewState extends State<CouponSlideView>  {

  late List<bool> isDownload;

  @override
  void initState() {
    super.initState();
    // 각 쿠폰에 대한 초기 클릭 상태 설정
    isDownload = List.generate(widget.couponList.length, (index) => false);
    for(var item in isDownload){
      item = false;
    }
  }

  @override
  Widget build(BuildContext context) {

    final itemCount = widget.couponList.length >= 5 ? 5 : widget.couponList.length;

    return Container(
      height: 157.h,
      child: SingleChildScrollView(
        physics: PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(itemCount, (index) {
            final coupon = widget.couponList[index];
            return Padding(
              padding: EdgeInsets.only(left: 20.w, right: 7.5.w, top : 20.h, bottom: 20.h),
              child: Container(
                width: 230.w,
                height: 116.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Color(0xFFD4D4D8),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child : Padding(
                        padding : EdgeInsets.only(left: 13.w, right: 13.w, top: 18.h, bottom: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              coupon.couponDetail,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14.0.sp,
                                fontFamily: "Pretendard",
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '${DateFormat('yy.MM.dd').format(coupon.startDate)} ~ ${DateFormat('yy.MM.dd').format(coupon.endDate)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                fontFamily: "Pretendard",
                                color: Color(0xFF999999),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/icon/place.png',
                                  width: 11.2.w,
                                  height: 14.h,
                                  fit: BoxFit.fitHeight,
                                ),
                                SizedBox(
                                  width: 6.12.w,
                                ),
                                Text(
                                  coupon.storeId,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    fontFamily: "Pretendard",
                                    color: Color(0xFF5EF3D5),
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: isDownload[index]? null : (){
                          // 터치 이벤트 처리
                          setState(() {
                            // 아이콘 클릭 상태 토글
                            isDownload[index] = !isDownload[index];
                          });
                          print('다운로드 아이콘 클릭');
                        } ,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isDownload[index]? Color(0xFFD4D4D8) : Color(0xFF5EF3D5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Icon(
                            Icons.file_download,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}