import 'package:flutter/material.dart';

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
          padding: EdgeInsets.all(10.0),
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
    return ListView(

    );
}
