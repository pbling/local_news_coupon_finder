import 'models.dart';

class UserService {

  // 회원가입 - 회원등록, 유효성 검사 필요 등
  void createNewUser(String id, String nick, String phone, String address,
      DateTime day) {
    User newUser = User(
        userId: id,
        nickname: nick,
        phoneNumber: phone,
        address: address,
        createdDate: day,
    );
    // DB에 저장
  }

  // 현재 회원정보 가져오기
  User getCurrentUser() {
    User currentUser;
    currentUser = User(
      userId: 'star123',
      nickname: 'bling123',
      phoneNumber: '01011112222',
      address: '',
      createdDate: DateTime.now(),
    );
    return currentUser;
  }
}
