import 'package:flutter/material.dart';
import 'package:qbox/resource/homePage.dart';
import 'package:qbox/resource/mentorPage.dart';
import 'package:qbox/resource/testingAPIPage.dart';
import 'package:qbox/resource/viewProfile.dart';

class myBottomNavigationBarMentor extends StatefulWidget {
  int role;
  myBottomNavigationBarMentor({Key? mykey, required this.role})
      : super(key: mykey);
  @override
  State<myBottomNavigationBarMentor> createState() =>
      _myBottomNavigationBarMentorState();
}

class _myBottomNavigationBarMentorState
    extends State<myBottomNavigationBarMentor> {
  int _currentIndex = 0;
  final List<Widget> _children = [mentorPage(), TestingAPI(), ViewProfile()];

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
