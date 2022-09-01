import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UkPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => UkPageState();
}

class UkPageState extends State<UkPage>{

  Future<SharedPreferences> _pre = SharedPreferences.getInstance();
  String modelnumber = " ";
  String elnumber = " ";
  String hourmeter = " ";
  String kmreader = " ";
  String equstatus = " ";
  String dod = " ";
  String sysAffect = " ";
  String remarks = " ";
  //String images = " ";
  String address = " ";
  String pincode = " ";
  String city = " ";
  String state = " ";
  String nearbyStation = " ";
  String name = " ";
  String phone = " ";

  Future<void> getData() async{
    final SharedPreferences sp = await _pre;
    setState(() {
      modelnumber = sp.getString("model")!;
      elnumber = sp.getString("equnumber")!;
      hourmeter = sp.getString("hours")!;
      kmreader = sp.getString("kmreading")!;
      equstatus = sp.getString("equstatus")!;
      dod = sp.getString("dod")!;
      sysAffect = sp.getString("sysAffect")!;
      remarks = sp.getString("remarks")!;
      //images = sp.getString("images")!;
      address = sp.getString("address")!;
      pincode = sp.getString("pincode")!;
      city = sp.getString("city")!;
      state = sp.getString("state")!;
      nearbyStation = sp.getString("nearbyStation")!;
      name = sp.getString("name")!;
      phone = sp.getString("phone")!;
    });
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            constraints: const BoxConstraints.expand(),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      heading(),
                      inputField(),
              ]),
            )
          )
      ),
    );
  }

  // header of the form
  Widget heading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          child: Text(" "),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10.0),
          child: Text('model number : $modelnumber \nEquipment number : $elnumber \nHour meter reading number : $hourmeter \nkilometer reading : $kmreader \nEquipment status : $equstatus \nDate of delivery : $dod \nSystem affected : $sysAffect \nRemarks : $remarks \nAddress : $address \nPincode : $pincode \nCity : $city \nState : $state \nNear By Station : $nearbyStation \nName of Incharge : $name \nPhone number : $phone',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ],
    );
  }

  // header of the form
  Widget inputField() {
    return Container(
      child: Stack(
      children: [
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 4,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
            right: 5,
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("10", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),
        ),
      ]
      ),
    );
  }
}

