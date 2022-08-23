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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("GENERAL INSPECTION", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18),textAlign: TextAlign.left,),
                SizedBox(height: 10.0,),
                Text("Equipment Model              -    Nitu Sharma", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Manual SL No                    -   ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Hour Meter Reading         -    0", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Kilometer Reading            -    0", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Equipment Status             -    Nitu Sharma", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("System Affected               -    ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Remark/Symptoms          -    Not applicable", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Location of Equipment    -   ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Address                              -    ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Pincode                              -    ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("City                                      -    ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("District                                -    ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Status                                 -    ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Near Railway Station       -    ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Name                                 -    Nitu Sharma", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Mobile Number                -    8899768567", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.all(2.0)),
                Text("Telephone Number         -    ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
