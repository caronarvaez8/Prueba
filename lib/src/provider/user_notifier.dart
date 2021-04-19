import 'dart:collection';
import 'package:app/src/api/api_url.dart';
import 'package:app/src/models/users.dart';
import 'package:flutter/cupertino.dart';

class UserNotifier with ChangeNotifier {
  List<User> _userList = [];

  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);

  addUser(User user) {
    _userList.add(user);
    notifyListeners();
  }

  removeUser(index) {
    _userList.removeWhere((_user) => _user.name == userList[index].name);
    notifyListeners();
  }

  listUser() {
    getUser().then((value) {
      _userList.addAll(value);
      notifyListeners();
    }).catchError((onError) {
      print(onError);
    });
  }
}
