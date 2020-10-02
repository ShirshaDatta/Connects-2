//import 'package:Connects2/courses/courseMentor.dart';
//import 'package:Connects2/courses/courseStudent.dart';
//import 'dart:js';

import 'package:Connects2/Course%20Overveiw/coursee.dart';
import 'package:Connects2/classJoin/classJoinMentor.dart';
import 'package:Connects2/classJoin/classJoinStudent.dart';
import 'package:Connects2/payment/payment_fail.dart';
import 'package:Connects2/payment/payment_success.dart';
import 'package:Connects2/payment/payments.dart';
import 'package:Connects2/dashboard/dashboard.dart';
import 'package:Connects2/dashboard/dashboardM.dart';
import 'coursesOverview/courseMentor.dart';
import 'coursesOverview/courseStudent.dart';
import 'home.dart';

import 'signin.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: "classjoinStudent",
    routes: {
      "home": (context) => HomePage(),
      "signup": (context) => Signuppage(),
      "signin": (context) => SignInPage(),
      "dashboard": (context) => DashboardPage(),
      "dashboardM": (context) => DashboardPageM(),
      "courseStudent": (context) => CoursePageStudent(),
      "courseveiw": (context) => CourseView(),
      "courseMentor": (context) => CoursePageMentor(),
      "classjoinMentor": (context) => ClassJoinMentor(),
      "classjoinStudent": (context) => ClassJoinStudent(),
      "payments": (context) => PaymentPage(),
      "paymentfail": (context) => PaymentFail(),
      "paymentsuccess": (context) => PaymentSuccess(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
