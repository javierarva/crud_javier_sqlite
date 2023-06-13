import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../db/database_helper.dart';
import '../models/car.dart';

class UpdateCarScreen extends StatefulWidget {
  final Car car;

  const UpdateCarScreen({Key? key, required this.car}) : super(key: key);

  @override
  State<UpdateCarScreen> createState() => _UpdateCarScreenState();
}

class _UpdateCarScreenState extends State<UpdateCarScreen> {
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

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar Gasto de Coche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: widget.car.nombre,
                  decoration: const InputDecoration(hintText: 'Nombre del coche'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Has de introducir el nombre del coche.';
                    }

                    nombre = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.car.fecha.toString(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Fecha'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Has de introducir la fecha solo con números y sin espacios.';
                    }

                    fecha = int.parse(value);
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.car.km.toString(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Kilómetros recorridos'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Has de introducir el número de kilómetros recorridos solo con números.';
                    }

                    km = int.parse(value);
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.car.tipo,
                  decoration: const InputDecoration(hintText: 'Tipo de gasto'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Has de introducir el tipo de gasto.';
                    }

                    tipo = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.car.combustible,
                  decoration: const InputDecoration(hintText: 'Combustible del coche'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Has de introducir el combustible del coche.';
                    }

                    combustible = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.car.averia,
                  decoration: const InputDecoration(hintText: 'Avería del coche'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Has de introducir la avería del coche.';
                    }

                    averia = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.car.seguro,
                  decoration: const InputDecoration(hintText: 'Seguro del coche'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Has de introducir el seguro del coche.';
                    }

                    seguro = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.car.equipamiento,
                  decoration: const InputDecoration(hintText: 'Equipamiento del coche'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Has de introducir el equipamiento del coche.';
                    }

                    equipamiento = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.car.concepto,
                  decoration: const InputDecoration(hintText: 'Concepto'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Has de introducir un concepto.';
                    }

                    concepto = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.car.cantidad.toString(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Cantidad'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Has de introducir una cantidad solo con números.';
                    }

                    cantidad = int.parse(value);
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var car = Car(
                            id: widget.car.id,
                            nombre: nombre,
                            fecha: fecha,
                            km: km,
                            tipo: tipo,
                            combustible: combustible,
                            averia: averia,
                            seguro: seguro,
                            equipamiento: equipamiento,
                            concepto: concepto,
                            cantidad: cantidad);

                        var dbHelper = DatabaseHelper.instance;
                        int result = await dbHelper.updateCar(car);

                        if (result > 0) {
                          Fluttertoast.showToast(msg: 'Registro Actualizado');
                          Navigator.pop(context, 'Hecho');
                        } else {
                          Fluttertoast.showToast(msg: 'El registro no ha podido ser actualizado o no se ha cambiado nada');
                        }
                      }
                    },
                    child: const Text('Actualizar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
