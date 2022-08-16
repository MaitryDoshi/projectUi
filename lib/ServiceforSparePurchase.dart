import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ServiceforSparePurchase extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ServiceforSparePurchaseState();

}

class ServiceforSparePurchaseState extends State<ServiceforSparePurchase>
{

  bool showimage = false;
  bool showPassword = true;
  bool viewPassword = true;
  FocusNode? passwordFocusNode;
  FocusNode? conPasswordFocusNode;
  String? date;
  var selectedDate;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _bdateController = TextEditingController();

  List<String> bv = ['private', 'government', 'semi-gov', 'others'];
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

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  var imageFile;

  @override
  void initState() {
    _bdateController.text = "";
    _dateController.text = "";
    super.initState();
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
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      heading(),
                      dividerLine(),
                      purposeField(),
                      porefField(),
                      dodField(),
                      subassemblySP(),
                      warrantyclaim(),
                      equipmentModel(),
                      sinumber(),
                      hourmeterreadingfield(),
                      kmreadingfield(),
                      equpstatus(),
                      dofailure(),
                      remark(),
                      divider(),
                      selectimage(),
                      baseimage(),
                      newdivider(),
                      address(),
                      pincode(),
                      city(),
                      state(),
                      newdiv(),
                      name(),
                      footer(),
                      phonefiled(),
                      submit(),
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
        "   SERVICE FOR SPARES PURCHASED   ",
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

  // Purpose
  Widget purposeField() {
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
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white70)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white70)),
                      hintText: "* Purpose",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                )
            )
        )
    );
  }

  // Purchase order reference
  Widget porefField() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
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
          hintText: "* Purchase order reference",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // date of delivery info
  Widget dodField() {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: TextField(
          controller: _bdateController,
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
                    _bdateController.text = selectedDate;
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

  // Details of sub assembly Spare parts
  Widget subassemblySP() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
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
          hintText: "* Details of sub assembly Spare parts",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // Date for warranty claim
  Widget warrantyclaim() {
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
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white70)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white70)),
                      hintText: "* Select Date for warranty claim",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                )
            )
        )
    );
  }

  // equipment model
  Widget equipmentModel() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
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
          hintText: "* Equipment Model",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // manual equipment SI no
  Widget sinumber() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
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
          hintText: "* Manual Equipment Sl.No.",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // hour meter reading
  Widget hourmeterreadingfield(){
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
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
  Widget equpstatus() {
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
  Widget dofailure() {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: TextField(
          controller: _bdateController,
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
                    _bdateController.text = selectedDate;
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
            hintText: "* Date of Failure",
            fillColor: Colors.white,
            filled: true,
          ),
        )
    );
  }

  //Remarks / problem
  Widget remark() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
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
  Widget divider() {
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
  Widget selectimage() {
    return Container(
        child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: TextFormField(
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
                return Container(padding: EdgeInsets.all(4.0),child: Image.file(File(imageFileList![index].path),
                  fit: BoxFit.cover,));
              }),
            )
        )
    );
  }

  // new section
  Widget newdivider() {
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
  Widget address() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
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
  Widget footer() {
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
  Widget submit() {
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
              onPressed: () {},
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

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    imageFileList!.addAll(selectedImages!);
    print("Image List Length:" + imageFileList!.length.toString());
    setState((){
      imageFileList;
    });
  }

  void showSelectedImages() {
    setState(() {
      showimage = !showimage;
    });
  }

}
