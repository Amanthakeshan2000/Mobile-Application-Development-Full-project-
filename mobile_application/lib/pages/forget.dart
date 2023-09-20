import 'package:flutter/material.dart';
import 'dart:async';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isSendingEmail = false;
  int _timerValue = 10;
  late Timer _countdownTimer;

  void _sendResetEmail() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSendingEmail = true;
      });

      // Simulate sending reset email
      // can replace this with actual reset logic
      _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_timerValue > 0) {
          setState(() {
            _timerValue--;
          });
        } else {
          timer.cancel();
          setState(() {
            _isSendingEmail = false;
          });
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent successfully')),
      );
    }
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set background color to white
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.black, // Set text color to black
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Image.asset("Assets/verify2.png"), // Replace with your image path
                ),
              ),
              const SizedBox(height: 16.0),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Please enter your email address.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'We will send a mail to your email address to',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'reset your password.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0,         // Border width
                        ),
                        borderRadius: BorderRadius.circular(4.0), // Adjust the border radius
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          border: InputBorder.none, // Remove the default input border
                          icon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: _isSendingEmail ? null : _sendResetEmail,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: _isSendingEmail
                  ? const CircularProgressIndicator()
                  : const Text('Send'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ForgotPasswordPage()));
}
