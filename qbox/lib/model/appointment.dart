class Appointment {
  String? nameMentor;
  String? major;
  int? beginTime;
  int? endTime;
  String? status;
  String? imgMentor;
  String? id;

  Appointment(
      {this.nameMentor,
      this.major,
      this.beginTime,
      this.endTime,
      this.status,
      this.imgMentor,
      this.id});

  Appointment.fromJson(Map<String, dynamic> json) {
    nameMentor = json['nameMentor'];
    major = json['major'];
    beginTime = json['beginTime'];
    endTime = json['endTime'];
    status = json['status'];
    imgMentor = json['imgMentor'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameMentor'] = this.nameMentor;
    data['major'] = this.major;
    data['beginTime'] = this.beginTime;
    data['endTime'] = this.endTime;
    data['status'] = this.status;
    data['imgMentor'] = this.imgMentor;
    data['id'] = this.id;
    return data;
  }
}
