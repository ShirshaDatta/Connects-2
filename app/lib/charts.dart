import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class details {
  final String days;
  final String hours;
  final charts.Color linecolor;

  details({
    @required this.days,
    @required this.hours,
    @required this.linecolor,
  });
}

class chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 75,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/11.png"))),
    );
  }
}