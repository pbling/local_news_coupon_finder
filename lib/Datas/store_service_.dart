import 'dart:async';

import 'models.dart';

class StoreNewService {
  static final StoreNewService _storeService = StoreNewService._internal();
  factory StoreNewService() => _storeService;
  StoreNewService._internal();

  List<Store> _stores = [];

  Future<List<Store>> getAllStores() async {
    // 2s 뒤에 데이터 반환
    await Future.delayed(Duration(seconds: 2));
    return [
      Store(
        storeId: 'store1',
        storeImage: '음식점',
        category: '레스토랑',
        subCategory: '한식',
        phoneNumber: '032-999-9999',
        address: '경기도 용인시 수지구 동천동 100',
        addressPos: PlacePos(latitude: 37.506932467450326, longitude: 127.05578661133796),
        storeDetail: StoreDetail(
          storeImages: ['store1', 'store2'],
          timeSchedule: [
            Schedule(day: '월', time: '08:00 ~ 18:00'),
            Schedule(day: '화', time: '08:00 ~ 18:00'),
            Schedule(day: '수', time: '08:00 ~ 18:00'),
            Schedule(day: '목', time: '08:00 ~ 18:00'),
            Schedule(day: '금', time: '08:00 ~ 18:00'),
            Schedule(day: '토', time: '휴무'),
            Schedule(day: '일', time: '휴무'),

          ],
          homepageUrl: 'http://www.naver.com',
          menuList: [
            Menu(menuName: 'menu1', menuPrice: '10,000'),
            Menu(menuName: 'menu2', menuPrice: '12,000'),
            Menu(menuName: 'menu3', menuPrice: '11,000'),
            Menu(menuName: 'menu4', menuPrice: '12,000'),
            Menu(menuName: 'menu5', menuPrice: '16,000'),
          ],
          menuImages: ['menu1', 'menu2'],
          // 편의시설 및 서비스에 대한 정보도 설정할 수 있습니다.
          isReservationService: true,
          isWifi: true,
        ),
        createdDate: DateTime.now(),
      ),
      Store(
        storeId: 'store2',
        storeImage: '카페',
        category: '카페',
        subCategory: '카페',
        phoneNumber: '032-999-9999',
        address: '경기도 용인시 수지구 동천동 100',
        addressPos: PlacePos(latitude: 37.500932467450326, longitude: 127.05578661133796),
        storeDetail: StoreDetail(
          storeImages: ['store1', 'store2'],
          timeSchedule: [
            Schedule(day: '월', time: '08:00 ~ 18:00'),
            Schedule(day: '화', time: '08:00 ~ 18:00'),
            Schedule(day: '수', time: '08:00 ~ 18:00'),
            Schedule(day: '목', time: '08:00 ~ 18:00'),
            Schedule(day: '금', time: '08:00 ~ 18:00'),
            Schedule(day: '토', time: '휴무'),
            Schedule(day: '일', time: '휴무'),

          ],
          homepageUrl: 'http://www.naver.com',
          menuList: [
            Menu(menuName: 'menu1', menuPrice: '10,000'),
            Menu(menuName: 'menu2', menuPrice: '12,000'),
            Menu(menuName: 'menu3', menuPrice: '11,000'),
            Menu(menuName: 'menu4', menuPrice: '12,000'),
            Menu(menuName: 'menu5', menuPrice: '16,000'),
          ],
          menuImages: ['menu1', 'menu2'],
          // 편의시설 및 서비스에 대한 정보도 설정할 수 있습니다.
          isReservationService: true,
          isWifi: true,
        ),
        createdDate: DateTime.now(),
      ),
      Store(
        storeId: 'store3',
        storeImage: '미용실',
        category: '뷰티',
        subCategory: '미용실',
        phoneNumber: '032-999-9999',
        address: '경기도 용인시 수지구 동천동 100',
        addressPos: PlacePos(latitude: 37.506932467450326, longitude: 127.00578661133796),
        storeDetail: StoreDetail(
          storeImages: ['store1', 'store2'],
          timeSchedule: [
            Schedule(day: '월', time: '08:00 ~ 18:00'),
            Schedule(day: '화', time: '08:00 ~ 18:00'),
            Schedule(day: '수', time: '08:00 ~ 18:00'),
            Schedule(day: '목', time: '08:00 ~ 18:00'),
            Schedule(day: '금', time: '08:00 ~ 18:00'),
            Schedule(day: '토', time: '휴무'),
            Schedule(day: '일', time: '휴무'),

          ],
          homepageUrl: 'http://www.naver.com',
          menuList: [
            Menu(menuName: 'menu1', menuPrice: '10,000'),
            Menu(menuName: 'menu2', menuPrice: '12,000'),
            Menu(menuName: 'menu3', menuPrice: '11,000'),
            Menu(menuName: 'menu4', menuPrice: '12,000'),
            Menu(menuName: 'menu5', menuPrice: '16,000'),
          ],
          menuImages: ['menu1', 'menu2'],
          // 편의시설 및 서비스에 대한 정보도 설정할 수 있습니다.
          isReservationService: true,
          isWifi: true,
        ),
        createdDate: DateTime.now(),
      ),
      Store(
        storeId: 'store4',
        storeImage: '종합학원',
        category: '아이교육',
        subCategory: '종합학원',
        phoneNumber: '032-999-9999',
        address: '경기도 용인시 수지구 동천동 100',
        addressPos: PlacePos(latitude: 36.506932467450326, longitude: 127.05578661133796),
        storeDetail: StoreDetail(
          storeImages: ['store1', 'store2'],
          timeSchedule: [
            Schedule(day: '월', time: '08:00 ~ 18:00'),
            Schedule(day: '화', time: '08:00 ~ 18:00'),
            Schedule(day: '수', time: '08:00 ~ 18:00'),
            Schedule(day: '목', time: '08:00 ~ 18:00'),
            Schedule(day: '금', time: '08:00 ~ 18:00'),
            Schedule(day: '토', time: '휴무'),
            Schedule(day: '일', time: '휴무'),

          ],
          homepageUrl: 'http://www.naver.com',
          menuList: [
            Menu(menuName: 'menu1', menuPrice: '10,000'),
            Menu(menuName: 'menu2', menuPrice: '12,000'),
            Menu(menuName: 'menu3', menuPrice: '11,000'),
            Menu(menuName: 'menu4', menuPrice: '12,000'),
            Menu(menuName: 'menu5', menuPrice: '16,000'),
          ],
          menuImages: ['menu1', 'menu2'],
          // 편의시설 및 서비스에 대한 정보도 설정할 수 있습니다.
          isReservationService: true,
          isWifi: true,
        ),
        createdDate: DateTime.now(),
      ),
      Store(
        storeId: 'store5',
        storeImage: '미술학원',
        category: '아이교육',
        subCategory: '미술',
        phoneNumber: '032-999-9999',
        address: '경기도 용인시 수지구 동천동 100',
        addressPos: PlacePos(latitude: 37.306632467450326, longitude: 127.05578661133796),
        storeDetail: StoreDetail(
          storeImages: ['store1', 'store2'],
          timeSchedule: [
            Schedule(day: '월', time: '08:00 ~ 18:00'),
            Schedule(day: '화', time: '08:00 ~ 18:00'),
            Schedule(day: '수', time: '08:00 ~ 18:00'),
            Schedule(day: '목', time: '08:00 ~ 18:00'),
            Schedule(day: '금', time: '08:00 ~ 18:00'),
            Schedule(day: '토', time: '휴무'),
            Schedule(day: '일', time: '휴무'),

          ],
          homepageUrl: 'http://www.naver.com',
          menuList: [
            Menu(menuName: 'menu1', menuPrice: '10,000'),
            Menu(menuName: 'menu2', menuPrice: '12,000'),
            Menu(menuName: 'menu3', menuPrice: '11,000'),
            Menu(menuName: 'menu4', menuPrice: '12,000'),
            Menu(menuName: 'menu5', menuPrice: '16,000'),
          ],
          menuImages: ['menu1', 'menu2'],
          // 편의시설 및 서비스에 대한 정보도 설정할 수 있습니다.
          isReservationService: true,
          isWifi: true,
        ),
        createdDate: DateTime.parse("2024-01-01"),
      ),
      Store(
        storeId: 'store6',
        storeImage: '피부과',
        category: '병원/약국',
        subCategory: '피부과',
        phoneNumber: '032-999-9999',
        address: '경기도 용인시 수지구 동천동 100',
        addressPos: PlacePos(latitude: 37.506032467450326, longitude: 127.00578661133796),
        storeDetail: StoreDetail(
          storeImages: ['store1', 'store2'],
          timeSchedule: [
          ],
          homepageUrl: 'http://www.naver.com',
          menuList: [
          ],
          menuImages: ['menu1', 'menu2'],
          // 편의시설 및 서비스에 대한 정보도 설정할 수 있습니다.
          isReservationService: true,
          isWifi: true,
        ),
        createdDate: DateTime.parse("2024-03-10"),
      ),
      Store(
        storeId: 'store7',
        storeImage: '내과',
        category: '병원/약국',
        subCategory: '내과',
        phoneNumber: '032-999-9999',
        address: '경기도 용인시 수지구 동천동 100',
        addressPos: PlacePos(latitude: 37.006932467450326, longitude: 127.05578661133796),
        storeDetail: StoreDetail(
          storeImages: ['store1', 'store2'],
          timeSchedule: [
            Schedule(day: '월', time: '08:00 ~ 18:00'),
            Schedule(day: '화', time: '08:00 ~ 18:00'),
            Schedule(day: '수', time: '08:00 ~ 18:00'),
          ],
          homepageUrl: 'http://www.naver.com',
          menuList: [
            Menu(menuName: 'menu1', menuPrice: '10,000'),
          ],
          menuImages: ['menu1', 'menu2'],
          // 편의시설 및 서비스에 대한 정보도 설정할 수 있습니다.
          isReservationService: true,
          isWifi: true,
        ),
        createdDate: DateTime.parse("2024-02-10"),
      ),
      Store(
        storeId: 'store8',
        storeImage: '부동산',
        category: '서비스',
        subCategory: '부동산',
        phoneNumber: '032-999-9999',
        address: '경기도 용인시 수지구 동천동 100',
        addressPos: PlacePos(latitude: 37.506932467450326, longitude: 125.05578661133796),
        storeDetail: StoreDetail(
          storeImages: ['store1', 'store2'],
          timeSchedule: [
            Schedule(day: '월', time: '08:00 ~ 18:00'),
          ],
          homepageUrl: 'http://www.naver.com',
          menuList: [
            Menu(menuName: 'menu1', menuPrice: '10,000'),
            Menu(menuName: 'menu2', menuPrice: '12,000'),
            Menu(menuName: 'menu3', menuPrice: '11,000'),
          ],
          menuImages: ['menu1', 'menu2'],
          // 편의시설 및 서비스에 대한 정보도 설정할 수 있습니다.
          isReservationService: true,
          isWifi: true,
        ),
        createdDate: DateTime.parse("2024-01-09"),
      ),
      Store(
        storeId: 'store9',
        storeImage: '피트니스',
        category: '운동',
        subCategory: '피트니스',
        phoneNumber: '032-999-9999',
        address: '경기도 용인시 수지구 동천동 100',
        addressPos: PlacePos(latitude: 37.506932467450326, longitude: 123.05578661133796),
        storeDetail: StoreDetail(
          storeImages: ['store1', 'store2'],
          timeSchedule: [
            Schedule(day: '월', time: '08:00 ~ 18:00'),
            Schedule(day: '화', time: '08:00 ~ 18:00'),
            Schedule(day: '수', time: '08:00 ~ 18:00'),
          ],
          homepageUrl: 'http://www.naver.com',
          menuList: [
            Menu(menuName: 'menu1', menuPrice: '10,000'),
            Menu(menuName: 'menu2', menuPrice: '12,000'),
            Menu(menuName: 'menu3', menuPrice: '11,000'),
            Menu(menuName: 'menu4', menuPrice: '12,000'),
            Menu(menuName: 'menu5', menuPrice: '16,000'),
            Menu(menuName: 'menu6', menuPrice: '11,000'),
            Menu(menuName: 'menu7', menuPrice: '12,000'),
          ],
          menuImages: ['menu1', 'menu2'],
          // 편의시설 및 서비스에 대한 정보도 설정할 수 있습니다.
          isReservationService: true,
          isWifi: true,
        ),
        createdDate: DateTime.parse("2024-01-10"),
      ),
      Store(
        storeId: 'store10',
        storeImage: '피부관리샵',
        category: '뷰티',
        subCategory: '피부관리',
        phoneNumber: '032-999-9999',
        address: '경기도 용인시 수지구 동천동 100',
        addressPos: PlacePos(latitude: 36.506932467450326, longitude: 127.05578661133796),
        storeDetail: StoreDetail(
          storeImages: ['store1', 'store2'],
          timeSchedule: [
          ],
          homepageUrl: 'http://www.naver.com',
          menuList: [
            Menu(menuName: 'menu1', menuPrice: '10,000'),
            Menu(menuName: 'menu2', menuPrice: '12,000'),
            Menu(menuName: 'menu5', menuPrice: '16,000'),
          ],
          menuImages: ['menu1', 'menu2'],
          // 편의시설 및 서비스에 대한 정보도 설정할 수 있습니다.
          isReservationService: true,
          isWifi: true,
        ),
        createdDate: DateTime.now(),
      ),
      // 더 많은 상점 데이터를 추가할 수 있습니다.
    ];
  }

