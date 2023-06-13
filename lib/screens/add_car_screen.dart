import 'package:crud_javier/db/database_helper.dart';
import 'package:crud_javier/models/car.dart';
import 'package:crud_javier/screens/car_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
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
        title: const Text('Añadir Gastos de Coche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Nombre del coche'),
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
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: 'Kilómetros recorridos'),
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
                  decoration:
                      const InputDecoration(hintText: 'Combustible del coche'),
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
                  decoration:
                      const InputDecoration(hintText: 'Avería del coche'),
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
                  decoration:
                      const InputDecoration(hintText: 'Seguro del coche'),
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
                  decoration:
                      const InputDecoration(hintText: 'Equipamiento del coche'),
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
                        var cove = Car(
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
                        int result = await dbHelper.insertCar(cove);

                        if (result > 0) {
                          Fluttertoast.showToast(msg: 'Guardando Registro...');
                        } else {
                          Fluttertoast.showToast(msg: 'El registro no ha podido ser añadido');
                        }
                      }
                    },
                    child: const Text('Guardar Gasto de coche')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const CarListScreen();
                      }));
                    },
                    child: const Text(
                        'Ver listado de todos los gastos de coches')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
