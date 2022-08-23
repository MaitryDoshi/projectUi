import 'package:ebook/screens/GeneralInspection.dart';
import 'package:flutter/material.dart';

import 'GenInspection.dart';

class TicketList extends StatefulWidget {
  const TicketList({Key? key}) : super(key: key);

  @override
  State<TicketList> createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Ticket List",
          style: TextStyle(
              fontSize: 14.0,
              color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("OPEN TICKET",
                      style: TextStyle(
                          fontSize: 14.0, fontFamily: 'Sfpro'),),
                    Text("CLOSE TICKET",
                      style: TextStyle(
                          fontSize: 14.0, fontFamily: 'Sfpro'),),
                    Text("PROGRESS TICKET",
                      style: TextStyle(
                          fontSize: 14.0, fontFamily: 'Sfpro'),),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(alignment: Alignment.center,
                      child: Text("3",
                      style: TextStyle(
                          fontSize: 14.0, fontFamily: 'Sfpro'),textAlign: TextAlign.right,),),
                    Align(alignment: Alignment.center,
                      child: Text("0",
                        style: TextStyle(
                            fontSize: 14.0, fontFamily: 'Sfpro'),textAlign: TextAlign.right,),),
                    Align(alignment: Alignment.center,
                      child: Text("0",
                        style: TextStyle(
                            fontSize: 14.0, fontFamily: 'Sfpro'),textAlign: TextAlign.right,),),
                  ],
                ),
              ),
              divider(),
              listingview(),
            ],
          ),
        ),
      ),
    );
  }
  //divider
  Widget divider() {
    return Divider(
      thickness: 2,
    );
  }

  //Listview
  Widget listingview() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Row(
              children: [
                VerticalDivider(
                  thickness: 2,
                  color: Colors.blue,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(child: Text("Nitu Sharma-", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18),textAlign: TextAlign.left,),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const GenInspection()));},),
                          Padding(padding: EdgeInsets.all(2.0)),
                          Text("Meter Reading        -    Transmission", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                          Padding(padding: EdgeInsets.all(2.0)),
                          Text("Purpose                   -    REHABILITATION", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                          Padding(padding: EdgeInsets.all(2.0)),
                          Text("Location                  - ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                          Padding(padding: EdgeInsets.all(2.0)),
                          Text("Seq Req                   -    2022-08-23", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                          Padding(padding: EdgeInsets.all(2.0)),
                          Text("Ticket Status          - ", style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,),
                        ],
                      )
                    ],
                  ),
                ),
            ]),
          ),
        ]),
    );
  }
}