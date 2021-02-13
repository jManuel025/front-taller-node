class Employees {
  List<Employee> employees = [];
  Employees();
  Employees.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    employees = jsonList.map((emp) => new Employee.fromJson(emp)).toList();
  }
}

class Employee {
  int id;
  String nombre;
  String apellidos;
  String telefono;
  String correo;
  String direccion;

  Employee({
    this.id,
    this.nombre,
    this.apellidos,
    this.telefono,
    this.correo,
    this.direccion,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        telefono: json["telefono"],
        correo: json["correo"],
        direccion: json["direccion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "telefono": telefono,
        "correo": correo,
        "direccion": direccion,
      };
}
