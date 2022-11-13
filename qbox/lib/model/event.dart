import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime form;
  final DateTime to;
  final String mentorName;
  final Color backgroudColor;

  const Event(
      {required this.title,
      required this.description,
      required this.form,
      required this.to,
      required this.mentorName,
      this.backgroudColor = Colors.lightGreen});

  @override
  String toString() =>
      'title: $title ; descrip: $description ; form: $form ; to: $to';

  static Event formJson(Map<String, dynamic> json) {
    return Event(
        title: json['major'],
        description: '',
        form: DateTime.parse(json['beginTime']),
        to: DateTime.parse(json['endTime']),
        mentorName: json['nameMentor']);
  }
}
