import 'package:flutter/material.dart';
import 'package:mobile_application/pages/reset_password_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Reset Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PasswordResetPage(),
    );
  }
}

