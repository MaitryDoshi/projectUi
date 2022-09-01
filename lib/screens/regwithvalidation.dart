//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Registration Form'),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState(){
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm>
{
  final formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _mail = TextEditingController();
  TextEditingController _org = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  //var org = ['private', 'government', 'semi-gov', 'others'];
  List<String> org= ['Select','private', 'government', 'semi-gov', 'others'];
  List<String> sec = ['Select','IT', 'HR', 'Account', 'Support'];
  List<String> type = ['Select','Private Office', 'Coworking Desk', 'Virtual Office', 'Enterprise Office'];
  List<String> office = ['Select','Bangalore', 'Pune', 'Chennai', 'Ahmedabad'];

  final _formKey = GlobalKey<FormState>();
  

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  
  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: _formKey,
      child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: const Text(
                  'User Details',
                  style: TextStyle(fontSize: 20,
                      color: Colors.black),
                )),
      // ignore: prefer_const_constructors
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 2, color: Colors.black)),
                    labelText: 'Name'),
              ),
            ),
            Container(
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: _mail,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 2, color: Colors.black)),
                    labelText: 'Email Id'),
              ),
            ),
            Container(
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: _org,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 3, color: Colors.black)),
                    labelText: 'Organization / Company'),
              ),
            ),
            Container(
              // ignore: sort_child_properties_last
              child: Form(
                child: SingleChildScrollView(
                    child: DropdownSearch<String>(
                      // ignore: prefer_const_literals_to_create_immutables
                      items: org,
                      selectedItem: "Select",
                      onChanged: (org) {
                        print(org);
                      },
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Organization Type",
                        ),
                      ),
                    )),
              ),
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10),
            ),
            Container(
              // ignore: sort_child_properties_last
              child: Form(
                child: SingleChildScrollView(
                    child: DropdownSearch(
                      // ignore: prefer_const_literals_to_create_immutables
                      items: sec,
                      selectedItem: "Select",
                      onChanged: (sec) {
                        print(sec);
                      },
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Sector",
                        ),
                      ),
                    )),
              ),
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10),
            ),
            Container(
              // ignore: sort_child_properties_last
              child: Form(
                child: SingleChildScrollView(
                    child: DropdownSearch(
                      items: type,
                      selectedItem: "Select",
                      onChanged: (type){
                        print(type);
                      },
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(

                          labelText: "Office Type",
                        ),
                      ),
                    )),
              ),
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10),
            ),
            Container(
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                controller: _lname,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 3, color: Colors.white)),
                    labelText: 'Last Name',
                    ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: dateinput,
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Enter Joining Date",
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030)
                  );
                  if(pickedDate != null )
                  {
                    print(pickedDate);
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);

                    setState( ()
                    {
                      dateinput.text = formattedDate;
                    });
                  }
                },
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                    onPressed: () {
                      var name = _name.text;
                      var mail = _mail.text;
                      var org = _org.text;
                      var lname = _lname.text;
                      var joindate = dateinput.text;

                      print("Name : $name");
                      print("Email : $mail");
                      print("Organization : $org");
                      print("Last name : $lname");
                      print("Joning date : $joindate");
                    },
                    child: Text("Register"),
                ),
                SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                    onPressed: () {
                      _name.clear();
                      _lname.clear();
                      _org.clear();
                      _mail.clear();
                      dateinput.clear();
                    },
                    child: Text("Reset"),
                )
              ],
            )
          ]
      )
    );
  }

}
