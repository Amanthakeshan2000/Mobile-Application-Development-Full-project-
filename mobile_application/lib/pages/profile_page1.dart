import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProfileProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class UserProfileProvider with ChangeNotifier {
  String userName = "Kaveesha Madhushani";
  String profileImageUrl = "your_default_profile_image_url_here";

  void updateProfile(String name, String imageUrl) {
    userName = name;
    profileImageUrl = imageUrl;
    notifyListeners();
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileInfo(userProfile),
              const SizedBox(height: 20),
              _buildButton("Edit profile"),
              _buildButton("Verify account"),
              _buildButton("My courses"),
              _buildButton("My certificates"),
              _buildButton("My badge"),
              _buildButton("Setting"),
              _buildButton("Log out"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(UserProfileProvider userProfile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(userProfile.profileImageUrl),
          radius: 30,
        ),
        const SizedBox(width: 10),
        Text(
          userProfile.userName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String buttonText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 235, 229, 229),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(
              vertical: 8, horizontal: 16), // Adjust padding here
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 155, 150, 150)),
          ],
        ),
      ),
    );
  }
}
