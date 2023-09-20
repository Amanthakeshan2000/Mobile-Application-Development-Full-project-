import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_application/pages/profile_page1.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProfileProvider(), // Initialize UserProfileProvider
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileScreen(),
    );
  }
}

