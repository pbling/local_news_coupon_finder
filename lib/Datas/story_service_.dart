import 'dart:async';
import 'models.dart';

class StoryNewService {
  static final StoryNewService _newsService = StoryNewService._internal();

  factory StoryNewService() => _newsService;

  StoryNewService._internal();

  List<Story> _stories = [];

  Future<List<Story>> getAllStories() async {
    // 2s 뒤에 데이터 반환
    await Future.delayed(Duration(seconds: 0));
    return [
      Story(
        storyId: 'story1',
        storeId: 'store1',
        category: 'cate1',
        storyTitle : '50년 전통을 이어온 중국집 역사를 소개합니다.',
        storyDetail: '50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다.50년 전통을 이어온 중국집 역사를 소개합니다.',
        createdDate : DateTime.now(),
        storyImages : ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      Story(
        storyId: 'story1',
        storeId: 'store1',
        category: 'cate1',
        storyTitle : '50년 전통을 이어온 중국집 역사를 소개합니다.',
        storyDetail: '50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다.50년 전통을 이어온 중국집 역사를 소개합니다.',
        createdDate : DateTime.now(),
        storyImages : ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      Story(
        storyId: 'story1',
        storeId: 'store1',
        category: 'cate1',
        storyTitle : '50년 전통을 이어온 중국집 역사를 소개합니다.',
        storyDetail: '50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다.50년 전통을 이어온 중국집 역사를 소개합니다.',
        createdDate : DateTime.now(),
        storyImages : ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      Story(
        storyId: 'story1',
        storeId: 'store1',
        category: 'cate1',
        storyTitle : '50년 전통을 이어온 중국집 역사를 소개합니다.',
        storyDetail: '50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다.50년 전통을 이어온 중국집 역사를 소개합니다.',
        createdDate : DateTime.now(),
        storyImages : ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      Story(
        storyId: 'story1',
        storeId: 'store1',
        category: 'cate1',
        storyTitle : '50년 전통을 이어온 중국집 역사를 소개합니다.',
        storyDetail: '50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다.50년 전통을 이어온 중국집 역사를 소개합니다.',
        createdDate : DateTime.now(),
        storyImages : ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      Story(
        storyId: 'story1',
        storeId: 'store1',
        category: 'cate1',
        storyTitle : '50년 전통을 이어온 중국집 역사를 소개합니다.',
        storyDetail: '50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다.50년 전통을 이어온 중국집 역사를 소개합니다.',
        createdDate : DateTime.now(),
        storyImages : ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
      Story(
        storyId: 'story1',
        storeId: 'store1',
        category: 'cate1',
        storyTitle : '50년 전통을 이어온 중국집 역사를 소개합니다.',
        storyDetail: '50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다. 50년 전통을 이어온 중국집 역사를 소개합니다.50년 전통을 이어온 중국집 역사를 소개합니다.',
        createdDate : DateTime.now(),
        storyImages : ['news1', 'news2', 'news3', 'news4', 'news5'],
      ),
    ];
  }

  // (홈, 쿠폰/소식) 최신 소식 목록
  Future<List<Story>> getCurrentStoryList() async {
    List<Story> sortedStories = await getAllStories();
    sortedStories.sort((a, b) =>
        b.createdDate.compareTo(a.createdDate)); // 예시로 ID로 역순 정렬합니다.
    return sortedStories;
  }
}