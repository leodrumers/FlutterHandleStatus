import 'dart:async';

import 'package:managing_flutter_status/models/user.dart';

class _UserService {
  User _user;
  StreamController<User> _streamController = StreamController<User>.broadcast();

  User get user => this._user;
  Stream<User> get streamController => _streamController.stream;
  bool get userExist => this._user != null;

  void setUser(User user) {
    this._user = user;
    this._streamController.add(user);
  }

  void setAge(int age) {
    this._user.age = age;
    _streamController.add(this.user);
  }

  void dispose() => _streamController?.close();
}

final userService = _UserService();
