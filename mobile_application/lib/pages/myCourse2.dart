import 'package:flutter/material.dart';

class MyCourse2 extends StatelessWidget {
  const MyCourse2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Courses',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Lesson 3 | Quiz',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Question 01',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0, // Increase the font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
