import 'package:flutter/material.dart';
import 'package:Connects2/dashboard/dashboard.dart';
import 'package:Connects2/payment/payments.dart';

class PaymentFail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 250, 255, 1),
      body: Container(
        //color: Color.fromRGBO(238, 250, 255, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(100),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/failed.png'),
              )),
            ),
            Text("Payment failed."),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "payments");
                    },
                    child: Text("Try again"),
                    color: Color.fromRGBO(100, 210, 255, 1),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "m");
                    },
                    child: Text("Cancel"),
                    color: Color.fromRGBO(100, 210, 255, 1),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
