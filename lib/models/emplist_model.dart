import 'package:network_get_post_put_del/models/emp_model.dart';

class Emplist {
  String status;
  String message;
  List<Employee> data;

  Emplist.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data =
            List<Employee>.from(json["data"].map((x) => Employee.fromJson(x)));

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
