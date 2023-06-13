import 'package:crud_javier/db/database_helper.dart';
import 'package:crud_javier/screens/add_car_screen.dart';
import 'package:crud_javier/screens/update_car_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/car.dart';

class CarListScreen extends StatefulWidget {
  const CarListScreen({Key? key}) : super(key: key);

  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Gastos de Coches'),
      ),
      body: FutureBuilder<List<Car>>(
        future: DatabaseHelper.instance.getAllCars(),
        builder: (BuildContext context, AsyncSnapshot<List<Car>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.data!.isEmpty) {
              return const Center(
                  child: Text('No hay gastos de coches en la base de datos.'));
            } else {
              List<Car> cove = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                    itemCount: cove.length,
                    itemBuilder: (context, index) {
                      Car car = cove[index];
                      return Card(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          car.nombre,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Fecha: ${car.fecha}'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Kilómetros recorridos: ${car.km}'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Tipo de gasto: ${car.tipo}'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Combustible del coche: ${car.combustible}'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Avería del coche: ${car.averia}'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Seguro del coche: ${car.seguro}'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Equipamiento del coche: ${car.equipamiento}'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Concepto: ${car.concepto}'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Cantidad: ${car.cantidad}'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            var result =
                                                await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                              return UpdateCarScreen(car: car);
                                            }));

                                            if (result == 'Hecho') {
                                              setState(() {});
                                            }
                                          },
                                          icon: const Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        '¡ATENCIÓN!'),
                                                    content: const Text(
                                                        '¿Estás seguro de que quieres eliminar el registro?'),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                          child:
                                                              const Text('No')),
                                                      TextButton(
                                                          onPressed: () async {
                                                            Navigator.of(context).pop();

                                                            int result = await DatabaseHelper.instance.deleteCar(car.id!);

                                                            if (result > 0) {
                                                              Fluttertoast.showToast(msg: 'Eliminando Registro...');setState(() {});
                                                            }
                                                          },
                                                          child: const Text('Sí')),
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ],
                                  ),
                                ],
                              )));
                    }),
              );
            }
          }
        },
      ),
    );
  }
}
