class EmployeeModel {
  int id;
  String nombre;
  String apellidos;
  String telefono;
  String correo;
  String direccion;

  EmployeeModel({
    this.id,
    this.nombre,
    this.apellidos,
    this.telefono,
    this.correo,
    this.direccion,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        telefono: json["telefono"],
        correo: json["correo"],
        direccion: json["direccion"],
      );

  List<EmployeeModel> fromJsonList(List employees) =>
      employees.map((emp) => EmployeeModel.fromJson(emp)).toList();

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "telefono": telefono,
        "correo": correo,
        "direccion": direccion,
      };
}
