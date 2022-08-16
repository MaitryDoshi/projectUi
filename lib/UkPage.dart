import 'package:flutter/material.dart';

class UkPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => UkPageState();

}

class UkPageState extends State<UkPage>{


  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            constraints: const BoxConstraints.expand(),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      heading(),
                      inputField(),
              ]),
            )
          )
      ),
    );
  }

  // header of the form
  Widget heading() {
    return Container(
      padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
      child: Text(" "),
    );
  }

  // header of the form
  Widget inputField() {
    return Container(
      child: Stack(
      children: [
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 4,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
            right: 5,
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("10", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),
        ),
      ]
      ),
    );
  }
}
