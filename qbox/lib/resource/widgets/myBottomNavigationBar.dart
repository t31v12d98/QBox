import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qbox/main.dart';
import 'package:qbox/resource/home.dart';
import 'package:qbox/resource/testing.dart';
import 'package:qbox/resource/testingAPI.dart';

class myBottomNavigationBar extends StatefulWidget {
  const myBottomNavigationBar({super.key});

  @override
  State<myBottomNavigationBar> createState() => _myBottomNavigationBarState();
}

class _myBottomNavigationBarState extends State<myBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), TestingAPI(), testingApp()];

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
                label: 'Mentor',
                backgroundColor: Color(0xFF4C53A5)),
          ]),
    );
  }
}
