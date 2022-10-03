import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qbox/resource/eventEditingPage.dart';
import 'package:qbox/resource/widgets/calendarWidget.dart';
import 'package:qbox/resource/widgets/myAppBar.dart';

class mentorPage extends StatefulWidget {
  const mentorPage({super.key});

  @override
  State<mentorPage> createState() => _mentorPageState();
}

class _mentorPageState extends State<mentorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MyAppBar(title: "Mentor Page", icon: Icons.hotel_class_outlined),
          Container(
            height: 500,
            child: CalendarWidget(),
          ),
          FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventEditingPage())),
          )
        ],
      ),
    );
  }
}
