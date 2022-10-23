import 'package:qbox/model/repository.dart';
import 'package:qbox/model/todo.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);

  //get

  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }

  //patch

  Future<String> updatePatchCompleted(Todo todo) async {
    return _repository.patchComplete(todo);
  }

  //put

  Future<String> updatePutCompleted(Todo todo) async {
    return _repository.putComplete(todo);
  }

  // delete

  Future<String> deleteCompleted(Todo todo) async {
    return _repository.deleteTodo(todo);
  }

  //post

  Future<String> postTodo(Todo todo) async {
    return _repository.postTodo(todo);
  }
}
