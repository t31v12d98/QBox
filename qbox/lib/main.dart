import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox/repository/user_repositoty.dart';
import 'package:qbox/resource/loginPage.dart';
import 'package:qbox/resource/provider/event_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  // Widget build(BuildContext context) => ChangeNotifierProvider(
  //     create: (context) => EventProvider(),
  //     child: MaterialApp(home: LoginPage()));

  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: UserRepository().handleAuthState(),
    );
  }
}
