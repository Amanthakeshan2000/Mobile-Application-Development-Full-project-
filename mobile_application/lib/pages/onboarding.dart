import 'package:flutter/material.dart';
import 'package:mobile_application/pages/home_page_bar.dart';
import 'package:mobile_application/pages/signin.dart';
import 'package:mobile_application/pages/signup_page.dart';

class onboarding extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      image: 'assets/Maskgroup.png',
      title: 'course variety',
      description:
          'Immerse yourself in a diverse selection of courses that span a multitude of subjects. From arts and sciences to technology and business, our extensive course variety caters to learners of all interests and ambitions.',
    ),
    OnboardingData(
      image: 'assets/Mask33.png',
      title: 'Personalized learning paths',
      description:
          'Your learning journey is uniquely yours. Our platform tailors your path based on your skills, goals, and progress. With personalized recommendations and adaptive content, youll reach your learning milestones more effectively.',
    ),
    OnboardingData(
      image: 'assets/Mask44.png',
      title: 'Certification and Credentials',
      description:
          'Your dedication deserves recognition. Upon successfully completing courses, you ll earn certifications and credentials that validate your expertise. Showcase your achievements to employers and peers, opening doors to new opportunities.',
    ),

  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),

      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                data: _onboardingData[index],
              );
            },
          ),




          Positioned(
            top: 0,
            right: 16.0,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const SignInPage1()));
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                    (index) {
                      return _buildDotIndicator(index);
                    },
                  ),
                ),

                SizedBox(height: 20.0),

                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const SignInPage1()));
                      // Handle the action when the "Next" button is pressed on the last page
                    }
                  },
                  child: SizedBox(
                    width: 350,
                    height: 46,
                    child: Center(
                      child: Text(
                        _currentPage == _onboardingData.length - 1
                            ? 'Start'
                            : 'Next',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          data.image,
          height: 350.0,
          width: 400.0,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 20.0),
        Text(
          data.title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
