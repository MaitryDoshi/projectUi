import 'package:flutter/material.dart';

class GenInspection extends StatefulWidget {
  const GenInspection({Key? key}) : super(key: key);

  @override
  State<GenInspection> createState() => _GenInspectionState();
}

class _GenInspectionState extends State<GenInspection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0, left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("GENERAL INSPECTION", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(5.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Equipment Model  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Manual SL No  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Hour Meter Reading  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Kilometer Reading  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Equipment Status  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("System Affected  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Remark/Symptoms  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Location of Equipment  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Address  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Pincode  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("City  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("District  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Status  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Near Railway Station ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Name  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Mobile Number  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("Telephone Number  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                      ],
                    )
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal:10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("-  Nitu Sharma", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  0", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  0", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  Nitu Sharma", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  Not applicable", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  Nitu Sharma", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  8899768567", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("-  ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                      ],
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
