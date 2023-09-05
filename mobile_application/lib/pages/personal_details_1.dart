// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Make the app bar transparent
          elevation: 0, // Remove the shadow
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black, // Set arrow button color to black
            ),
            onPressed: () {
              Navigator.pop(context); // Add back functionality
            },
          ),
          title: Text(
            "Personal Details",
            style: TextStyle(
              color: Colors.black, // Set text color to black
              fontSize: 20.0,
              fontFamily: 'Poppins', // Set the font family to Poppins
              fontWeight: FontWeight.w600, // Set font weight to semi-bold
            ),
          ),
          centerTitle: true, // Center align the title
        ),
        body: (Container(
            margin: EdgeInsets.fromLTRB(0, 0, 1, 14),
            constraints: BoxConstraints(maxWidth: 320),
            child: Text(
              "Your personal information will helps our service to reach you easily",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ))));
  }
}
