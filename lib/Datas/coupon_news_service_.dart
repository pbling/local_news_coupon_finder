import 'dart:math';

import 'package:intl/intl.dart';
import 'coupon_service_.dart';
import 'models.dart';
import 'news_service_.dart';

class CouponNewsNewService {
  static final CouponNewsNewService _couponService = CouponNewsNewService
      ._internal();

  factory CouponNewsNewService() => _couponService;

  CouponNewsNewService._internal();

  List<Coupon> _coupons = [];
  List<News> _newses = [];


  Future<void> loadCouponAndEvent() async {
    _coupons.clear();
    _newses.clear();

    _coupons = await(CouponNewService().getCurrentCouponList());
    _newses = await(NewsNewService().getCurrentNewsList());

    print(_coupons);
    print(_newses);

  }


  // (쿠폰/소식) 최신 쿠폰 및 소식 목록
  Future<List<CouponNews>> allCouponNewsItems() async{

    await loadCouponAndEvent();

    List<CouponNews> mergedCouponNewsList = [];

    if (_coupons.isNotEmpty) {
      for (var i = 0; i < _coupons.length; i++) {
        CouponNews item = new CouponNews(
          couponId: 'coupon',
          storeId: _coupons[i].storeId,
          category: _coupons[i].category,
          title: _coupons[i].couponTitle,
          createdDate: DateFormat('yyyy-MM-dd').format(_coupons[i].createdDate),
          detail: _coupons[i].couponDetail,
          startDate: _coupons[i].startDate,
          endDate: _coupons[i].endDate,
        );
        mergedCouponNewsList.add(item);
      }
    }
    else {
      print('쿠폰 리스트 비어있음');
    }

    if (_newses.isNotEmpty) {
      for (var i = 0; i < _newses.length; i++) {
        CouponNews item = new CouponNews(
          newsId: 'news',
          storeId: _newses[i].storeId,
          category: _newses[i].category,
          createdDate: DateFormat('yyyy-MM-dd').format(_newses[i].createdDate),
          title: _newses[i].newsTitle,
          detail: _newses[i].newsDetail,
        );
        mergedCouponNewsList.add(item);
      }
    }
    else {
      print('소식 리스트 비어있음');
    }

    // 랜덤출력
    mergedCouponNewsList?.shuffle(Random());

    return mergedCouponNewsList;
  }

  // (쿠폰/소식) 카테고리 검색
  Future<List<CouponNews>> filteredCouponNewsItems(String category, int sort) async {

    print('검색' + category + sort.toString());

    List<CouponNews> allCouponNewsList = await allCouponNewsItems();

    List<CouponNews> filteredCouponNewsList = [];
    List<CouponNews> sortCoupon = [];
    List<CouponNews> sortNews = [];

    List<Coupon> filteredCouponList = [];
    List<News> filteredNewsList = [];

    if(category == '전체' && sort == 0){
      // 전체 + 전체
      print('전체 검색');
      filteredCouponNewsList.addAll(allCouponNewsList);
    }
    else {
      filteredCouponList.addAll(await CouponNewService().getSearchedCouponList(category));
      filteredNewsList.addAll(await NewsNewService().getNewsListByCategory(category));
      // 쿠폰 - 카테고리 검색
      if(filteredCouponList.isNotEmpty) {

        for (var i = 0; i < filteredCouponList.length; i++){
          CouponNews item = new CouponNews(
            couponId: 'coupon',
            storeId: filteredCouponList[i].storeId,
            title: filteredCouponList[i].couponTitle,
            category: filteredCouponList[i].category,
            createdDate: DateFormat('yyyy-MM-dd').format(
                filteredCouponList[i].createdDate),
            detail: filteredCouponList[i].couponDetail,
            startDate: filteredCouponList[i].startDate,
            endDate: filteredCouponList[i].endDate,
          );
          filteredCouponNewsList.add(item);
        }
      } else {
        print('쿠폰 리스트 비어있음');
      }

      print('ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ');
      print(filteredCouponList);
      // 소식 - 카테고리 검색
      if (filteredNewsList.isNotEmpty) {
        for (var i = 0; i < filteredNewsList.length; i++) {
          CouponNews item = new CouponNews(
            newsId: 'news',
            storeId: filteredNewsList[i].storeId,
            category: filteredNewsList[i].category,
            createdDate: DateFormat('yyyy-MM-dd').format(
                filteredNewsList[i].createdDate),
            title: filteredNewsList[i].newsTitle,
            detail: filteredNewsList[i].newsDetail,
          );
          filteredCouponNewsList.add(item);
        }
      }
      else {
        print('소식 리스트 비어있음');
      }
    }

    print('ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ');
    print(filteredNewsList);


    if (sort == 1) {
      for (var i = 0; i < filteredCouponNewsList.length; i++) {
        if(filteredCouponNewsList[i].couponId.isNotEmpty)
          {
            sortCoupon.add(filteredCouponNewsList[i]);
          }
      }
      filteredCouponNewsList = sortCoupon;
    }
    else if (sort == 2) {
      for (var i = 0; i < filteredCouponNewsList.length; i++) {
        if(filteredCouponNewsList[i].newsId.isNotEmpty)
        {
          sortCoupon.add(filteredCouponNewsList[i]);
        }
      }
      filteredCouponNewsList = sortNews;
    }

    print('** Filter *******');
    print(filteredCouponNewsList);

    return filteredCouponNewsList;
  }
}