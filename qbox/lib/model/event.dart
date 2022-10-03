import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime form;
  final DateTime to;
  final Color backgroudColor;

  const Event(
      {required this.title,
      required this.description,
      required this.form,
      required this.to,
      this.backgroudColor = Colors.lightGreen});

  @override
  String toString() =>
      'title: $title ; descrip: $description ; form: $form ; to: $to';
}
