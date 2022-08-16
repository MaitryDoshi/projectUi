import 'package:flutter/material.dart';

class Savepass extends StatefulWidget {
  const Savepass({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SavepassState();
  }
}

//For stateful widget we need a state class

class SavepassState extends State<Savepass> {

  bool showPassword = true;
  bool viewPassword = true;
  bool seePassword = true;
  FocusNode? passwordFocusNode;
  FocusNode? viewFocusNode;
  FocusNode? seeFocusNode;

  final _viewController = TextEditingController();
  final _seeController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
    viewFocusNode = FocusNode();
    seeFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    passwordFocusNode?.dispose();
    viewFocusNode?.dispose();
    seeFocusNode?.dispose();
    _viewController.dispose();
    _seeController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: const EdgeInsets.all(25.0),
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              color: Colors.cyanAccent),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                heading(),
                submit(),
              ],
            ),
          )),
    );
  }

  // for heading
  Widget heading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
            Icons.shield_sharp,
          color: Colors.white,
          size: 150.0,
        ),
        Padding(padding: EdgeInsets.all(10.0)),
        TextFormField(
          controller: _passwordController,
          focusNode: passwordFocusNode,
          obscureText: showPassword,
          onTap: () {
            setState(() {
              FocusScope.of(context).unfocus();
              FocusScope.of(context).requestFocus(passwordFocusNode);
            });
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white70)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white70)),
            hintText: "OTP",
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
        Padding(padding: EdgeInsets.all(5.0)),
        TextFormField(
          controller: _viewController,
          obscureText: viewPassword,
          focusNode: viewFocusNode,
          onTap: () {
            setState(() {
              FocusScope.of(context).unfocus();
              FocusScope.of(context).requestFocus(viewFocusNode);
            });
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white70)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white70)),
            hintText: "New password",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    viewPassword = !viewPassword;
                  });
                },
                icon: const Icon(Icons.remove_red_eye)),
          ),
        ),
        Padding(padding: EdgeInsets.all(5.0)),
        TextFormField(
          controller: _seeController,
          obscureText: seePassword,
          focusNode: seeFocusNode,
          onTap: () {
            setState(() {
              FocusScope.of(context).unfocus();
              FocusScope.of(context).requestFocus(seeFocusNode);
            });
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white70)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white70)),
            hintText: "Confirm new password",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    seePassword = !seePassword;
                  });
                },
                icon: const Icon(Icons.remove_red_eye)),
          ),
        ),
      ],
    );
  }

  //button to redirect
  Widget submit() {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        height: 50,
        width: 340,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(33, 110, 243, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context)
              {
                return AlertDialog(
                  title: const Text("Alert"),
                  content: const Text("Do you want to save your password?"),
                  actions: <Widget>[
                    TextButton(onPressed: ()
                    {Navigator.pop(context, "No");},
                      child: const Text ("No"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, "Yes");
                      },
                      child: const Text("Yes"),
                    ),
                  ],
                );
              }
          );
        },
        child: const Text('SUBMIT'),
      ),
      ),
    );
  }
}