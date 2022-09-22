import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "this is my app",
      home: Scaffold(
        body: Center(
          child: Column(
            children: const [
              Text('testing'),
              TextField(),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
