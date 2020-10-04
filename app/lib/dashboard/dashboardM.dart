import 'dart:developer';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../charts.dart';
//import 'charts.dart';
import 'package:statusbar/statusbar.dart';

List<String> getListElements() {
  var x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  var y = [
    "Introduction to java",
    "FLutter Basica",
    "Artificial Inteligence",
    "Machine Leanring",
  ];
  var ww = List<String>.generate(30, (counter) => "$counter");

  return ww;
}

int lis = 0;

Widget getListView() {
  var listItems = getListElements();
  var listview = ListView.builder(itemBuilder: (context, index) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        dense: true,
        leading: Text(listItems[index]),
        title: Text("Intoduction to Java"),
        trailing: Icon(Icons.alarm),
      ),
    );
  });
  return listview;
}

//import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class DashboardPageM extends StatefulWidget {
  @override
  _DashboardPageMState createState() => _DashboardPageMState();
}

class _DashboardPageMState extends State<DashboardPageM> {
  @override
  void initState() {
    super.initState();
    //FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark)
    StatusBar.color(Colors.blue);
  }

  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
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
                  Icons.add_alert,
                  color: Colors.blue,
                ),
                onPressed: () {
                  print("object");
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                //Weekly Progress Tab
                Center(
                  child: new Text(
                    "Weekly Progress",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      color: Colors.blue[600],
                    ),
                  ),
                ),
                Center(child: chart()),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: new Text(
                    "Schedule",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      color: Colors.blue[600],
                    ),
                  ),
                ),
                Container(height: 150, child: getListView()),
                SizedBox(
                  height: 1,
                ),
                Center(
                  child: new Text(
                    //Courses Enrolled
                    "Laderboards",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      color: Colors.blue[600],
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  child: Image.asset("assets/LeB.png"),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
