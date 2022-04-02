import 'screens/bmi_body.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light(primary: Color(0xFF0A0E21)),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(bodyText2: TextStyle(color: Color(0xFFFFFFFF))),
      ),
      home: InputPage(),
    );
  }
}
