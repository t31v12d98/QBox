import 'package:qbox/model/appointment.dart';

abstract class Repository {
  //get
  Future<List<Appointment>> getAppointmentList();
  //patch
  Future<String> patchComplete(Appointment appointment);
  //put
  Future<String> putComplete(Appointment appointment);
  //delete
  Future<String> deleteTodo(Appointment appointment);
  //post
  Future<String> postTodo(Appointment appointment);
}
