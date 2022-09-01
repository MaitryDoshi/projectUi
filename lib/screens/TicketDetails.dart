import 'package:flutter/material.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TicketDetailsState();
  }
}

//For stateful widget we need a state class

class TicketDetailsState extends State<TicketDetails> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: const EdgeInsets.all(10.0),
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Form(
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      heading(),
                      inputField(),
                      div(),
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

  // header of the form
  Widget inputField() {
    return Container(
      child: Stack(
          children: [
            Container(
             child: Row(
               children: <Widget>[
                 Positioned(
                   top: 5,
                   left: 5,
                   child: Container(
                     alignment: Alignment.center,
                     height: 130,
                     width: 70,
                     decoration: BoxDecoration(
                       color: Colors.greenAccent,
                       borderRadius: BorderRadius.circular(5),),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text("26", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                         Text("July", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                       ],
                     ),
                   ),
                 ),
                 VerticalDivider(thickness: 2, color: Colors.blueAccent,),
                 Positioned(
                   top: 5,
                   left: 200,
                   child: Container(
                     padding: EdgeInsets.only(left: 0.0),
                     height: 130,
                     width: 280,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(5),),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text("System Affected - Transmission", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                          Padding(padding: EdgeInsets.all(5.0)),
                          Text("Meter Reading - 900 Hrs", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                         Padding(padding: EdgeInsets.all(5.0)),
                         Text("Equipment Status - Off Road", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                         Padding(padding: EdgeInsets.all(5.0)),
                         Text("Ticket Status - Open", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                       ],
                     ),
                   ),
                 ),
             ])
            )
          ]
      ),
    );
  }

  // divider
  Widget div() {
    return Divider(
      thickness: 1,
      color: Colors.black,
    );
  }
}
