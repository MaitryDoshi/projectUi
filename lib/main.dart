//import 'package:ebook/IOFile.dart';

import 'package:ebook/LoginForm.dart';
import 'package:ebook/OtpGen.dart';
import 'package:ebook/Passwordchange.dart';
import 'package:ebook/Savepass.dart';
import 'package:ebook/SplashScreen.dart';
import 'package:ebook/TicketType.dart';
import 'package:ebook/buttons.dart';
import 'package:ebook/myapp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Breakdown.dart';
import 'DesignModification.dart';
import 'ErectionCommission.dart';
import 'ForgotPassword.dart';
import 'GeneralInspection.dart';
import 'PeriodicMaintenance.dart';
import 'PrevantiveMaintenance.dart';
import 'ServiceforSparePurchase.dart';
import 'Subassembly.dart';
import 'TicketDetails.dart';
import 'UkPage.dart';
import 'initcommissionreg.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}