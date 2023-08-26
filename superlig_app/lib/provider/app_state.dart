import 'package:flutter/material.dart';
import 'package:superlig_app/models/user.dart';

class AppState with ChangeNotifier {
  String email = "";
  String username = "";
  bool isLoggedIn = false;

  List<User> availableUsers = [
    User(
      username: "test1",
      email: "test1@test.com",
      password: "1234567",
    ),
    User(
      username: "test1",
      email: "test1@test.com",
      password: "1234567",
    ),
    User(
      username: "test1",
      email: "test1@test.com",
      password: "1234567",
    ),
    User(
      username: "test1",
      email: "test1@test.com",
      password: "1234567",
    )
  ];

  login(String email, String password) {
    var availableUserIndex =
        availableUsers.indexWhere((element) => element.email == email);

    if (availableUserIndex == -1) {
      return "Kullanıcı bulunamadı.";
    }

    if (availableUsers[availableUserIndex].password != password) {
      return "Şifre hatalı";
    }

    this.email = availableUsers[availableUserIndex].email;
    username = availableUsers[availableUserIndex].username;
    isLoggedIn = true;
    notifyListeners();
    return true;
  }

  logout() {
    username = email = "";
    isLoggedIn = false;
    notifyListeners();
  }

  signup(String email, String username, String password) {
    var availableUserMailIndex =
        availableUsers.indexWhere((element) => element.email == email);
    var availableUserNameIndex =
        availableUsers.indexWhere((element) => element.username == username);

    if (availableUserMailIndex != -1) {
      return "Bu mail adresi ile başka bir kullanıcı var.";
    }

    if (availableUserNameIndex != -1) {
      return "Bu kullanıcı adı ile başka bir kullanıcı var.";
    }

    var newUser = User(
      username: username,
      email: email,
      password: password,
    );

    availableUsers.add(newUser);
    this.email = email;
    this.username = username;
    isLoggedIn = true;
    notifyListeners();
    return true;
  }
}
