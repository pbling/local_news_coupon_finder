import 'models.dart';


class EventNewService {
  static final EventNewService _eventService = EventNewService._internal();
  factory EventNewService() => _eventService;
  EventNewService._internal();

  List<Event> _events = [];

  Future<List<Event>> getAllEvents() async {
    return [
      Event(
          eventId: 'event1',
          eventBannerImage: 'assets/images/event/event1.png',
          eventDetail: 'event1_detail',
          createdDate: DateTime.now()),
      Event(eventId: 'event2',
          eventBannerImage: 'assets/images/event/event2.png',
          eventDetail: 'event1_detail',
          createdDate: DateTime.now()),
      Event(eventId: 'event3',
          eventBannerImage: 'assets/images/event/event3.png',
          eventDetail: 'event1_detail',
          createdDate: DateTime.now()),
      Event(eventId: 'event4',
          eventBannerImage: 'assets/images/event/event4.png',
          eventDetail: 'event1_detail',
          createdDate: DateTime.now()),
    ];
  }

  // (홈) 최신 이벤트 목록
  Future<List<Event>> getCurrentEventList() async {
    List<Event> sortedEvents = await getAllEvents();
    sortedEvents.sort((a, b) =>
        b.createdDate.compareTo(a.createdDate));
    return sortedEvents;
  }
}