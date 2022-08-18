
import 'package:flutter/material.dart';
import 'ForgotPassword.dart';
import 'Registration.dart';
import 'TicketType.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

//For stateful widget we need a state class

class LoginScreenState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  FocusNode? passwordFocusNode;

  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    passwordFocusNode?.dispose();
    _mailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: const EdgeInsets.all(25.0),
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bgimage.png'),
                  fit: BoxFit.cover)),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                heading(),
                emailField(),
                passwordField(),
                loginButton(),
                forgotpass(),
                dividerLine(),
                signupButton(),
                textbox(),
              ],
            ),
          )),
    );
  }

  // for heading
  Widget heading() {
    return Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(
                image: AssetImage(
                  'assets/images/white_logo.png',
                ),
                height: 170.0,
                width: 170.0,
              ),
              Text("Serving the nation Since 1964", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
              Padding(padding: EdgeInsets.only(bottom: 40.0),),
            ]
        )
    );
  }

// we need email widget
  Widget emailField() {
    return Container(
      child: TextFormField(
        validator: (val) {
          if(val == null || val.isEmpty) {
            return "Please enter Username";
          }
          return null;
        },
        controller: _mailController,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          prefixIcon: Icon(Icons.email_outlined),
          hintText: "Username",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // we need password field
  Widget passwordField() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TextFormField(
        validator: (val) {
          if(val == null || val.isEmpty){
            return "Please enter Password";
          }
          return null;
        },
        controller: _passwordController,
        focusNode: passwordFocusNode,
        cursorColor: Colors.red,
        onTap: () {
          setState(() {
            FocusScope.of(context).unfocus();
            FocusScope.of(context).requestFocus(passwordFocusNode);
          });
        },
        obscureText: showPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          prefixIcon: Icon(Icons.lock),
          hintText: "Password",
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: const Icon(Icons.remove_red_eye)),
        ),
      ),
    );
  }

  // we need forgot password widget
  Widget forgotpass() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 10.0, left: 15.0, bottom: 15.0),
      child: GestureDetector(
        child: Text("Forgot Password ?",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ForgotPassword()),
          );
        },
      ),
    );
  }

  // need a button
  Widget loginButton() {
    return Container(
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
                  MaterialPageRoute(builder: (context) => const TicketType()),);
              },
              child: const Text("Sign In",
                style: TextStyle( fontFamily: 'Sfpro', fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dividerLine() {
    return Row(
        children: <Widget>[
          Expanded(child: Divider(color: Colors.white, thickness: 2,)),
          Text("   Or   ", style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),),
          Expanded(child: Divider(color: Colors.white, thickness: 2,)),
        ]
    );
  }

  // need a button
  Widget signupButton() {
    var mail = _mailController.text;
    var pass = _passwordController.text;

    return Container(
      padding: EdgeInsets.only(top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
        SizedBox(
        height: 50,
        width: 190,
        child: ElevatedButton(
          child: Text("Customer Register",
            style: TextStyle(fontSize: 14.0, fontFamily: 'Sfpro'),),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(33, 110, 243, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Confirm your login detail'),
                  content: Text("Mail ID : $mail \nPassword : $pass"),
                  actions: <Widget>[
                    TextButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2A4083),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK", style: TextStyle(
                            color: Colors.white),))
                  ],
                );
              },
            );
          },
        ),
      ),
      Padding(padding: EdgeInsets.only(left: 10.0, top: 10.0)),
      SizedBox(
        height: 50,
        width: 140,
        child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(content: Text(
              "Clicked on Login Button"),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Registration()),);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(33, 110, 243, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))
        ), child: Text("BMEL Register",
          style: TextStyle(fontFamily: 'Sfpro', fontSize: 14),
        )),
      ),],
    ),

    );
  }

  // outside text
  Widget textbox() {
    return Container(
      padding: EdgeInsets.only(top: 40.0),
      child: Text("Mining & Construction | Defence | Rail & Metro",
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
    );
  }
}
