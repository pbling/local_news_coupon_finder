import 'models.dart';


class CategoryNewService {
  static final CategoryNewService _categoryService = CategoryNewService._internal();
  factory CategoryNewService() => _categoryService;
  CategoryNewService._internal();

  Future<List<Category>> getAllCategories() async {
    return [
      Category(
          categoryName: '상점',
          iconUrl: 'assets/images/category/store.png',
          simpleSearch: true,
          subCategoryName: ['가전/가구', '간판', '귀금속', '꽃집', '도장', '떡집', '반찬', '기타']),
      Category(
          categoryName: '음식점',
          iconUrl: 'assets/images/category/food.jpg',
          simpleSearch: true,
          subCategoryName: ['한식', '중식', '일식', '양식', '분식', '횟집', '치킨', '패스트푸드', '술집', '기타']),
      Category(
          categoryName: '카페',
          iconUrl: 'assets/images/category/cafe.png',
          simpleSearch: true,
          subCategoryName: ['커피/음료', '베이커리', '키즈카페', '스터디카페', '애견카페', '기타']),
      Category(
          categoryName: '식료품',
          iconUrl: 'assets/images/category/market.png',
          simpleSearch: false,
          subCategoryName: ['마트/편의점', '야채/과일', '정육점', '유기농', '농수산물', '건강식품', '기타']),
      Category(
          categoryName: '병원·약국',
          iconUrl: 'assets/images/category/care.png',
          simpleSearch: true,
          subCategoryName:  ['재활·통증', '내과', '외과', '비뇨기과', '산부인과', '치과', '안과', '한의원', '약국', '기타']),
      Category(
          categoryName: '뷰티',
          iconUrl: 'assets/images/category/beauty.png',
          simpleSearch: false,
          subCategoryName: ['미용실', '네일', '속눈썹', '피부관리', '마사지', '메이크업', '두피·탈모', '기타']),
      Category(
          categoryName: '운동',
          iconUrl: 'assets/images/category/fitness.png',
          simpleSearch: true,
          subCategoryName:  ['헬스장', '필라테스·요가', '태권도', '리듬체조·발레', '축구', '골프', '수영', '기타']),
      Category(
          categoryName: '학원·교육',
          iconUrl: 'assets/images/category/education.png',
          simpleSearch: false,
          subCategoryName: ['종합학원', '외국어', '수학', '과학', '국어·논술', '예체능', '토플·토익', '기타']),
      Category(
          categoryName: '부동산',
          iconUrl: 'assets/images/category/service.png',
          simpleSearch: true,
          subCategoryName: ['아파트/빌라', '상가/주택', '펜션/건물', '기타']),
      Category(
          categoryName: '이사·퀵',
          iconUrl: 'assets/images/category/service.png',
          simpleSearch: true,
          subCategoryName: ['포장이사', '원룸이사', '용달·화물', '퀵서비스', '기타']),
      Category(
          categoryName: '인테리어',
          iconUrl: 'assets/images/category/service.png',
          simpleSearch: true,
          subCategoryName: ['인테리어', '에어컨', '주택수리', '전기공사', '유리·샷시', '도배/장판', '욕조·타일', '보일러·설비', '블라인드·커텐', '철물점', '기타']),
      Category(
          categoryName: '숙박·여행',
          iconUrl: 'assets/images/category/service.png',
          simpleSearch: true,
          subCategoryName: ['호텔·숙박', '렌트카', '골프장', '여행사', '투어버스', '기타']),
      Category(
          categoryName: '취미생활',
          iconUrl: 'assets/images/category/hobby.png',
          simpleSearch: true,
          subCategoryName:  ['악기', '보컬', '외국어', '미술', '요리', '댄스', '기타']),
      Category(
          categoryName: '반려동물',
          iconUrl: 'assets/images/category/hobby.png',
          simpleSearch: true,
          subCategoryName:  ['동물병원', '애견분양', '장례식장', '애견호텔', '유치원', '기타']),
      Category(
          categoryName: '광고·인쇄',
          iconUrl: 'assets/images/category/care.png',
          simpleSearch: true,
          subCategoryName:  ['버스광고', '지하철광고', '온라인광고', '인쇄', '판촉물', '현수막·배너', '기타']),
    ];
  }
// (홈, 쿠폰/소식) 최신 소식 목록
  Future<List<Category>> getAllCategortList() async {
    List<Category> _categories = await getAllCategories();
    return _categories;
  }

  Future<List<String>> getAllCategoryNames() async {
    List<Category> _categories = await getAllCategories();
    List<String> cateNames = [];
    for(var category in _categories) {
      cateNames.add(category.categoryName);
    }
    return cateNames;
  }

  // (홈) 간단 카테고리 검색 목록
  Future<List<Category>> getSimpleCategoryList() async {
    List<Category> _categories = await getAllCategories();
    List<Category> simpleCategories = [];
    for (var category in _categories) {
      if (category.simpleSearch == true) {
        simpleCategories.add(category);
      }
    }
    return simpleCategories;
  }
}