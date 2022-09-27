import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  String title;
  IconData icon;
  MyAppBar({required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(children: [
        Icon(
          icon,
          size: 22,
          color: Color(0xFF4C53A5),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),
          ),
        ),
        Spacer(),
        Badge(
          badgeColor: Colors.red,
          padding: EdgeInsets.all(7),
          badgeContent: Text("0"),
          child: InkWell(
            onTap: () {
              print("sẽ qua trang thông báo !!!");
            },
            child: Icon(
              Icons.notifications,
              size: 35,
              color: Color(0xFF4C53A5),
            ),
          ),
        )
      ]),
    );
  }
}
