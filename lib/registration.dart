//import 'dart:async';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'model/office_initialdata.dart';
import 'model/officedependency.dart';
import 'network/dio_client.dart';



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
  final TextEditingController _bvController = TextEditingController();
  final TextEditingController _office = TextEditingController();
  final TextEditingController _officeDependency = TextEditingController();

  List<String> bussVertical = ['Defence', 'Mining & Construction', 'Defence & Mining Construction'];

  final DioServiceClient dio =DioServiceClient();

  late List<Office?> officedata;
  late List<Officedependency?> offdependencyData;

  @override
  void initState() {
    _bdateController.text = "";
    _dateController.text = "";
    passwordFocusNode = FocusNode();
    conPasswordFocusNode = FocusNode();
    super.initState();
    call();
    callData();
  }

  @override
  void dispose() {
    super.dispose();
    passwordFocusNode?.dispose();
    conPasswordFocusNode?.dispose();
  }

  void call() async{
    OfficeInitialdata? response = await dio.initData();
    if(response?.statuscode == 1){
      officedata = response!.data!.office!;
      if(officedata != null) {

      }
      print(response.statusMessage);
    }
    else{
      print(response?.statusMessage);
    }
  }

  void callData() async{
    Officedependency? response = await dio.showData();
    if(response?.statuscode == 1){
      offdependencyData = response!.data!.serviceCentre!.cast<Officedependency?>();
      if(offdependencyData != null) {

      }
      print(response.statusMessage);
    }
    else{
      print(response?.statusMessage);
    }
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
                  image: AssetImage('assets/bgimage.png'),
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
          'assets/white_logo.png',
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Text("Badge Number", style: TextStyle(color: Colors.white),),),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
             child: TextFormField(
               controller: _mailController,
               cursorColor: Colors.red,
               decoration: InputDecoration(
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                 hintText: "* Badge Number",
                 fillColor: Colors.white,
                 filled: true,
               ),
             ),
        )
      ],
    );
  }

  // dropdown for business vertical
  Widget bvDropDown()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Text("Business Vertical", style: TextStyle(color: Colors.white),),),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
          child: TextFormField(
            readOnly: true,
            controller: _bvController,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: "* Business Vertical",
              fillColor: Colors.white,
              filled: true,
            ),
              onTap: () {
                demofunc();
              }
          ),
        )
      ],
    );
  }

  Future demofunc() {
    return showDialog(
        context: context,
        builder: (context)
        {
          return alertdilog();
        });
  }

  /*Widget getAllSelectedShipments() {
    return Center(
        child: Container(
          height: 300,
          width: 300,
          margin: EdgeInsets.fromLTRB(20, 50, 20, 50),
          child: Scaffold(
              body: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(10.0),
                      child: Text("Business Vertical", style: TextStyle(fontSize: 24.0),),),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: officedata.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(officedata[index]!.office!),
                              onTap: () async {
                                setState(() {
                                _bvController.text = officedata[index]!.office!;
                              });},
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                        ),
                      ),
                    ],
                  ))),
        ));
  }

  Widget rundialog() {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Alert Dialog'),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: officedata.length,
              itemBuilder: (context, index) => Text(officedata[index]!.office!),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          )
        ],
      ),
    );
  }

  Widget dilog() {
    return AlertDialog(
      title: Text("Business Vertical"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('CANCEL'),
          onPressed: () {
            //widget.onCancel();
          },
        ),
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            //widget.onOk();
          },
        ),
      ],
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Divider(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: officedata.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile(
                          title: Text(officedata[index]!.office!),
                          value: index,
                          groupValue: _bvController,
                          onChanged: (value) {
                            setState(() {
                              _bvController.text = officedata[index]!.office!;
                            });
                          });
                    }),
              ),
              Divider(),
              TextField(
                autofocus: false,
                maxLines: 1,
                style: TextStyle(fontSize: 18),
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "hint",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  */

  Widget alertdilog(){
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: const Text("BUSINESS VERTICAL", textAlign: TextAlign.center,),
      content: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: bussVertical.length,
                  itemBuilder: (context, index)
                  {
                    return Column(
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            setState(() {
                              _bvController.text = bussVertical[index];
                            });
                            Navigator.of(context).pop();
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              bussVertical[index],
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Divider(thickness: 1),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Name textfiledform
  Widget personalInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Text("Name", style: TextStyle(color: Colors.white),),),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
          child: TextFormField(
            cursorColor: Colors.red,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: "* Name",
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        )
      ],
    );
  }

  // date of birth field
  Widget dobinfo()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Text("Date of Birth", style: TextStyle(color: Colors.white),),),
        Padding(
            padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
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
                  hintText: "* Date of Birth",
                  fillColor: Colors.white,
                  filled: true),
            )
        )
      ],
    );
  }

  // date of joining field
  Widget joininfo()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Text("Date of Join", style: TextStyle(color: Colors.white),),),
        Padding(
            padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
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
                  hintText: "* Date of Join",
                  fillColor: Colors.white,
                  filled: true),
            )
        )
      ],
    );
  }

  // mail id  textfiledform
  Widget mailfield() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Text("Email", style: TextStyle(color: Colors.white),),),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
          child: TextFormField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                hintText: "* Email",
                fillColor: Colors.white,
                filled: true,
              ),
              onTap: () {}
          ),
        )
      ],
    );
  }

  // dropdown for Office
  Widget OfficeDropDown()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Text("Office", style: TextStyle(color: Colors.white),),),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
          child: TextFormField(
              readOnly: true,
              controller: _office,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                hintText: "* Office",
                fillColor: Colors.white,
                filled: true,
              ),
              onTap: () {
                showdilogfunc();
              }
          ),
        )
      ],
    );
  }

  Future showdilogfunc() {
    return showDialog(
        context: context,
        builder: (context)
        {
          return altdilog();
        });
  }

  Widget altdilog(){
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: const Text("OFFICE", textAlign: TextAlign.center,),
      content: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(),
              SizedBox(
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: officedata.length,
                  itemBuilder: (context, index)
                  {
                    return Column(
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            setState(() {
                              _office.text = officedata[index]!.office!;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              officedata[index]!.office!,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Divider(thickness: 1),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // dropdown for Office location
  Widget OfficeLocationDropDown()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Text("Office Location", style: TextStyle(color: Colors.white),),),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
          child: TextFormField(
              readOnly: true,
              controller: _officeDependency,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                hintText: "* Office Location",
                fillColor: Colors.white,
                filled: true,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context)
                    {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        title: const Text("OFFICE DEPENDENCY", textAlign: TextAlign.center,),
                        content: Container(
                          width: double.maxFinite,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Divider(),
                                SizedBox(
                                  height: 240,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    itemCount: offdependencyData.length,
                                    itemBuilder: (context, index)
                                    {
                                      return Column(
                                        children: [
                                          SimpleDialogOption(
                                            onPressed: () {
                                              setState(() {
                                                _officeDependency.text = offdependencyData[index]!.data as String;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                offdependencyData[index]!.data! as String,
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                          Divider(thickness: 1),
                                        ],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
          ),
        )
      ],
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
            width: 360,
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