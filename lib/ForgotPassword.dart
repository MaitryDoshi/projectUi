import 'package:flutter/material.dart';
import 'package:ebook/OtpGen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordState();
  }
}

//For stateful widget we need a state class

class ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: const EdgeInsets.all(15.0),
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              color: Colors.cyan),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                headingimage(),
                heading(),
                phonefield(),
                submitButton(),
              ],
            ),
          )),
    );
  }

  //for heading image

  Widget headingimage() {
    return Container(
      alignment: Alignment.topLeft,
      child: Image(
        image: AssetImage('assets/images/office.jpg'),
          height: 60,
        width: 60,
      ),
    );
  }

  // for heading
  Widget heading() {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Forgot your password ?",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 10.0)
              ),
              Text(
                "Please enter your registered mobile number",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0)
              ),
            ]
        )
    );
  }


  // for contact number field
  Widget phonefield(){
    return Container(
      padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
      child: IntlPhoneField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: 'Phone NUmber',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          initialCountryCode: 'IN',
          onChanged: (phone) {
            print(phone.completeNumber);
          },
          onCountryChanged: (country) {
            print(country.name);
          }),
    );
  }

  // submit button
  Widget submitButton() {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Row(
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OtpGen()),);
                },
                child: const Text("GENERATE OTP",
                  style: TextStyle( fontFamily: 'Sfpro', fontSize: 14),
                ),
              ),
            ),
          ],
        ),
    );
  }
}


