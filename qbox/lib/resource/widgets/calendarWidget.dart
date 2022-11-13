import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox/model/event.dart';
import 'package:qbox/model/getdata.dart';
import 'package:qbox/resource/provider/event_provider.dart';
import 'package:qbox/resource/widgets/taskWidget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../model/eventDataSource.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() {
    return _CalendarWidgetState();
  }
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    List<Event> events = Provider.of<EventProvider>(context).events;

    return Scaffold(
      body: StreamBuilder<List<Event>>(
        stream: getApponitment(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final events = snapshot.data!;
            return SfCalendar(
              view: CalendarView.month,
              dataSource: EventDataSource(events),
              initialSelectedDate: DateTime.now(),
              onLongPress: (detail) {
                final provider =
                    Provider.of<EventProvider>(context, listen: false);
                provider.setDate(detail.date!);
                showModalBottomSheet(
                    context: context, builder: (context) => TaskWidget());
              },
            );
          } else {
            return Text("Something erorr");
          }
        },
      ),
    );
  }

  Stream<List<Event>> getApponitment() => FirebaseFirestore.instance
      .collection('apointments')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Event.formJson(doc.data())).toList());
}
