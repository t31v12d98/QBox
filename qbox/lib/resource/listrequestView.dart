import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qbox/model/appointment.dart';
import 'package:qbox/model/appointment_controller.dart';
import 'package:qbox/model/appointment_repository.dart';

class ListRequestView extends StatelessWidget {
  const ListRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    var appointmentController = AppointmentController(TodoRepository());

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Appointment'),
        ),
        body: StreamBuilder<List<Slots>>(
          stream: readSlots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('error'),
              );
            }
            if (snapshot.hasData) {
              final slots = snapshot.data!;
              return ListView.builder(
                  itemCount: slots.length,
                  itemBuilder: (context, index) {
                    final users = slots[index];
                    List<String> timebg = users.beginTime.split('.');
                    List<String> timebg2 = timebg.elementAt(0).split(':');
                    String timebg3 =
                        timebg2.elementAt(0) + ':' + timebg2.elementAt(1);
                    List<String> timeed = users.endTime.split('.');
                    List<String> timeed2 = timebg.elementAt(0).split(':');
                    String timeed3 =
                        timebg2.elementAt(0) + ':' + timebg2.elementAt(1);
                    int avatar = Random().nextInt(5) + 5;
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
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
                                        backgroundImage:
                                            AssetImage('images/${avatar}.jpg'),
                                        minRadius: 30,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${users.nameMentor}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Major: ${users.major}")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Begin Time:"),
                                Text("${timebg3}")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("End Time:"), Text("${timeed3}")],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: null, child: Text("Enroll"))
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
            ;
          },
        ));
  }

  Container buildCallContainer(String title, Color color) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      child: Center(child: Text(title)),
    );
  }

  Stream<List<Slots>> readSlots() => FirebaseFirestore.instance
      .collection('apointments')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Slots.fromJson(doc.data())).toList());
}

class Slots {
  // String id;
  final String beginTime;
  final String endTime;
  final String major;
  final String nameMentor;
  final String status;

  Slots(
      {
      // this.id = '',
      required this.beginTime,
      required this.endTime,
      required this.major,
      required this.nameMentor,
      required this.status});

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'beginTime': beginTime,
        'endTime': endTime,
        'major': major,
        'nameMentor': nameMentor,
        'status': status,
      };

  static Slots fromJson(Map<String, dynamic> json) => Slots(
      // id: json['id'],
      beginTime: json['beginTime'],
      endTime: json['endTime'],
      major: json['major'],
      nameMentor: json['nameMentor'],
      status: json['status']);
}
