import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hexcolor/hexcolor.dart';

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
      // You can replace this with actual reset logic
      _countdownTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
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
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: 
      Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Image.asset("Assets/verify2.png"), // Replace with your image path
            ),
          ),

      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16.0),
              const Center(
                child: Text(
                  'Please enter your email address. We will send a mail to your email address to reset your password.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      _timerValue >= 10 ? _timerValue.toString()[0] : '0',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      _timerValue >= 10 ? _timerValue.toString()[1] : _timerValue.toString(),
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  const Text(
                    '.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(width: 4.0),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isSendingEmail ? null : _sendResetEmail,
                child: _isSendingEmail
                    ? const CircularProgressIndicator()
                    : const Text('Send'),
              ),
            ],
          ),
        ),
      ),
        ],
      
      ),
    );
  }
}
