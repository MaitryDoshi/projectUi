//import 'dart:async';
//import 'dart:html';

//import 'dart:io';

// ignore_for_file: unnecessary_null_comparison

//import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ebook/model/init_commissioning.dart';
import 'package:ebook/screens/UkPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:toast/toast.dart';

import '../db/dbhelper.dart';

class Initcommissionreg extends StatefulWidget {
  const Initcommissionreg({Key? key}) : super(key: key);

  @override
  State<Initcommissionreg> createState() => InitcommissionregState();
}

class InitcommissionregState extends State<Initcommissionreg> {

  bool showimage = false;
  bool showPassword = true;
  bool viewPassword = true;
  FocusNode? passwordFocusNode;
  FocusNode? conPasswordFocusNode;
  String? date;
  var selectedDate;

  String hw = "Hello world";

  List<String> bv = ['Majorly Affected', 'lightly Affected'];
  List<String> sec = ['IT', 'HR', 'Account', 'Support'];
  List<String> role = ['CEO', 'CIO', 'Vice President', 'Manager', 'Assistant Manager','Accountant' ];
  List<String> designation = ['Administration', 'Developer', 'Tester', 'QA', 'DBA' ];
  List<String> type = [
    'Private Office',
    'Coworking Desk',
    'Virtual Office',
    'Enterprise Office'
  ];
  List<String> office = ['Bangalore', 'Pune', 'Chennai', 'Ahmedabad'];

  Future<SharedPreferences> _pre = SharedPreferences.getInstance();

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  var imageFile;

  final _formKey = new GlobalKey<FormState>();

  String equpStatusHolder = '';
  String sysAffected = '';

  final _modelcontroller = TextEditingController();
  final _HourMeterReading = TextEditingController();
  final _equSlNumber = TextEditingController();
  final _kmReading = TextEditingController();
  final _dod = TextEditingController();
  final _remarks = TextEditingController();
  //final _images = TextEditingController();
  final _address = TextEditingController();
  final _pincode = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _nearbystation = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();

  late final initcommission;
  var dbHelper;

  List<InitCommissioning> datalist = [];
  bool fetching = true;

