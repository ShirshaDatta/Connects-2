import 'package:Connects2/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:statusbar/statusbar.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardno;
  String name;
  String cvv;
  String expdate; 

   @override
  void initState() {
    super.initState();
    StatusBar.color(Color.fromRGBO(90, 200, 250, 1)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 250, 255, 1),
      body: Container(
        //color: Colors.blue,
        //width: 300,
        //height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            TextField(
                decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Card Holder's name"
                    ),
                    onChanged: (value){
                        name = value;
                      },
                    ),
                TextField(
                decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Card-number"
                    ),
                    onChanged: (value){
                        cardno = value;
                      },
                    ),
                 Row(
                   children: <Widget>[
                     Container(
                       width: 200,
                       child: TextField(
                         decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "CVV"
                    ),
                    onChanged: (value){
                          cvv = value;
                        },
                       ),
                     ),
                      Container(
                        width: 200,
                        child: TextField(
                decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "MM/YYYY"
                    ),
                    onChanged: (value){
                          expdate = value;
                        },
                    ),
                   ),
                  ],
                )  ,
             SizedBox(
               width: 200,
                  child: FlatButton(onPressed: (){
                    Navigator.pushNamed(context, "dashboard");
                  }, 
                  child: Text("Confirm"),
                  
                  color: Color.fromRGBO(100, 210, 255, 1),  
                   ),
                ),
                 FlatButton(onPressed: (){
                   Navigator.pushNamed(context, "dashboard");
                   print('hello');
                   }, 
                   child: Text('Cancel Payment'),
                   ),     
          ],
        ),
      ),
    );
  }
}