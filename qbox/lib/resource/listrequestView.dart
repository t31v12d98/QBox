import 'package:flutter/material.dart';

import 'package:qbox/model/todo.dart';
import 'package:qbox/model/todo_controller.dart';
import 'package:qbox/model/todo_repository.dart';
import 'package:qbox/resource/widgets/calendarWidget.dart';

class ListRequestView extends StatelessWidget {
  const ListRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    var todoController = TodoController(TodoRepository());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Request List'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: todoController.fetchTodoList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          }
          return buildBodyContent(snapshot, todoController);
        },
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //     Todo todo = Todo(
      //         idSlot: '123', timeEnd: '123', timeStart: '1111', completed: false);
      //     todoController.postTodo(todo);
      // }),
    );
  }

  SafeArea buildBodyContent(
      AsyncSnapshot<List<Todo>> snapshot, TodoController todoController) {
    return SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              var todo = snapshot.data?[index];
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
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    '${todo?.id}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Main Major")
                                ],
                              ),
                            )
                          ],
                        ),
                        // Container(
                        //   padding: EdgeInsets.all(5),
                        //   decoration: BoxDecoration(
                        //     color: Colors.green[400],
                        //     borderRadius: BorderRadius.circular(20),
                        //   ),
                        //   child: Text(
                        //     "Begin",
                        //     style: TextStyle(
                        //         fontSize: 14,
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Start Time"),
                          Text("18 : 00 PM"),
                          Text("30/09/2022")
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("End Time  "),
                          Text("18 : 00 PM"),
                          Text("30/09/2022")
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(onPressed: () {}, child: Text("Cancel")),
                        ElevatedButton(
                            onPressed: () => CalendarWidget(),
                            child: Text("Detail"))
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