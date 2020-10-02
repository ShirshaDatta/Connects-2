import 'package:flutter/material.dart';

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
        border: Border(
          bottom: BorderSide(width: 3.0, color: Colors.lightBlue[100]),
        ),
      ),
      child: ListTile(
        dense: true,
        leading: Text(listItems[index]),
        title: Text("Intoduction"),
        trailing: Icon(Icons.alarm_outlined),
      ),
    );
  });
  return listview;
}

class CourseView extends StatefulWidget {
  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(
                      "Overveiw",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sed facilisis purus. Fusce aliquet pellentesque risus, ac maximus ipsum vehicula eu. Pellentesque ac nisi fermentum, fermentum justo eget, condimentum lorem. Sed gravida risus eget nibh facilisis efficitur vel ac odio.",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  width: 150,
                  //padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(100, 210, 255, 1),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('assets/java_logo.png'),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          new Text(
            "Course Schedule",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          new Container(
            height: 230,
            child: getListView(),
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
    );
  }
}
