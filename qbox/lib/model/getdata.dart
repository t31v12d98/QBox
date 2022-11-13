import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qbox/model/event.dart';

class Data {
  Data();

  static List<Event> listApointmet = [];
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('apointments');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print('đây là data $allData');
    listApointmet = allData.cast<Event>();
  }

  List<Event> getListApointmet() {
    getData();
    return listApointmet;

  }
}
