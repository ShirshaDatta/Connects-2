
//import 'dart:js';

import 'package:Connects2/payments.dart';
import 'course.dart';
import 'dashboard.dart';
import 'home.dart';
import 'signin.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();


  runApp(MaterialApp(
    initialRoute: "course",
    routes: {
      "home" : (context) => HomePage(),
      "signup" : (context) => Signuppage(),
      "signin" : (context) => SignInPage(),
      "dashboard" :(context) => DashboardPage(),
      "course" :(context) => CoursePage(),
      "payments" :(context) => PaymentPage(),
    },
    debugShowCheckedModeBanner: false,
    )
  );
 }


