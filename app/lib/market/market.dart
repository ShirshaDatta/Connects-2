import 'package:flutter/material.dart';

class market extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: TextField(
            autocorrect: true,
            decoration: InputDecoration(
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(8),
              hintText: 'Search courses',
              prefixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blue, width: 1.5),
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.add_alert_outlined,
                color: Colors.blue,
              ),
              onPressed: () {
                print("object");
              },
            ),
          ],
        ),
        body: Column(
          children: [],
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
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
                icon: Icon(Icons.menu_book_outlined), title: Text("menu")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("acc")),
          ],
        ),
      ),
    );
  }
}
