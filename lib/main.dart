import 'package:ebook/screens/Imagepicker.dart';
import 'package:ebook/screens/SplashScreen.dart';
import 'package:ebook/screens/bottomNavigation.dart';
import 'package:ebook/screens/ticketList.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        body: BottomNavigation(),
      ),
    );
  }
}