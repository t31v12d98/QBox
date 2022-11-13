import 'package:cloud_firestore/cloud_firestore.dart';

class Slots {
  // String id;
  final String beginTime;
  final String endTime;
  final String major;
  final String nameMentor;
  final String status;

  Slots(
      {
      // required this.id,
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
