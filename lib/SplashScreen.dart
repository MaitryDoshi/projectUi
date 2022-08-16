// ignore_for_file: use_build_context_synchronously, file_names

import 'package:ebook/LoginForm.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>{

  @override
  void initState(){
    super.initState();
    _navigateHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             Positioned(top: 200, left: 50, right: 50,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage('assets/images/white_logo.png',),
                    alignment: Alignment.center,
                    height: 150.0,
                      width: 150.0,
                  )
                ),
             ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text("Serving the nation Since 1964", style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),),
              Padding(padding: EdgeInsets.all(5.0)),
              Text("Mining & Construction | Defence | Rail & Metro",
                style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.only(top: 100.0)),
              Container(
                    child: Text("Tap 'Agree & Continue' to accept", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.only(top: 5.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,),
                        onPressed: () {},
                      child: Text("Terms of Service")),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Text("and",style: TextStyle(color: Colors.grey),),
                  Padding(padding: EdgeInsets.all(5.0)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,),
                      onPressed: () {},
                      child: Text("Privacy Policy")),
                  ]
              )
            ],
          )
      ),
    );
  }

  _navigateHome() async{
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginForm()));
  }
}

