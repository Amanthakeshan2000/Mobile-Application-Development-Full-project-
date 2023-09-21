import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Congratulations Page'),
        ),
        body: CongratulationsPage(),
      ),
    );
  }
}

class CongratulationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image1.jpg', // Replace with your image asset path
            width: 250,
            height: 250,
          ),
          Text(
            'Congratulations!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Sed et semper elit. Integer id rhoncus libero. '
              'Suspendisse sed vehicula nunc. Ut ut nisl at mauris pretium '
              'eleifend in a urna.',
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Next Topic',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            'assets/image2.png', // Replace with your image asset path
            width: 150,
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the Share button
                },
                child: Text('Share'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the Download button
                },
                child: Text('Download'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
