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
        title: const Text('Forgot Password'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
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
                Container( // Added Container around TextFormField
                width: 350,
                height: 40,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
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
                     icon: Icon(Icons.email),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Rest of the code remains unchanged
                  ],
                ),
                const SizedBox(height: 100.0),
                
                Container(
                  width: 350,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: _isSendingEmail ? null : _sendResetEmail,
                    child: _isSendingEmail
                        ? const CircularProgressIndicator()
                        : const Text('Send'),
                  ),
                ),
              ],
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
