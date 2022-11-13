import 'package:flutter/material.dart';
import 'package:qbox/resource/widgets/AppointmentWidget.dart';
import 'package:qbox/resource/widgets/myAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(children: [
        MyAppBar(title: "home page", icon: Icons.hotel_class_outlined),
        Container(
            height: 500,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here...",
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.search,
                          size: 27,
                          color: Color(0xFF4C53A5),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Text(
                      "Next Appointment",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    ),
                  ),

                  // Appointment list
                  AppointmentWidgets(),
                ],
              ),
            )),
      ]),
      // Bootom bar
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //         backgroundColor: Color(0xFF4C53A5)),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.list_alt),
      //         label: 'Appointment',
      //         backgroundColor: Color(0xFF4C53A5)),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.rowing_outlined),
      //         label: 'Mentor',
      //         backgroundColor: Color(0xFF4C53A5)),
      //   ],
      //   currentIndex: _currentIndex,
      // onTap: (index) => setState(() {
      //   _currentIndex = index;
      // }),
      // ),
    );
  }
}
