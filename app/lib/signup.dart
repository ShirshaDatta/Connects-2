import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:statusbar/statusbar.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart'  as http;
//import 'dart:convert' as convert;

class Signuppage extends StatefulWidget {
  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  var authc = FirebaseAuth.instance;

  String email, password, name, username;

  @override
  void initState() {
    super.initState();
    StatusBar.color(Color.fromRGBO(90, 200, 250, 1));
  }

Future<http.Response> signup(uid) {
    return http.post(
      'https://connects2.uc.r.appspot.com/user/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${uid}'
      },
      body: jsonEncode(<String, String>{
         "email" : email,
          "uid" : uid,
          "name" : name,
          "username": username,
          "mentor" : "false",
      }),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(238, 250, 255, 1),
      body: Container(
        //color: Color.fromRGBO(238, 250, 255, 1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              /* decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/login.png'),
                      fit: BoxFit.cover
                    )
                  ),
              ),*/
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter Full Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              //),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter Username'),
                onChanged: (value) {
                  username = value;
                },
              ),
              //),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter Email'),
              ),
              //),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                autocorrect: false,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter Password'),
              ),
              SizedBox(
                width: 300,
                child: FlatButton(
                  /*onPressed: (){
                         Navigator.pushNamed(context, "dashboard");
                       },*/
                  onPressed: () async {
                    print(email);
                    // print(username);
                    print(password);
                    // print(name);
                    try {
                      var user = await authc.createUserWithEmailAndPassword(
                          email: email, password: password);
                      print(email);
                      print(password);
                      print(user.user.uid);
                      if (user.additionalUserInfo.isNewUser == true) {
                       var data =  await signup(user.user.uid);
                       print(data);
                        Navigator.pushNamed(context, "m");
                      }
                    } catch (e) {
                      String error = e.toString();
                      Toast.show(error, context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

                      print(e);
                    }
                  },
                  //padding:EdgeInsets.all(20),
                  child: Text("Sign Up"),
                  color: Color.fromRGBO(100, 210, 255, 1),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "signin");
                  print('hello');
                },
                child: Text('Already have an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
