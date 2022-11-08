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
        body: FutureBuilder<List<Appointment>>(
          future: appointmentController.fetchTodoList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('error'),
              );
            }
            return buildBodyContent(snapshot, appointmentController);
          },
        ));
  }

  SafeArea buildBodyContent(AsyncSnapshot<List<Appointment>> snapshot,
      AppointmentController appointmentController) {
    return SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              var appointment = snapshot.data?[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                                  backgroundImage: AssetImage('images/1.png'),
                                  minRadius: 30,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    "${appointment?.nameMentor}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("${appointment?.major}")
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
                            "${appointment?.status}",
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
                        children: [
                          Text("BEGIN 18 : 00 PM"),
                          Text("30/09/2022")
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("END 18 : 00 PM"), Text("30/09/2022")],
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
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 0.5,
                height: 0.5,
              );
            },
            itemCount: snapshot.data?.length ?? 0));
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
}
