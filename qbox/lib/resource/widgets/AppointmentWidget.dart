import 'dart:ffi';

import 'package:flutter/material.dart';

class AppointmentWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppointmentWidgets();
  }
}

class _AppointmentWidgets extends State<AppointmentWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 1; i < 5; i++)
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: null,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/1.png'),
                            minRadius: 30,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "Name mentor",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text("Main Major")
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Begin",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("18 : 00 PM"), Text("30/09/2022")],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: null, child: Text("Enroll"))
                ],
              )
            ],
          ),
        ),
    ]);
  }
}
