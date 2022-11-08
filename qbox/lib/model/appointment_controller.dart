import 'package:qbox/model/appointment.dart';
import 'package:qbox/model/repository.dart';

class AppointmentController {
  final Repository _repository;

  AppointmentController(this._repository);

  //get

  Future<List<Appointment>> fetchTodoList() async {
    return _repository.getAppointmentList();
  }

  //patch

  Future<String> updatePatchCompleted(Appointment appointment) async {
    return _repository.patchComplete(appointment);
  }

  //put

  Future<String> updatePutCompleted(Appointment appointment) async {
    return _repository.putComplete(appointment);
  }

  // delete

  Future<String> deleteCompleted(Appointment appointment) async {
    return _repository.deleteTodo(appointment);
  }

  //post

  Future<String> postTodo(Appointment todo) async {
    return _repository.postTodo(todo);
  }
}
