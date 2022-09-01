import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class DesignModification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => DesignModificationState();
}

class DesignModificationState extends State<DesignModification>
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
                      model(),
                      slnumber(),
                      hourmeterreadingfield(),
                      kmreadingfield(),
                      divider(),
                      selectimage(),
                      baseimage(),
                      newdivider(),
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
        "   DESIGN MODIFICATION   ",
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

  // Model
  Widget model() {
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
          hintText: "* Model",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  // SL number
  Widget slnumber() {
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
                      hintText: "* Enter SL number",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                )
            )
        )
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

  //divider
  Widget newdivider(){
    return Divider(
      color: Colors.white,
      thickness: 1,
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