  Future<List<Store>> getCurrentStoreList() async {
    List<Store> sortedStores = await getAllStores();
    sortedStores.sort((a, b) => b.createdDate.compareTo(a.createdDate)); // 예시로 ID로 역순 정렬합니다.

    print('getCurrentStoreList');
    print(_stores);
    return sortedStores;
  }

  Future<List<Store>> getCouponStores() async {
    List<Store> _stores = await getAllStores();
    List<Store> couponStores = _stores.where((store) => store.availableCouponNumber > 0).toList();
    return couponStores;
  }

  Future<List<Store>> getNewsStores() async {
    List<Store> _stores = await getAllStores();
    List<Store> newsStores = _stores.where((store) => store.availableCouponNumber > 0).toList();
    return newsStores;
  }

  Future<List<Store>> getCategoryFilteredStores(String category) async {
    List<Store> _stores = await getAllStores();
    List<Store> categoryFilteredStores = _stores.where((store) => store.category == category).toList();
    return categoryFilteredStores;
  }

  Future<String> getSearchedStore(String storeIdInfo) async {
    List<Store> _stores = await getAllStores();
    Store? searchedStore = null;
    String category = '';

    for(var i =0; i<_stores.length ; i++){
      if(_stores[i].storeId == storeIdInfo)
      {
        category = _stores[i].category;
      }
    }
    return category;
  }

  // 키워드 검색 결과 반환 (키워드 포함 여부 체크 - 상점명, 카테고리, 서브카테고리, 폰번호)
  Future<List<Store>> getKeywordSearchedStoreList(String searchKeyword) async {
    List<Store> _stores = await getAllStores();
    List<Store> searchedStoreList = [];

    print('searchKeyword : ' + searchKeyword);
    for (var store in _stores) {
      if (store.storeId.toLowerCase().contains(searchKeyword) ||
          store.category.toLowerCase().contains(searchKeyword) ||
          store.subCategory.toLowerCase().contains(searchKeyword) ||
          store.phoneNumber.toLowerCase().contains(searchKeyword)) {
        searchedStoreList.add(store);
      }
    }
    print('search result' + searchedStoreList.length.toString());
    return searchedStoreList;
  }
}

