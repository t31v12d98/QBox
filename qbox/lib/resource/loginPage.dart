import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qbox/blocs/login_bloc.dart';
import 'package:qbox/repository/user_repositoty.dart';
import 'package:qbox/resource/widgets/myBottomNavigationBar.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<LoginPage> {
  LoginBloc bloc = new LoginBloc();
  int role = 0;
  bool _showPass = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  dispose();

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();
    // userRepository.createUserWithEmailAndPassword(
    //     't31v12d98@gmail.com', '123456');
    // TODO: implement build
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffd8d8d8),
              ),
              child: FlutterLogo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: Text(
              "Hello\nWelcome Back",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: StreamBuilder(
                  stream: bloc.userStream,
                  builder: (context, snapshot) => TextField(
                        controller: _userController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "USERNAME",
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelStyle: TextStyle(
                                color: Color(0xff888888), fontSize: 15)),
                      ))),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                StreamBuilder(
                  stream: bloc.passStream,
                  builder: (context, snapshot) => TextField(
                    controller: _passController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                        labelText: "PASSWORD",
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15)),
                  ),
                ),
                GestureDetector(
                  onTap: onToggleShowPass,
                  child: Text(
                    _showPass ? 'HIDE' : 'SHOW',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                  onPressed: onSignInClicked,
                  child: Text("SIGN IN",
                      style: TextStyle(color: Colors.white, fontSize: 16)))),
          Container(
            height: 130,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "NEW USER? SIGN UP",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Text(
                    "FORGOT PASSWORD?",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  )
                ]),
          ),
          Container(
            width: 200,
            height: 200,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      userRepository.signInWithGoogle();
                      // Timer(Duration(seconds: 3), () {
                      //   nhaytrang();
                      // });
                    },
                    child: const Image(
                        width: 100,
                        image: AssetImage('images/Google_logo.png'))),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    if (bloc.isValidInfor(_userController.text, _passController.text)) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => myBottomNavigationBar(
                    role: this.role,
                  )));
      //context, MaterialPageRoute(builder: (context) => myBottomNavigationBar(role)));
    }
  }
}
