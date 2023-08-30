import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
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
    );
  }
}
