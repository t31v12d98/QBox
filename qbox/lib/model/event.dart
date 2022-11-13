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

  static Event formJson(Map<String, dynamic> json) => Event(
      title: json['major'],
      description: '',
      form: json['beginTime'],
      to: json['endTime'],
      mentorName: json['nameMentor']);
}
