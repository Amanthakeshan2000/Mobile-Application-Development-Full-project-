import 'package:flutter/material.dart';
import 'package:mobile_application/pages/myCourse2.dart';
import 'pages/welcome_page.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCourse2(),
    );
  }
}