// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_application/pages/forget.dart';

import 'package:mobile_application/pages/home_page_bar.dart';
import 'package:mobile_application/pages/signup_page.dart';
import 'package:mobile_application/pages/welcome_page.dart';

//import 'home_page_bar.dart';

class SignInPage1 extends StatelessWidget {
  const SignInPage1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHomePage();
          } else {
            return SignInPage();
          }
        },
      ),
    );
  }
}


class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SignInForm(),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {

  final emailController1 = TextEditingController();
  final passwordController1 = TextEditingController();

  @override
  void dispose() {
    emailController1.dispose();
    passwordController1.dispose();
    //super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset(
                "assets/Msignin.png", // Replace with your image path
                width: 243,
                height: 243,
              ),
              Center(
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController1,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Invalid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController1,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      // Toggle password visibility
                    },
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: false, // Add logic to manage "Remember me" state
                    onChanged: (value) {
                      // Handle "Remember me" checkbox state
                    },
                  ),
                  Text('Remember me'),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => foget()));
                    },
                    child: Text('Forgot Password'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton

                (
                onPressed: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => MyHomePage()));
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController1.text.trim(),
                      password: passwordController1.text.trim());
                },
                child: SizedBox(
                  width: 350,
                  height: 46,
                  child: Center(
                    child: Text('Sign In'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('or login with'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.g_translate),
                    onPressed: () {
                      // Handle Google sign-in
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.business),
                    onPressed: () {
                      // Handle Microsoft sign-in
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => signUP()));
                  // Navigate to the Sign Up page
                },
                child: Text(
                  "Don't have an account?",

                  style: TextStyle(

                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
