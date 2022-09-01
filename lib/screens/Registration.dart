//import 'dart:async';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Registration extends StatefulWidget {

  static const String title = 'Registration Page';

  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {

  final _passwordController = TextEditingController();
  //final _conPasswordController = TextEditingController();

  bool visibilityOfficeLocation = false;
  bool visibilityrole = false;
  bool showPassword = true;
  bool viewPassword = true;
  FocusNode? passwordFocusNode;
  FocusNode? conPasswordFocusNode;
  String? date;
  var selectedDate;

  List<String> bv = ['private', 'government', 'semi-gov', 'others'];
  List<String> sec = ['IT', 'HR', 'Account', 'Support'];
  List<String> role = ['CEO', 'CIO', 'Vice President', 'Manager', 'Assistant Manager', 'Accountant'];
  List<String> designation = ['Administration', 'Developer', 'Tester', 'QA', 'DBA'];
  List<String> type = ['Private Office', 'Coworking Desk', 'Virtual Office', 'Enterprise Office'];
  List<String> office = ['Bangalore', 'Pune', 'Chennai', 'Ahmedabad'];

  //final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
 // final TextEditingController _orgController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _bdateController = TextEditingController();

  @override
  void initState() {
    _bdateController.text = "";
    _dateController.text = "";
    passwordFocusNode = FocusNode();
    conPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    passwordFocusNode?.dispose();
    conPasswordFocusNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var _isHidden;
    return Material(
      child: Container(
          padding: const EdgeInsets.all(10.0),
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bgimage.png'),
                  fit: BoxFit.fill)),
          child: Form(
            child: SingleChildScrollView (
              child: Column(
                children: [
                 heading(),
                 dividerLine(),
                 badgefield(),
                 bvDropDown(),
                 personalInfo(),
                 dobinfo(),
                 joininfo(),
                 mailfield(),
                 OfficeDropDown(),
                 OfficeLocationDropDown(),
                 AccessLevelDropDown(),
                  roleDropDown(),
                  designationDropDown(),
                  passwordField(),
                  confirmpasswordField(),
                  footerview(),
                  phonefiled(),
                  regButton(),
              ],
            ),
            ))),
    );
  }

  // header of the form
  Widget heading() {
    return Container(
        child: Image(
                image: AssetImage(
                  'assets/images/white_logo.png',
                ),
                height: 170.0,
                width: 170.0,
              ),
    );
  }

  //divider
  Widget dividerLine() {
    return Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0)),
          Expanded(child: Divider(color: Colors.white, thickness: 1,)),
          Text("   BEML Registration   ", style: TextStyle(
              color: Colors.white, fontFamily: 'Sfpro', fontSize: 14.0, fontWeight: FontWeight.bold),),
          Expanded(child: Divider(color: Colors.white, thickness: 1,)),
          Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0)),
        ]
    );
  }

  // textformfield widget for badge number
  Widget badgefield() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _mailController,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: "* Badge Number",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // dropdown for business vertical
  Widget bvDropDown()
  {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: Form(
        child: SingleChildScrollView(
          child: DropdownSearch(
        items: bv,
        onChanged: (bv) {
          print(" Business Vertical : $bv");
          },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: "* Business Vertical",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    )))
    );
  }

  // Name textfiledform
  Widget personalInfo() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _mailController,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: "* Name",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
  
  // date of birth field
  Widget dobinfo()
  {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: TextField(
          controller: _bdateController,
          readOnly: true,
          onTap: () {},
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2050));
                  if (picked != null) {
                    String selectedDate = DateFormat('dd-MM-yyyy').format(picked);
                    setState(() {
                      _bdateController.text = selectedDate;
                    });
                  }
                },
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 3, color: Colors.white)),
              labelText: "* Date of Birth",
              fillColor: Colors.white,
              filled: true),
        )
    );
  }

  // date of joining field
  Widget joininfo()
  {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: TextFormField(
          controller: _dateController,
          onTap: () {},
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1994),
                      lastDate: DateTime(2050));
                  if (picked != null) {
                    String selectedDate = DateFormat('dd-MM-yyyy').format(picked);
                    setState(() {
                      _dateController.text = selectedDate;
                    });
                  }
                },
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 3, color: Colors.white)),
              labelText: '* Date of Joining',
              fillColor: Colors.white,
              filled: true),
        )
    );
  }

  // mail id  textfiledform
  Widget mailfield() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        cursorColor: Colors.red,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: "* Email ID",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // dropdown for Office
  Widget OfficeDropDown()
  {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Form(
            child: SingleChildScrollView(
                  child: DropdownSearch(
                    items: bv,
                    onChanged: (bv) {
                      visibleLocation();
                      print(" Business Vertical : $bv");
                    },
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                        labelText: "* Office",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
              )
        )
    );
  }

  // dropdown for Office location
  Widget OfficeLocationDropDown()
  {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Form(
            child: SingleChildScrollView(
                child: Visibility(
                  visible: visibilityOfficeLocation,
                  child: DropdownSearch(
                  items: office,
                  onChanged: (office) {
                    print(" Business Vertical : $office");
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      labelText: "* Office Location",
                      fillColor: Colors.white,
                      filled: true,
                    ),),
                  )
                )
            )
        )
    );
  }

  // dropdown for Access level
  Widget AccessLevelDropDown()
  {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Form(
            child: SingleChildScrollView(
                child: DropdownSearch(
                  items: sec,
                  onChanged: (sec) {
                    visibleRole();
                    print(" Business Vertical : $sec");
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      labelText: "* Access Level",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                )
            )
          )
    );
  }

  // dropdown for Role
  Widget roleDropDown()
  {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Form(
            child: SingleChildScrollView(
                child: Visibility (
                    visible: visibilityOfficeLocation,
                  child: DropdownSearch(
                  items: role,
                  onChanged: (role) {
                    print(" Business Vertical : $role");
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      labelText: "* Role",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                )
              )
            )
        )
    );
  }

  // dropdown for Designation
  Widget designationDropDown()
  {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Form(
            child: SingleChildScrollView(
                child: DropdownSearch(
                  items: designation,
                  onChanged: (designation) {
                    print(" Business Vertical : $designation");
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      labelText: "* Designation",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                )))
    );
  }

  // password field
  Widget passwordField() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
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
          labelText: "* Password",
          hintText: "* Password",
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

  // Confirm password field
  Widget confirmpasswordField() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
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
          labelText: "* Re-Type Password",
          hintText: "* Re-Type Password",
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

  // footerpart
  Widget footerview()
  {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Align(alignment: Alignment.centerLeft,),
          Text(
              'Enter Your Mobile Number',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          Padding(padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0)),
         Text(
              '(OTP will be sent to verify your mobile number)',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          Padding(padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0)),
          Divider(
            color: Colors.white,
            thickness: 2,
          ),
        ]),
    );
  }

  //phone field
  Widget phonefiled() {
    return Container(
      padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
        child: IntlPhoneField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Phone NUmber',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),),
        ),
        initialCountryCode: 'IN',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
        onCountryChanged: (country) {
          print(country.name);
        }
      ),
    );
  }

  // registration a button
  Widget regButton() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
              onPressed: () {},
              child: const Text("Register",
                style: TextStyle(
                    fontFamily: 'Sfpro',
                    fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void visibleLocation() {
    setState(() {
      visibilityOfficeLocation = !visibilityOfficeLocation;
    });
  }

  void visibleRole() {
    setState(() {
      visibilityrole = !visibilityrole;
    });
  }
}