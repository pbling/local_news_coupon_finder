// category model 클래스 선언
class Category {
  late String categoryName;
  late String iconUrl;
  late bool simpleSearch;
  late List<String> subCategoryName;

  Category({
    required this.categoryName,
    required this.iconUrl,
    required this.simpleSearch,
    required this.subCategoryName,
  });
}


// coupon model 클래스 선언
class Coupon {
  late String couponId;
  late String storeId;
  late String category;
  late String couponTitle;
  late String couponDetail;
  late DateTime createdDate;
  late DateTime startDate;
  late DateTime endDate;

  Coupon({
    required this.couponId,
    required this.storeId,
    required this.category,
    required this.couponTitle,
    required this.couponDetail,
    required this.createdDate,
    required this.startDate,
    required this.endDate
  });
}

// event model 클래스 선언
class Event {
  late String eventId;
  late String eventBannerImage;
  late String eventDetail;
  late DateTime createdDate;
  late List<String> eventImages;

  Event({
    required this.eventId,
    required this.eventBannerImage,
    required this.eventDetail,
    required this.createdDate,
    eventImages = const [],
  });
}

// menu model 클래스 선언
class Menu {
  late String menuName;
  late String menuPrice;

  Menu({
    required this.menuName,
    required this.menuPrice,
  });
}

// schedule model 클래스 선언
class Schedule {
  late String day;
  late String time;

  Schedule({
    required this.day,
    required this.time,
  });
}

// story model 클래스 선언
class Story {
  late String storyId;
  late String storeId;
  late String category;
  late String storyTitle;
  late String storyDetail;
  late DateTime createdDate;
  late List<String> storyImages;

  Story({
    required this.storyId,
    required this.storeId,
    required this.category,
    required this.storyTitle,
    required this.storyDetail,
    required this.createdDate,
    required this.storyImages,
  });
}


// news model 클래스 선언
class News {
  late String newsId;
  late String storeId;
  late String category;
  late String newsTitle;
  late String newsDetail;
  late DateTime createdDate;
  late List<String> newsImages;

  News({
    required this.newsId,
    required this.storeId,
    required this.category,
    required this.newsTitle,
    required this.newsDetail,
    required this.createdDate,
    required this.newsImages,
  });
}


class StoreDetail {
  late String storeId;
  // storeId로 Store모델에서 이름, 카테고리, 좋아요, 위치, 대표전화 출력
  // storeId로 Coupon모델에서 쿠폰 목록 출력

  // 상점 이미지
  late List<String> storeImages;

  // 영업시간 (월~일, list:7)
  late List<Schedule> timeSchedule;

  // 대표홈페이지
  late String homepageUrl;

  // 메뉴, 가격
  late List<Menu> menuList;

  // 메뉴 이미지
  late List<String> menuImages;

  // 편의시설 및 서비스
  late bool isReservationService;
  late bool isPackagingService;
  late bool isWifi;
  late bool isKidsPlace;
  late bool isGroupRoom;
  late bool isMeetingRoom;
  late bool isLocker;
  late bool isPetTogetherService;

  // 주차장 여부
  late bool isParkingLot;

  StoreDetail({
    required this.storeImages,
    required this.timeSchedule,
    required this.homepageUrl,
    required this.menuList,
    required this.menuImages,

    isReservationService = false,
    isPackagingService = false,
    isWifi = false,
    isKidsPlace = false,
    isGroupRoom = false,
    isMeetingRoom = false,
    isLocker = false,
    isPetTogetherService = false,

    isParkingLot = false,
  });
}

class PlacePos {
  late double latitude;
  late double longitude;

  PlacePos({
    required this.latitude,
    required this.longitude,
  });
}

class Store {
  late String storeId;
  late String storeImage;
  late String category;
  late String subCategory;
  late String phoneNumber;
  late String address;
  late PlacePos addressPos;
  late StoreDetail storeDetail;
  late DateTime createdDate;
  late int favoriteNumber;
  late int availableCouponNumber;
  late int newsNumber;

  Store({
    required this.storeId,
    required this.storeImage,
    required this.category,
    required this.subCategory,
    required this.phoneNumber,
    required this.address,
    required this.addressPos,
    required this.storeDetail,
    required this.createdDate,
    favoriteNumber = 0,
    availableCouponNumber = 0,
    newsNumber = 0,
  });
}

class User{
  late String userId;
  late String nickname;
  late String phoneNumber;
  late String address;
  late DateTime createdDate;
  late List<Coupon> downloadedCoupons;
  late List<Coupon> usedCoupons;
  late List<Store> savedFavoriteStores;

  User({
    required this.userId,
    required this.nickname,
    required this.phoneNumber,
    required this.address,
    required this.createdDate,
    downloadedCoupons = const [],
    usedCoupons = const [],
    savedFavoriteStores = const [],
  });
}



// coupon, news 공통 model 클래스 선언
class CouponNews {
  late String storeId;
  late String couponId;
  late String newsId;
  late String category;
  late String createdDate;
  late String title;
  late String detail;
  late String imageUrl;
  late DateTime? startDate;
  late DateTime? endDate;

  CouponNews({
    required this.storeId,
    this.couponId = '',
    this.newsId = '',
    required this.category,
    required this.createdDate,
    required this.title,
    required this.detail,
    this.imageUrl = '',
    this.startDate,
    this.endDate,
  });
}

class LocationPos {
  double x;
  double y;

  LocationPos(this.x, this.y);
}