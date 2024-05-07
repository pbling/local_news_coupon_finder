import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:local_news_coupon_finder/Pages/keyword_search_page.dart';
import 'package:local_news_coupon_finder/Pages/remedi_kopo_page.dart';
import 'package:local_news_coupon_finder/Pages/terms_page.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Init 시점
// 위치정보 사용은 앱다운로드 시점에 권한획득으로 체크 회피 가능? ***
// 위치정보 여부 체크
// 위치정보가 있으면 상단 text에 표시 (roadname)
// 위치정보가 없으면 동네설정으로 표시

// 클릭이벤트 발생 시점
// 약관동의 여부 체크
// 약관동의 했으면 주소검색 페이지 이동
// 약관동의 안했으면 약관동의 페이지 이동

// 주소검색 완료 시점
// 데이터 kopo model 형태로 획득
// 위치정보 데이터 저장 필요 ***
// 위치정보 있으면 상단 text에 표시 (roadname)


class LocationSearchBar extends StatefulWidget {
  //final Function(String) onLocationChanged;

  //LocationSearchBar({Key? key, required this.onLocationChanged}) : super(key: key);

  @override
  _locationSearchBarState createState() => _locationSearchBarState();
}

class _locationSearchBarState extends State<LocationSearchBar> {

  String _locationInfo = '';
  bool _agreementStatus = false;

  static const platform = MethodChannel('location_channel');


  // 약관동의 다이얼로그
  Future<void> _showTermsAgreementDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.white,
          title: Text(
            '위치 정보를 사용할 수 없습니다.',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: min(16.h, 16.sp),
              fontFamily: "Pretendard"
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '서비스 이용을 위해서는 동네곳곳의 위치정보 사용약관 동의가 필요합니다.',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: min(16.h, 16.sp),
                      fontFamily: "Pretendard"
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                '동의하러 가기',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: min(14.h, 14.sp),
                  fontFamily: "Pretendard"
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                // 위치정보 사용약관 페이지 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermsPage(),
                  ),
                );
              },
            ),
            TextButton(
              child: Text(
                '취소',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: min(14.h, 14.sp),
                    fontFamily: "Pretendard"
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // 위치정보 여부 체크 ***
  Future<void> _checkIsLocationInfo() async {
    String locationInfo;
    locationInfo = '손곡로 67';

    setState(() {
      _locationInfo = locationInfo;
    });
  }

  // 약관동의 여부 체크 ***
  Future<void> _checkAgreementStatus() async {
    bool checkResult;
    checkResult = true;

    setState(() {
      _agreementStatus = checkResult;
    });
  }

  // 위치 선택 화면 열기
  void _openLocationPicker() async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemidiKopoPage(),
      ),
    );

    if(model != null){
      // 주소 데이터 저장 함수 호출
      _updateLocationInfo(model);
    }
    else{
      print('검색결과가 없습니다.');
    }

  }

  // 위치데이터 + 화면 업데이트 ***
  Future<void> _updateLocationInfo(KopoModel location) async {
    print(location.roadAddress);

    _handleLocationChange(location.roadname.toString());

    setState(() {
      _locationInfo = '${location.roadname}';
    });
  }

  void _handleLocationChange(String newLocation) {
    // 주소변경 시점에 콜백함수 호출
    //widget.onLocationChanged(newLocation);
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkIsLocationInfo();
    _checkAgreementStatus();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.centerLeft,
      width: 360.w,
      height: 50.h,
      color: Colors.white,
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(width: 21.w),
              Container(
                width: 16.w,
                height: 20.h,
                child: Image.asset(
                  'assets/images/icon/place.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () async {
                  await _checkAgreementStatus();
                  _agreementStatus? _openLocationPicker() : await _showTermsAgreementDialog();
                },
                child : Row(
                  children: [
                    Text(
                      _locationInfo.isEmpty ? '동네설정하기' : _locationInfo,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: min(16.h, 16.sp),
                        fontFamily: "Pretendard",
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      width: 25.w,
                      height: 20.h,
                      child : Icon(
                      CupertinoIcons.chevron_down,
                      size: 20.h,
                    ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 21.w,
            child: GestureDetector(
              onTap: () {
                print('키워드검색');

                // 키워드 검색 화면 전환
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KeywordSearchPage()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: 25.w,
                height: 22.h,
                child: Icon(
                  CupertinoIcons.search,
                  size: 22.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
