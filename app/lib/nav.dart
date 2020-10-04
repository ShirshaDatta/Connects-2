import 'package:flutter/material.dart';
import 'package:Connects2/classJoin/classJoinMentor.dart';
import 'package:Connects2/classJoin/classJoinStudent.dart';
import 'package:Connects2/dashboard/dashboardExpanded.dart';
import 'package:Connects2/payment/payment_fail.dart';
import 'package:Connects2/payment/payment_success.dart';
import 'package:Connects2/payment/payments.dart';
import 'package:Connects2/dashboard/dashboard.dart';
import 'package:Connects2/dashboard/dashboardM.dart';
import 'coursesOverview/courseMentor.dart';
import 'coursesOverview/courseStudent.dart';
import 'home.dart';
import 'signin.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class M extends StatefulWidget {
  @override
  _MState createState() => _MState();
}

class _MState extends State<M> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    DashBoardExpandedPage(),
    ClassJoinStudent(),
    PaymentPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white70,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[300],
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), title: Text("Dashboard")
                //backgroundColor: Colors.black
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), title: Text("subscriptions")),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box), title: Text("menu")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("acc")),
          ],
        ));
  }
}
