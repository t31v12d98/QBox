import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qbox/main.dart';
import 'package:qbox/resource/homePage.dart';
import 'package:qbox/resource/mentorPage.dart';
import 'package:qbox/resource/testingPage.dart';
import 'package:qbox/resource/testingAPIPage.dart';
import 'package:qbox/resource/viewProfile.dart';

class myBottomNavigationBar extends StatefulWidget {
  const myBottomNavigationBar({super.key});

  @override
  State<myBottomNavigationBar> createState() => _myBottomNavigationBarState();
}

class _myBottomNavigationBarState extends State<myBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomePage(), TestingAPI(), ViewProfile()];

  @override
  Widget build(BuildContext context) {
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
                icon: Icon(Icons.rowing_outlined),
                label: 'Profile',
                backgroundColor: Color(0xFF4C53A5)),
          ]),
    );
  }
}
