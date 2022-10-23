import 'package:qbox/model/todo.dart';

abstract class Repository {
  //get
  Future<List<Todo>> getTodoList();
  //patch
  Future<String> patchComplete(Todo todo);
  //put
  Future<String> putComplete(Todo todo);
  //delete
  Future<String> deleteTodo(Todo todo);
  //post
  Future<String> postTodo(Todo todo);
}
