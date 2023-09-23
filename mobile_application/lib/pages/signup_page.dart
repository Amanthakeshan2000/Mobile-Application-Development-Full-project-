// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:mobile_application/pages/signin.dart';

class signUP extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  signUP({super.key});
  get obscureText => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(

          child: SingleChildScrollView(

            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/signup.png",
                            height: 243,
                            width: 243,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
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
                          controller: passwordController,
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
                            if (value!.isEmpty || value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Re-enter Password',
                            hintText: 'Re-enter your password',
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
                            if (value!.isEmpty || value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // FirebaseAuth.instance.createUserWithEmailAndPassword(
                              //     email: emailController.text.trim(),
                              //     password: passwordController.text.trim());

                              var userEmail = emailController.text.trim();
                              var userPassword = emailController.text.trim();

                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: userEmail, password: userPassword)
                                  .then((value) =>{

                              });
                            },
                            child: SizedBox(
                              width: 350,
                              height: 46,
                              child: Center(
                                child: Text(
                                    'Sign Up'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 300,
                        ),
                        Center(child: Text('or sign up with')),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.g_translate),
                              onPressed: () {
                                // Handle Google sign-up
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.business),
                              onPressed: () {
                                // Handle Microsoft sign-up
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => SignInPage1()));
                          },
                          child: Center(
                            child: Text(
                              'Already have an account?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
