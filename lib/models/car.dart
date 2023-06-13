class Car {
  int? id;
  late String nombre;
  late int fecha;
  late int km;
  late String tipo;
  late String combustible;
  late String averia;
  late String seguro;
  late String equipamiento;
  late String concepto;
  late int cantidad;

  Car(
      {this.id,
      required this.nombre,
      required this.fecha,
      required this.km,
      required this.tipo,
      required this.combustible,
      required this.averia,
      required this.seguro,
      required this.equipamiento,
      required this.concepto,
      required this.cantidad});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'fecha': fecha,
      'km': km,
      'tipo': tipo,
      'combustible': combustible,
      'averia': averia,
      'seguro': seguro,
      'equipamiento': equipamiento,
      'concepto': concepto,
      'cantidad': cantidad
    };
  }

  Car.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nombre = map['nombre'];
    fecha = map['fecha'];
    km = map['km'];
    tipo = map['tipo'];
    combustible = map['combustible'];
    averia = map['averia'];
    seguro = map['seguro'];
    equipamiento = map['equipamiento'];
    concepto = map['concepto'];
    cantidad = map['cantidad'];
  }
}
