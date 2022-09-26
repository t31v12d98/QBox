import 'package:flutter/material.dart';
import 'package:qbox/page/testing.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Login();
  }
}

class _Login extends State<Login> {
  bool _showPass = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final String _userNameErr = 'Username ko hợp lệ !';
  final String _passwordErr = 'Password ko hợp lệ !';
  bool _userInvalid = false;
  bool _passInvalid = false;

  @override
  Widget build(BuildContext context) {
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
              child: TextField(
                controller: _userController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "USERNAME",
                    errorText: _userInvalid ? _userNameErr : null,
                    labelStyle:
                        TextStyle(color: Color(0xff888888), fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                    controller: _passController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                        labelText: "PASSWORD",
                        errorText: _passInvalid ? _passwordErr : null,
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15)),
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
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      // validate input
      if (_userController.text.isEmpty) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }

      if (_passController.text.isEmpty) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }

      //code flow login ở đây
      if (!_userInvalid && !_passInvalid) {
        Navigator.push(context, MaterialPageRoute(builder: gotoTesting));
      }
    });
  }

  Widget gotoTesting(BuildContext context) {
    return MyApp(); // trang testing
  }
}
