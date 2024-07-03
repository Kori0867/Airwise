
import 'package:airwisesystems/pantallas/Login.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airwise-Systems',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

