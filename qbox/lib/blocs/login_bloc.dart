import 'dart:async';
import 'package:qbox/validaters/validations.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfor(String username, String password) {
    if (!Validations.isValidUser(username)) {
      _userController.sink.addError("user ko hợp lê !");
      return false;
    }
    _userController.sink.add("OK");
    if (!Validations.isValidPass(password)) {
      _passController.sink.addError("pass ko hợp lê !");
      return false;
    }
    _passController.sink.add("OK");
    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}
