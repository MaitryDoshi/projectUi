import 'package:ebook/LoginForm.dart';
import 'package:flutter/material.dart';

import 'Savepass.dart';

class Passwordchange extends StatefulWidget {
  const Passwordchange({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PasswordchangeState();
  }
}

//For stateful widget we need a state class

class PasswordchangeState extends State<Passwordchange> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: const EdgeInsets.all(10.0),
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              color: Colors.white),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                heading(),
                info(),
                submit(),
              ],
            ),
          )),
    );
  }

  // for heading
  Widget heading() {
    return Container(
      alignment: Alignment.topCenter,
      child: Image(
        image: AssetImage('assets/images/done.jpg'),
        height: 150,
        width: 150,
      ),
    );
  }

 // for rest information
  Widget info() {
    return Container(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column (
        children: [
          Text("* Thank you for your valuable registration", textAlign: TextAlign.center),
          Padding(padding: EdgeInsets.all(10.0)),
          Text("* Verification pending from BEML", textAlign: TextAlign.center),
          Padding(padding: EdgeInsets.all(10.0)),
          Text("* Please check the OTP sent to your mobile number or Email id", textAlign: TextAlign.center),
        ],
      )
    );
  }

  //button to redirect
  Widget submit() {
    return Container(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              height: 50,
              width: 340,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(33, 110, 243, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Savepass()),);
            },
            child: const Text("OK",
              style: TextStyle( fontFamily: 'Sfpro', fontSize: 14),
            ),
          ),
          ),
        ],
      ),
    );
  }
}