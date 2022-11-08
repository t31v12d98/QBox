import 'package:http/http.dart' as http;
import 'package:qbox/model/appointment.dart';
import 'package:qbox/model/repository.dart';
import 'dart:convert';

class TodoRepository implements Repository {
  //url
  String dataURL = 'https://636a595ec07d8f936d9b1708.mockapi.io/appointment';

  @override
  Future<List<Appointment>> getAppointmentList() async {
    // TODO: implement getTodoList
    List<Appointment> appointmentList = [];
    var url = Uri.parse('$dataURL');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);
    // parse
    for (var i = 0; i < body.length; i++) {
      appointmentList.add(Appointment.fromJson(body[i]));
    }
    return appointmentList;
  }

  @override
  Future<String> patchComplete(Appointment appointment) {
    // TODO: implement patchComplete
    throw UnimplementedError();
  }

  @override
  Future<String> postTodo(Appointment appointment) {
    // TODO: implement postTodo
    throw UnimplementedError();
  }

  @override
  Future<String> putComplete(Appointment appointment) {
    // TODO: implement putComplete
    throw UnimplementedError();
  }

  @override
  Future<String> deleteTodo(Appointment appointment) async {
    // TODO: implement deleteTodo
    print('${appointment.toJson()}');
    var url = Uri.parse('$dataURL');
    var result = '';
    var response = await http.post(url, body: appointment.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }
}
