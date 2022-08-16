// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Center(
        child: const Text('My First App'),
      )),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurpleAccent, width: 3),
          borderRadius: BorderRadius.circular(3),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            // ignore: prefer_const_constructors
            BoxShadow(
              color: Colors.amberAccent,
              offset: const Offset(6.0, 6.0),
            ),
          ],
        ),
        // ignore: prefer_const_constructors
        child: Text(
          "Hello this is the container's example in flutter",
          style: const TextStyle(color: Colors.redAccent, fontSize: 30),
        ),
      ),
    );
    return MaterialApp(home: scaffold);
  }
}
