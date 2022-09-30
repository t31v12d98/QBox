import 'package:flutter/material.dart';

class testingApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _testingApp();
  }
}

class _testingApp extends State<testingApp> {
  double _fistNumber = 0;
  final fistNumberEdittingController = TextEditingController();
  double _secondNumber = 0;
  final seconNumberEdittingController = TextEditingController();

  String Result = "Tí nữa kết quả hiện ở đây !";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "this is my app",
      home: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                Text(
                  Result,
                  style: TextStyle(fontSize: 30),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'fist Number'),
                  controller: fistNumberEdittingController,
                  onChanged: (text) {
                    setState(() {
                      _fistNumber = double.tryParse(text) ?? 0;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Second Number'),
                  controller: seconNumberEdittingController,
                  onChanged: (text) {
                    setState(() {
                      _secondNumber = double.tryParse(text) ?? 0;
                    });
                  },
                ),
                TextButton(
                    onPressed: () {
                      // ấn nút sẽ chạy code ở đây
                      setState(() {
                        double temp = _fistNumber + _secondNumber;
                        Result = temp.toString();
                      });
                    },
                    child: Text('Phím cộng')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
