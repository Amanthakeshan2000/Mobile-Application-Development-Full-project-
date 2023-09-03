import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Color.fromRGBO(0, 0, 0, 1),
          iconSize: 30.0,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.photo),
            color: Color.fromRGBO(0, 0, 0, 1),
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
    )
    );


  }
}
