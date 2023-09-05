// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'pages/personal_details_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}
