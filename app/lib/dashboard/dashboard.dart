//import 'dart:developer';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart'  as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../charts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
 Future<http.Response> fetchcourses() {
    return http.get(
      'https://connects2.uc.r.appspot.com/course/fetch',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
  @override

  void  initState () {
    super.initState();
    //FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark)
    StatusBar.color(Colors.blue);
    _initializePage() ;
  }
  void _initializePage() async{
    var data= await fetchcourses();
    final parsed = jsonDecode(data.body);
    var courses = parsed["payload"]["payload"]["courses"];
    print(courses);
    for(var i=0;i<courses.length;i++)
    {
      print(courses[i]["courseName"]);

    }
  }

  int _current = 0;
  List imgList = [
    'https://11daksh11.github.io/Fluuter/folder/Java-Debugging-Tips-881x441.jpg',
    'https://11daksh11.github.io/Fluuter/folder/bitcoin-price-prediciton-using-machine-learning.webp',
    'https://11daksh11.github.io/Fluuter/folder/devOps.png',
    'https://11daksh11.github.io/Fluuter/folder/docky.png',
    'http://11daksh11.github.io/Fluuter/folder/download.png',
  ];

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
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
      body: Column(
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
          Container(height: 150, 
          child: ListView(
            children: [
              ListTile(
        dense: true,
        leading: Text("01"),
        title: Text("Intoduction to Java"),
        trailing: Icon(Icons.alarm),
      ),
       ListTile(
        dense: true,
        leading: Text("02"),
        title: Text("Software Tools Setup"),
        trailing: Icon(Icons.alarm),
      ), ListTile(
        dense: true,
        leading: Text("03"),
        title: Text("Starting with variables and expressions"),
        trailing: Icon(Icons.alarm),
      ), ListTile(
        dense: true,
        leading: Text("04"),
        title: Text("Control Flow Statements"),
        trailing: Icon(Icons.alarm),
      ), ListTile(
        dense: true,
        leading: Text("05"),
        title: Text("OOP's in Java"),
        trailing: Icon(Icons.alarm),
      ), ListTile(
        dense: true,
        leading: Text("06"),
        title: Text("Concurrency in Java"),
        trailing: Icon(Icons.alarm),
      ), ListTile(
        dense: true,
        leading: Text("07"),
        title: Text("Databases"),
        trailing: Icon(Icons.alarm),
      ), ListTile(
        dense: true,
        leading: Text("07"),
        title: Text("Debugging and Unit Testing"),
        trailing: Icon(Icons.alarm),
      ), ListTile(
        dense: true,
        leading: Text("08"),
        title: Text("Final Test"),
        trailing: Icon(Icons.alarm),
      ),
            ],
          ), 
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: new Text(
              //Courses Enrolled
              "Courses Enrolled",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontSize: 20,
                color: Colors.blue[600],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            height: 200,
            initialPage: 0,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            reverse: false,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            items: imgList.map((imgURl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: () {
                        print("object");
                      },
                      child: Image.network(
                        imgURl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}