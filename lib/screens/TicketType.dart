
import 'package:flutter/material.dart';

import 'Breakdown.dart';
import 'DesignModification.dart';
import 'ErectionCommission.dart';
import 'GeneralInspection.dart';
import 'PeriodicMaintenance.dart';
import 'PrevantiveMaintenance.dart';
import 'ServiceforSparePurchase.dart';
import 'Subassembly.dart';
import 'initcommissionreg.dart';

class TicketType extends StatefulWidget {
  const TicketType({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TicketTypeState();
  }
}

//For stateful widget we need a state class

class TicketTypeState extends State<TicketType> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
                width: double.infinity,
                child: DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blueAccent),
                    child: Text(
                    "Menu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  )),
              ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
              ListTile(
                leading: Icon(Icons.miscellaneous_services_rounded),
                title: Text("Services"),
              ),
          ],
        ),
        ),
      ),
      appBar: AppBar(
        title: Text("Ticket Type",),
        actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.sort))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.design_services_sharp),
                title: Text("PRE-DELIVERY"),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Initcommissionreg()),);},),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.design_services_sharp),
                title: Text("ERECTION AND COMMISSIONING"),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ErectionCommission()),);},),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.design_services_sharp),
                title: Text("PERIODIC MAINTENANCE"),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PeriodicMaintenance()),);},),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.design_services_sharp),
                title: Text("PREVENTIVE MAINTENANCE"),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrevantiveMaintenance()),);},),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.design_services_sharp),
                title: Text("BREAKDOWN"),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Breakdown()),);},),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.design_services_sharp),
                title: Text("GENERAL INSPECTION"),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeneralInspection()),);},
              ),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.design_services_sharp),
                title: Text("INSTALLATION OF SUB ASSEMBLY FITMENT"),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Subassembly()),);},),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.design_services_sharp),
                title: Text("SERVICE FOR SPARES PURCHASED"),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceforSparePurchase()),);},),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.design_services_sharp),
                title: Text("DESIGN MODIFICATION"),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DesignModification()),);},),
              Divider(thickness: 1),
            ],
          ),
        ),
      ),
    );
  }

}
