import 'package:flutter/material.dart';
import 'package:Connects2/dashboard/dashboardM.dart';

class ClassJoinMentor extends StatefulWidget {
  @override
  _ClassJoinMentorState createState() => _ClassJoinMentorState();
}

class _ClassJoinMentorState extends State<ClassJoinMentor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  child: Text(
                    "< Dashboard",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "dashboardM");
                  },
                )),
            Text(
              "Java Introduction",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(0, 172, 250, 1),
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              "By- Bryan Eve",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontStyle: FontStyle.italic,
              ),
            ),
            Container(
              height: 300,
              width: 350,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  //padding: EdgeInsets.all(10),
                  child: Text(
                    "Session Agenda",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Container(
                    // padding: EdgeInsets.all(10),
                    child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    decoration: TextDecoration.underline,
                  ),
                )),
              ],
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sed facilisis purus. Fusce aliquet pellentesque risus, ac maximus ipsum vehicula eu. Pellentesque ac nisi fermentum, fermentum justo eget, condimentum lorem. Sed gravida risus eget nibh facilisis efficitur vel ac odio.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 300,
                child: FlatButton(
                  onPressed: () {},
                  //padding: EdgeInsets.all(50),
                  child: Text("Start Session"),
                  color: Color.fromRGBO(100, 210, 255, 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
