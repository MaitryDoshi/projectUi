import 'dart:async';

import 'Passwordchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpGen extends StatefulWidget {
  const OtpGen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OtpGenState();
  }
}

//For stateful widget we need a state class

class OtpGenState extends State<OtpGen> {

  Timer? _timer;
  int _start = 120;
  String _time = "2:00";

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: const EdgeInsets.all(25.0),
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              color: Colors.white),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                heading(),
                otpui(),
                submit(),
              ],
            ),
          )),
    );
  }

  // for heading
  Widget heading() {
    return SizedBox(
      width: double.infinity,
        child: Column(
            children: <Widget>[
              Text("OTP Verification", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Padding(padding: EdgeInsets.all(5.0)),
              Text("We sent the code to your registered mobile number and Email Id",
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
                  Text("6-Digit OTP", style: TextStyle(color: Colors.grey), textAlign: TextAlign.left,),
                  TweenAnimationBuilder(
                      tween: Tween(begin: 120, end: 0.0),
                      duration: Duration(seconds: 120),
                      builder: (context, value, child) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 115),
                          child: Text('$_time',textAlign: TextAlign.right,));
                      })],
              )
            ]
        )
    );
  }

  //OTP ui
  Widget otpui(){
    return Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: TextFormField(
              onChanged: (value) {
                if (value.length == 1){
                  FocusScope.of(context).nextFocus();
                  }
                },
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ],
        )
    );
  }

  // submit button
  Widget submit() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
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
                MaterialPageRoute(builder: (context) => const Passwordchange()),);
                startTimer();
            },
            child: const Text("SUBMIT",
              style: TextStyle( fontFamily: 'Sfpro', fontSize: 14),
            ),
          ),
        ),
        ],
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
        if(_start>=120){
          _time = "2:00";
        }
        else if(_start>=60){
          _time = "1:${_start-60}";
        }
        else{
          _time = "0: $_start";
        }
      },
    );
  }

}