  @override
  void initState() {
    super.initState();
    initcommission = InitCommissioning;
    dbHelper = DbHelper();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          constraints: const BoxConstraints.expand(),
          color: Colors.greenAccent,
          child: Form(
            key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    heading(),
                    dividerLine(),
                    modelfield(),
                    manequnumfield(),
                    meterreadingfield(),
                    kmreadingfield(),
                    bvDropDown(),
                    dodinfo(),
                    systemAffectedDropDown(),
                    remarkfield(),
                    newsection(),
                    selectimages(),
                    baseimage(),
                    newsec(),
                    addfield(),
                    pincode(),
                    city(),
                    state(),
                    neareststation(),
                    newdiv(),
                    name(),
                    footerview(),
                    phonefiled(),
                    subButton(),
              ],
            ),
          ))),
    );
  }

  // header of the form
  Widget heading() {
    return Container(
      padding: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
      child: Text(" "),
    );
  }

  //divider
  Widget dividerLine() {
    return Row(children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0)),
      Expanded(
          child: Divider(
        color: Colors.white,
        thickness: 1,
      )),
      Text(
        "   INITIAL COMMISSIONING   ",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Sfpro',
            fontSize: 16.0,
            fontWeight: FontWeight.bold),
      ),
      Expanded(
          child: Divider(
        color: Colors.white,
        thickness: 1,
      )),
      Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0)),
    ]);
  }

  // model number
  Widget modelfield() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _modelcontroller,
        validator: (val) {
          if(val == null || val.isEmpty){
            return 'Please enter model';
          }
          else{
            return null;
          }
        },
        cursorColor: Colors.red,
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
          hintText: "* Model",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // manual equipment number
  Widget manequnumfield() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _equSlNumber,
        validator: (val) {
          if(val == null || val.isEmpty){
            return 'Please enter Equipment number';
          }
          else{
            return null;
          }
        },
        cursorColor: Colors.red,
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
          hintText: "* Manual Equipment SL Number",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // hour meter reading
  Widget meterreadingfield() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _HourMeterReading,
        validator: (val) {
          if(val == null || val.isEmpty){
            return 'Please enter Hour meter reading';
          }
          else{
            return null;
          }
        },
        cursorColor: Colors.red,
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
          hintText: "* Hour Meter Reading",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // kilometer reading
  Widget kmreadingfield() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _kmReading,
        validator: (val) {
          if(val == null || val.isEmpty){
            return 'Please enter Kilometer reading';
          }
          else{
            return null;
          }
        },
        cursorColor: Colors.red,
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
          hintText: "* Kilometer Reading (KM)",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // equipment status
  Widget bvDropDown() {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Form(
            child: SingleChildScrollView(
                child: DropdownSearch<String>(
          items: bv,
          popupProps: PopupProps.menu(
            showSelectedItems: true,
          ),
          onChanged: print,
          validator: (String? bv) {
            if(bv != null){
              equpStatusHolder = bv;
              return equpStatusHolder;
            }
            else if(bv == null){
              return "Please choose options";
            }
            else
              return null;
          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.blue)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.white70)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.white70)),
              hintText: "* Equipment Status",
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ))));
  }

   // date of delivery info
  Widget dodinfo() {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: TextField(
          controller: _dod,
          readOnly: true,
          onTap: () {},
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_month),
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2050));
                if (picked != null) {
                  String selectedDate = DateFormat('dd-MM-yyyy').format(picked);
                  setState(() {
                    _dod.text = selectedDate;
                  });
                }
              },
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white70)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white70)),
            hintText: "* Date of Delivery",
            fillColor: Colors.white,
            filled: true,
          ),
        )
    );
  }

  // equipment status
  Widget systemAffectedDropDown() {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Form(
            child: SingleChildScrollView(
                child: DropdownSearch<String>(
                  items: bv,
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                  ),
                  onChanged: print,
                  validator: (String? bv) {
                    if(bv != null){
                      sysAffected = bv;
                      return sysAffected;
                    }
                    else if(bv == null){
                      return "Please choose options";
                    }
                    else
                      return null;
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white70)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white70)),
                      hintText: "* System Affected",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                )
            )
        )
    );
  }

  //Remarks / problem
  Widget remarkfield() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _remarks,
        cursorColor: Colors.red,
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
          hintText: "* Remarks / Problems",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // new section
  Widget newsection() {
    return Container(

      padding: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(alignment: Alignment.centerLeft,),
          Text("Upload Images:", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.left,),
          Divider(
            color: Colors.white,
            thickness: 1,
          ),
        ]
      )
    );
  }

  //select images
  Widget selectimages()
  {
    return Container(
        child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  //controller: _images,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.camera_alt),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white70)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white70)),
                    hintText: "* Select Files or Photos",
                    fillColor: Colors.white,
                    filled: true,),
                  onTap: () {
                    selectImages();
                    showSelectedImages();
                  },
                ),
              ),
            ]
        )
    );
  }


  // show images
  Widget baseimage(){
    return Container(
        height: MediaQuery.of(context).size.height *.2, //to set the height of screen
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Visibility(
            visible: showimage,
            child: imageFileList!.isEmpty
            ? Center(child: Text("No image"))
            : GridView.count(
          crossAxisCount: 3,
          children:
          List.generate(imageFileList!.length, (index) {
            return Container(padding: EdgeInsets.all(4.0),child: Image.file(imageFile(imageFileList![index].path),
              fit: BoxFit.cover,));
          }),
        )
        )
    );
  }

  // new section
  Widget newsec() {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerLeft,),
              Text("Do you want to change Equipments Location", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.left,),
              Divider(color: Colors.white, thickness: 1,),
            ]
        )
    );
  }

  // Address
  Widget addfield() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _address,
        cursorColor: Colors.red,
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
          hintText: "* Address",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // Pincode
  Widget pincode() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _pincode,
        cursorColor: Colors.red,
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
          hintText: "* Pincode of Equipment Location",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // city
  Widget city() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _city,
        cursorColor: Colors.red,
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
          hintText: "* City",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // State
  Widget state() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _state,
        cursorColor: Colors.red,
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
          hintText: "* State",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // Nearest Railway station
  Widget neareststation() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _nearbystation,
        cursorColor: Colors.red,
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
          hintText: "* Nearest Railway Station",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // new section
  Widget newdiv() {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerLeft,),
              Text("Details of site Incharge / Operator", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.left,),
              Divider(color: Colors.white, thickness: 1,),
            ]
        )
    );
  }

  // Name
  Widget name() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        controller: _name,
        cursorColor: Colors.red,
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
          hintText: "* Name",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // footerpart
  Widget footerview() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        Align(alignment: Alignment.centerLeft),
        Text('Enter Your Mobile Number', style: TextStyle(fontSize: 16, color: Colors.white),),
        Divider(color: Colors.white,thickness: 1,),
      ]),
    );
  }

  //phone field
  Widget phonefiled() {
    return Container(
      padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
      child: IntlPhoneField(
        controller: _phone,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Phone NUmber',
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

  // registration a button
  Widget subButton() {
   // final data = initCommissionData[index];
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(33, 110, 243, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              onPressed: () {
                savedata();
                //showData();
                },
              child: const Text(
                "Submit",
                style: TextStyle(fontFamily: 'Sfpro', fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  savedata() async {
    String model = _modelcontroller.text;
    String equnumber = _equSlNumber.text;
    String hrmeter = _HourMeterReading.text;
    String kmReading = _kmReading.text;
    String equstatus = equpStatusHolder;
    String dod = _dod.text;
    String sysAffect = sysAffected;
    String remarks = _remarks.text;
    //String images = _images.text;
    String address = _address.text;
    String pincode = _pincode.text;
    String city = _city.text;
    String state = _state.text;
    String nearbyStation = _nearbystation.text;
    String name = _name.text;
    String phone = _phone.text;

    if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        InitCommissioning initCommissioning = InitCommissioning(model, hrmeter, equnumber, kmReading, equstatus, dod, sysAffect, remarks, address, pincode, city, state, nearbyStation, name, phone);
        await dbHelper.saveData(initCommissioning).then((userData) {
          print('model number : $model \nEquipment number : $equnumber \nHour meter reading number : $hrmeter \nkilometer reading : $kmReading \nEquipment status : $equstatus \nDate of delivery : $dod \nSystem affected : $sysAffect \nRemarks : $remarks \nAddress : $address \nPincode : $pincode \nCity : $city \nState : $state \nNear By Station : $nearbyStation \nName of Incharge : $name \nPhone number : $phone');
          print("Data saved!!");
        }).catchError((error) {
          print(error);
        });
    }
  }
/*
  showData() async{
    String model = _modelcontroller.text;
    String equnumber = _equSlNumber.text;
    String hrmeter = _HourMeterReading.text;
    String kmReading = _kmReading.text;
    String equstatus = equpStatusHolder;
    String dod = _dod.text;
    String sysAffect = sysAffected;
    String remarks = _remarks.text;
    //String images = _images.text;
    String address = _address.text;
    String pincode = _pincode.text;
    String city = _city.text;
    String state = _state.text;
    String nearbyStation = _nearbystation.text;
    String name = _name.text;
    String phone = _phone.text;

    if(model.isEmpty){
      print("Model field is empty");
    }
    else if(equnumber.isEmpty){
      print("equipment field is empty");
    }
    else if(hrmeter.isEmpty){
      print("Hour meter field is empty");
    }
    if(kmReading.isEmpty){
      print("Kilometer field is empty");
    }
    else{
      await dbHelper.getData(model, hrmeter, equnumber, kmReading, equstatus, dod, sysAffect, remarks, address, pincode, city, state, nearbyStation, name, phone).then((userData) {
        if(userData != null) {
          setSP(userData).whenComplete(() => Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => UkPage()), (
                  Route<dynamic> route) => false));
          print("$model \n$equnumber \n$hrmeter \n$kmReading \n$equstatus \n$dod \n$sysAffect \n$remarks \n$address \n$pincode \n$city \n$state \n$nearbyStation \n$name \n$phone");
        }
      });
    }
  }*/

  Future setSP(InitCommissioning initCommissioning) async{
    final SharedPreferences sp = await _pre;

    sp.setString("model", initCommissioning.model);
    sp.setString("kmreading", initCommissioning.kmreading);
    sp.setString("hours", initCommissioning.hours);
    sp.setString("equnumber", initCommissioning.equnumber);
    sp.setString("equstatus", initCommissioning.equstatus);
    sp.setString("dod", initCommissioning.dod);
    sp.setString("sysAffect", initCommissioning.sysAffect);
    sp.setString("remarks", initCommissioning.remarks);
    //sp.setString("images", initCommissioning.images);
    sp.setString("address", initCommissioning.address);
    sp.setString("pincode", initCommissioning.pincode);
    sp.setString("city", initCommissioning.city);
    sp.setString("state", initCommissioning.state);
    sp.setString("nearbyStation", initCommissioning.nearbyStation);
    sp.setString("name", initCommissioning.name);
    sp.setString("phone", initCommissioning.phone);
  }

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    imageFileList!.addAll(selectedImages!);
    print("Image List Length:" + imageFileList!.length.toString());
    setState((){
      imageFileList;
    });
  }

  void showSelectedImages()
  {
    setState(() {
      showimage = !showimage;
    });
  }
}