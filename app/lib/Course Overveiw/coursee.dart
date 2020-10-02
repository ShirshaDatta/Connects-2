import 'package:flutter/material.dart';

class CourseView extends StatefulWidget {
  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new FlatButton(
              onPressed: () {
                print("Go BAck");
              },
              child: Text(
                "< Back To Catalogue",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            Column(
              children: [
                Center(
                  child: new Text(
                    "Java Introduction",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text("By- Bryan Eve "),
                    SizedBox(
                      width: 25,
                    ),
                    new Text("\$5"),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Column(
                  children: [
                    Text(
                      "Overveiw",
                      style: TextStyle(font),
                    ),
                    Text("Overveuiw"),
                  ],
                ),
                Container(
                  height: 100,
                  width: 100,
                  //padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(100, 210, 255, 1),
                        width: 1.5,
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/java_logo.png'),
                          fit: BoxFit.cover)),
                ),
              ],
            )
          ],
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
