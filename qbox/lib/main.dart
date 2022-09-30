import 'package:flutter/material.dart';
import 'package:qbox/resource/home.dart';
import 'package:qbox/resource/login.dart';
import 'package:qbox/resource/profileMentor.dart';
import 'package:qbox/resource/testingAPI.dart';
import 'package:qbox/resource/widgets/myBottomNavigationBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
