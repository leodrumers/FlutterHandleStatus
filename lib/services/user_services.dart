import 'package:flutter/foundation.dart';
import 'package:managing_flutter_status/models/user.dart';

class UserService with ChangeNotifier {
  User _user;

  User get user => _user;
  bool get userExist => _user != null;

  set user(User user) {
    this._user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    this._user.age = age;
    notifyListeners();
  }

  void deleteUser() {
    this._user = null;
    notifyListeners();
  }

  void addProfession() {
    this._user.professions.add('Profession ${_user.professions.length + 1}');
    notifyListeners();
  }
}
