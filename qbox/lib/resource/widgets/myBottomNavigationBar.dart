import 'package:flutter/material.dart';
import 'package:qbox/resource/homePage.dart';
import 'package:qbox/resource/listRequestView.dart';
import 'package:qbox/resource/testingAPIPage.dart';
import 'package:qbox/resource/viewProfile.dart';

class myBottomNavigationBar extends StatefulWidget {
  int role;
  myBottomNavigationBar({Key? mykey, required this.role}) : super(key: mykey);
  @override
  State<myBottomNavigationBar> createState() => _myBottomNavigationBarState();
}

class _myBottomNavigationBarState extends State<myBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ViewProfile(),
    ListRequestView(),
    ViewProfile()
  ];

  @override
  Widget build(BuildContext context) {
    print("đây là role được truyền qua ${widget.role}");

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() {
                _currentIndex = index;
              }),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Color(0xFF4C53A5)),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Appointment',
                backgroundColor: Color(0xFF4C53A5)),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: 'Profile',
                backgroundColor: Color(0xFF4C53A5)),
          ]),
    );
  }
}
