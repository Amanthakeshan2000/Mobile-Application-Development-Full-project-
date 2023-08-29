import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              _buildButton("Edit profile"),
              _buildButton("Verify account"),
              _buildButton("My courses"),
              _buildButton("My certificates"),
              _buildButton("My badge"),
              _buildButton("Setting"),
              _buildButton("LlSog out"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 235, 229, 229),
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonText,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Icon(Icons.arrow_forward_ios,
                color: const Color.fromARGB(255, 155, 150, 150)),
          ],
        ),
      ),
    );
  }
}
