import 'dart:async';
import 'models.dart';

class NewsNewService {
  static final NewsNewService _newsService = NewsNewService._internal();

  factory NewsNewService() => _newsService;

  NewsNewService._internal();

  List<News> _newses = [];

  Future<List<News>> getAllNewses() async {
    return [
      News(
        newsId: 'news1',
        storeId: 'store1',
        category: '레스토랑',
        newsTitle: '33데이! 삼겹살 먹는날! 이벤트 진행 🐷🐽🐷🐽🐷33데이! 삼겹살 먹는날! 이벤트 진행 🐷🐽🐷🐽🐷33데이! 삼겹살 먹는날! 이벤트 진행 🐷🐽🐷🐽🐷',
        newsDetail: '오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷오늘은 삼겹살 데이인 3월 3일입니다! 이벤트 진행중이니 많은 방문 부탁드립니다!!🐷🐽🐷',
        createdDate: DateTime.now(),
        newsImages: ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      News(
        newsId: 'news2',
        storeId: 'store2',
        category: '디저트',
        newsTitle: 'SALE 🎉하이볼 출시기념 5,000원 할인 이벤트',
        newsDetail: '안녕하세요 명륜진사갈비 용인강남대점 입니다.\n\n 신메뉴 짐빔하이볼 & 피치트리하이볼🍹 출시를 기념해 \n\n 6,500원 → 5,000원으로 가격 할인 이벤트를 진행합니다! \n 명륜진사갈비에서 더욱 다양해진 고기와 함께 \n 부담없는 가격으로 마음껏 즐겨보세요😄',
        createdDate: DateTime.now(),
        newsImages: ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      News(
        newsId: 'news3',
        storeId: 'store3',
        category: '식료품',
        newsTitle: '오픈 특가 🎉 피부과 오픈 특가 이벤트',
        newsDetail: 'news detail3 : 업체 이벤트에 대한 내용을 소개합니다.',
        createdDate: DateTime.now(),
        newsImages: ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      News(
        newsId: 'news4',
        storeId: 'store4',
        category: '상점',
        newsTitle: '봄맞이 할인 행사하고 있어요.',
        newsDetail: 'news detail4 : 업체 이벤트에 대한 내용을 소개합니다.',
        createdDate: DateTime.now(),
        newsImages: ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      News(
        newsId: 'news5',
        storeId: 'store5',
        category: '뷰티',
        newsTitle: '1회 체험 무료 이벤트 행사',
        newsDetail: 'news detail5 : 업체 이벤트에 대한 내용을 소개합니다.',
        createdDate: DateTime.now(),
        newsImages: ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      News(
        newsId: 'news5',
        storeId: 'store1',
        category: '레스토랑',
        newsTitle: '1회 체험 무료 이벤트 행사',
        newsDetail: 'news detail5 : 업체 이벤트에 대한 내용을 소개합니다.',
        createdDate: DateTime.now(),
        newsImages: ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      News(
        newsId: 'news5',
        storeId: 'store2',
        category: '디저트',
        newsTitle: '1회 체험 무료 이벤트 행사',
        newsDetail: 'news detail5 : 업체 이벤트에 대한 내용을 소개합니다.',
        createdDate: DateTime.now(),
        newsImages: ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
    ];
  }

  // (홈, 쿠폰/소식) 최신 소식 목록
  Future<List<News>> getCurrentNewsList() async {
    List<News> sortedNewses = await getAllNewses();
    sortedNewses.sort((a, b) =>
        b.createdDate.compareTo(a.createdDate)); // 예시로 ID로 역순 정렬합니다.
    return sortedNewses;
  }

  Future<List<News>> getNewsListByStore(String storeId) async {
    print('getNewsListByStore : ' + storeId);
    List<News> _newses = await getAllNewses();
    List<News> searchedNewses = [];
    for(var news in _newses){
      if(news.storeId == storeId){
        searchedNewses.add(news);
      }
    }
    print(searchedNewses);
    return searchedNewses;
  }

  // (쿠폰/소식) 소식 > 카테고리 검색
  Future<List<News>> getNewsListByCategory(String category) async {
    print('getNewsListByCategory : ' + category);
    List<News> _newses = await getAllNewses();
    List<News> searchedNewses = [];
    for(var news in _newses){
      if(news.category == category){
        searchedNewses.add(news);
      }
    }
    print(searchedNewses);
    return searchedNewses;
  }
}