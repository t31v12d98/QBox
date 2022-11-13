import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:qbox/model/event.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  Stream<List<Event>> readAppointment() => FirebaseFirestore.instance
      .collection('apointments')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Event.formJson(doc.data())).toList());

  void getList() {
    readAppointment().listen((listOfEvent) {
      for (Event myEvent in listOfEvent) {
        _events.add(myEvent);
      }
      print('đây là list event: $_events.toString()');
    });
  }

  List<Event> get events {
    getList();
    return _events;
  }

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;
  void setDate(DateTime date) => _selectedDate = date;
  List<Event> get eventOfSelectedDate => _events;

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }

  void editEvent(Event newEvent, Event oldEvent) {
    final index = _events.indexOf(oldEvent);
    _events[index] = newEvent;
    notifyListeners();
  }

  void deleteEvent(Event event) {
    _events.remove(event);
    notifyListeners();
  }
}
