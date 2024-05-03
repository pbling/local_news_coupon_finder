import 'models.dart';


class CategoryNewService {
  static final CategoryNewService _categoryService = CategoryNewService._internal();
  factory CategoryNewService() => _categoryService;
  CategoryNewService._internal();

  Future<List<Category>> getAllCategories() async {
    // 2s 뒤에 데이터 반환
    await Future.delayed(Duration(seconds: 2));
    return [
      Category(
          categoryName: '레스토랑',
          iconUrl: 'assets/images/category/food.jpg',
          simpleSearch: true,
          subCategoryName: ['한식', '중식', '양식', '아시안', '분식', '치킨', '해산물', '패스트푸드', '술집', '도시락', '기타']),
      Category(
          categoryName: '카페',
          iconUrl: 'assets/images/category/cafe.png',
          simpleSearch: true,
          subCategoryName: ['카페', '베이커리', '떡', '키즈카페', '애견카페', '스터디카페', '기타']),
      Category(
          categoryName: '식료품',
          iconUrl: 'assets/images/category/market.png',
          simpleSearch: false,
          subCategoryName: ['대형마트','편의점', '야채', '과일', '반찬', '정육점', '유기농', '건강식품', '기타']),
      Category(
          categoryName: '상점',
          iconUrl: 'assets/images/category/store.png',
          simpleSearch: true,
          subCategoryName: ['의류/신발', '가전/가구', '화장품', '도서', '육아', '인테리어', '꽃', '세탁소', '기타']),
      Category(
          categoryName: '뷰티',
          iconUrl: 'assets/images/category/beauty.png',
          simpleSearch: false,
          subCategoryName: ['미용실', '네일', '속눈썹', '피부관리', '마사지', '메이크업', '기타']),
      Category(
          categoryName: '병원/약국',
          iconUrl: 'assets/images/category/care.png',
          simpleSearch: true,
          subCategoryName:  ['약국', '피부과', '성형외과', '내과', '치과', '안과', '비뇨기과', '산부인과', '기타']),
      Category(
          categoryName: '서비스',
          iconUrl: 'assets/images/category/service.png',
          simpleSearch: true,
          subCategoryName: ['인테리어', '수리/설치', '이사/용달', '부동산', '위생관리', '노래방', '기타']),
      Category(
          categoryName: '운동',
          iconUrl: 'assets/images/category/fitness.png',
          simpleSearch: true,
          subCategoryName:  ['헬스장', '필라테스/요가', '태권도', '리듬체조/발레', '축구', '골프', '수영', '기타']),
      Category(
          categoryName: '아이교육',
          iconUrl: 'assets/images/category/education.png',
          simpleSearch: false,
          subCategoryName: ['종합학원', '외국어', '수학', '과학', '국어/논술', '예체능', '어린이집', '유치원', '기타']),
      Category(
          categoryName: '취미생활',
          iconUrl: 'assets/images/category/hobby.png',
          simpleSearch: true,
          subCategoryName:  ['악기', '보컬', '외국어', '미술', '요리', '댄스', '기타']),
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