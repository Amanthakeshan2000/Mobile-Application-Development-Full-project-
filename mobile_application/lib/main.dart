import 'package:flutter/material.dart';
import 'package:mad_project/pages/forget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ForgotPasswordPage(),
    );
  }
}
