import 'package:http/http.dart' as http;
import 'package:qbox/model/repository.dart';
import 'dart:convert';

import 'package:qbox/model/todo.dart';

class TodoRepository implements Repository {
  //url
  String dataURL = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<Todo>> getTodoList() async {
    // TODO: implement getTodoList
    List<Todo> todoList = [];
    var url = Uri.parse('$dataURL/todos');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);
    // parse
    for (var i = 0; i < body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
  }

  @override
  Future<String> patchComplete(Todo todo) {
    // TODO: implement patchComplete
    throw UnimplementedError();
  }

  @override
  Future<String> postTodo(Todo todo) {
    // TODO: implement postTodo
    throw UnimplementedError();
  }

  @override
  Future<String> putComplete(Todo todo) {
    // TODO: implement putComplete
    throw UnimplementedError();
  }

  @override
  Future<String> deleteTodo(Todo todo) async {
    // TODO: implement deleteTodo
    print('${todo.toJson()}');
    var url = Uri.parse('$dataURL/todos');
    var result = '';
    var response = await http.post(url, body: todo.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }
}
