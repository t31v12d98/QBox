import 'package:flutter/material.dart';
import 'package:qbox/resource/widgets/myAppBar.dart';

class ProfileMentor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileMentor();
  }
}

class _ProfileMentor extends State<ProfileMentor> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: [
          MyAppBar(
            title: 'Profile Mentor',
            icon: Icons.arrow_back_ios_new,
          ),
        ],
      ),
    );
  }
}
