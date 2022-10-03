import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox/model/event.dart';
import 'package:qbox/resource/eventEditingPage.dart';
import 'package:qbox/resource/provider/event_provider.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => EventEditingPage(event: event),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final provider =
                  Provider.of<EventProvider>(context, listen: false);
              provider.deleteEvent(event);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [Text('Show du lieu even: $event ra day')],
      ),
    );
  }
}
