const ID = 'id';
const PACIENTE = 'paciente';
const STATUS = 'status';
const DATA = 'data';

class Exam {
  int id;
  String paciente;
  String status;
  String data;

  Exam(
      {required this.id,
      required this.paciente,
      required this.status,
      required this.data});

  Exam.fromJson(Map<String, dynamic> json)
      : id = json[ID],
        paciente = json[PACIENTE],
        status = json[STATUS],
        data = json[DATA];

  Map<String, dynamic> toJson() {
    return {ID: id, PACIENTE: paciente, STATUS: status, DATA: data};
  }
}
