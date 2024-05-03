

import 'models.dart';

class CouponNewService {
  static final CouponNewService _couponService = CouponNewService._internal();

  factory CouponNewService() => _couponService;

  CouponNewService._internal();

  Future<List<Coupon>> getAllCoupons() async {
    // 2s 뒤에 데이터 반환
    await Future.delayed(Duration(seconds: 2));
    return [
      Coupon(
        couponId: 'coupon1',
        storeId: 'store1',
        category: 'cate1',
        couponTitle: 'Coupon Title1 : 체험 1회 무료',
        couponDetail: 'Coupon detail1 : 체험 1회 무료',
        createdDate: DateTime.now(),
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 30)),
      ),
      Coupon(
        couponId: 'coupon2',
        storeId: 'store2',
        category: 'cate1',
        couponTitle: 'Coupon Title2 : 음료수 1병 무료',
        couponDetail: 'Coupon detail2 : 음료수 1병 무료',
        createdDate: DateTime.now(),
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 365)),
      ),
      Coupon(
        couponId: 'coupon3',
        storeId: 'store3',
        category: 'cate4',
        couponTitle: 'Coupon Title1 : 락커 1달 무료 이용',
        couponDetail: 'Coupon detail1 : 락커 1달 무료 이용',
        createdDate: DateTime.now(),
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 60)),
      ),
      Coupon(
        couponId: 'coupon4',
        storeId: 'store1',
        category: 'cate4',
        couponTitle: 'Coupon Title1 : 전신마사지 10% 할인',
        couponDetail: 'Coupon detail1 : 전신마사지 10% 할인',
        createdDate: DateTime.now(),
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 90)),
      ),
      Coupon(
        couponId: 'coupon5',
        storeId: 'store5',
        category: 'cate3',
        couponTitle: 'Coupon Title1 : 음료수 1병 무료',
        couponDetail: 'Coupon detail1 : 음료수 1병 무료',
        createdDate: DateTime.now(),
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 60)),
      ),
    ];
  }

  // (홈, 쿠폰/소식) 최신 소식 목록
  Future<List<Coupon>> getCurrentCouponList() async {

    List<Coupon> sortedCoupons = await getAllCoupons();
    sortedCoupons.sort((a, b) =>
        b.createdDate.compareTo(a.createdDate));
    return sortedCoupons;
  }

  // (쿠폰/소식) 소식 > 카테고리 검색
  Future<List<Coupon>> getSearchedCouponList(String category) async {

    List<Coupon> _coupons = await getAllCoupons();
    List<Coupon> searchedCoupons = [];
    for(var coupon in _coupons){
      if(coupon.category == category){
        searchedCoupons.add(coupon);
      }
    }
    return searchedCoupons;
  }
}