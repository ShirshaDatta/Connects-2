import 'package:flutter/material.dart';
import 'package:Connects2/dashboard/dashboard.dart';
import 'package:Connects2/coursesOverview/courseStudent.dart';

class PaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/success.png'),
            )),
          ),
          Center(
              child: Container(
                  padding: EdgeInsets.all(50),
                  child: Text(
                      "Thank you. Payment request processed successfully",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),)
                      )
                      ),
          SizedBox(
            width: 200,
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "m");
              },
              child: Text("Back to Dashboard",
              style: TextStyle(
                fontSize: 15,
              ),),
              color: Color.fromRGBO(100, 210, 255, 1),
            ),
          )
        ],
      ),
    );
  }
}
