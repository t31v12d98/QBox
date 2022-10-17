import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox/resource/loginPage.dart';
import 'package:qbox/resource/mentorPage.dart';
import 'package:qbox/resource/provider/event_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(home: LoginPage()));
}
