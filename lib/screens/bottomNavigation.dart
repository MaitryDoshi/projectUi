import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ebook/screens/profilePage.dart';
import 'package:ebook/screens/ticketPage.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'dashboardPage.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPage(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBody() {
    return Center(
      child: Text("Bottom Navigation Bar",
        style: TextStyle(
          fontSize: 32.0,
        ),
      textAlign: TextAlign.center,),
    );
  }

  Widget buildPage() {
    switch (index){
      case 1 :
        return TicketPage();
      case 2 :
        return DashboardPage();
      case 3 :
        return ProfilePage();
      case 0 :
      default:
        return HomePage();
    }
  }

  Widget buildBottomNavigation() {
    return BottomNavyBar(
      itemCornerRadius: 20.0,
      backgroundColor: Colors.black,
      containerHeight: 80,
      selectedIndex: index,
      onItemSelected: (index) {
        setState(() {
          this.index = index;
        });
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.apps, color: Colors.white,),
          title: Text("Home"),
          activeColor: Colors.green,
          inactiveColor: Colors.black,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.airplane_ticket_outlined, color: Colors.white),
            title: Text("Ticket"),
          activeColor: Colors.orange,
          inactiveColor: Colors.black,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.dashboard_outlined,color: Colors.white),
          title: Text("Dashboard"),
          activeColor: Colors.yellow,
          inactiveColor: Colors.black,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person,color: Colors.white),
          title: Text("Profile"),
          activeColor: Colors.red,
          inactiveColor: Colors.black,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
