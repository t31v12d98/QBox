import 'package:flutter/material.dart';
import 'package:qbox/page/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: Login());
  }
}
