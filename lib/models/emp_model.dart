class Employee {
  int id;
  String employee_name;
  int employee_salary;
  int employee_age;
  // imageni String qilganimda olmadi
  Null employee_image;

  Employee.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        employee_name = json['employee_name'],
        employee_salary = json['employee_salary'],
        employee_age = json['employee_age'],
        employee_image = json['employee_image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'employee_salary': employee_salary,
        'employee_age': employee_age,
        'employee_image': employee_image,
      };
}
