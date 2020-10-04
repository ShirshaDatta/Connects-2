import 'package:Connects2/dashboard/dashboard.dart';
import 'package:Connects2/payment/payment_fail.dart';
import 'package:Connects2/payment/payment_success.dart';
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
    StatusBar.color(Color.fromRGBO(90, 200, 250, 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromRGBO(238, 250, 255, 1),
      body: Container(
        //color: Colors.blue,
        //width: 300,
        //height: 300,
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/login.png'),
                          fit: BoxFit.fill)),
                  //child: Image.asset('assets/login.png'),
                ),
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Card Holder's name"),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
              
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Card-number"),
                onChanged: (value) {
                  cardno = value;
                },
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 195,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "CVV"),
                      onChanged: (value) {
                        cvv = value;
                      },
                    ),
                  ),
                  Container(
                    width: 195,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "MM/YYYY"),
                      onChanged: (value) {
                        expdate = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "paymentsuccess");
                  },
                  child: Text("Confirm"),
                  color: Color.fromRGBO(100, 210, 255, 1),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "paymentfail");
                  print('hello');
                },
                child: Text('Cancel Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
