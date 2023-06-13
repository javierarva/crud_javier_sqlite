import 'package:crud_javier/screens/add_car_screen.dart';
import 'package:crud_javier/screens/car_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'javier-arroyes-cars',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddCarScreen(),
    );
  }
}
