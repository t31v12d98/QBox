import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewProfile extends StatelessWidget {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Color.fromARGB(221, 243, 243, 243),
    foregroundColor: Color.fromARGB(221, 243, 243, 243),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 5.5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );
  final ButtonStyle flatButtonStyle2 = TextButton.styleFrom(
    padding: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    foregroundColor: Color.fromARGB(249, 19, 18, 18),
    backgroundColor: Color.fromARGB(255, 231, 225, 225),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(""),
                    ),
                    Positioned(
                      right: -12,
                      bottom: 0,
                      child: SizedBox(
                        height: 43,
                        width: 43,
                        child: TextButton(
                          style: flatButtonStyle,
                          onPressed: () {},
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextButton(
                    style: flatButtonStyle2,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_circle_outlined,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("My Account")),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextButton(
                    style: flatButtonStyle2,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("Notification")),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextButton(
                    style: flatButtonStyle2,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline_sharp,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("Mentor Accest")),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextButton(
                    style: flatButtonStyle2,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("Help Center")),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextButton(
                    style: flatButtonStyle2,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("Log out")),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
