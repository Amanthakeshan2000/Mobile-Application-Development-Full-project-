import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<OnboardingData> _onboardingData = [
    OnboardingData(
      image: 'Assets/Mask group.png',
      title: 'course variety',
      description:
          'Immerse yourself in a diverse selection of courses that span a multitude of subjects. From arts and sciences to technology and business, our extensive course variety caters to learners of all interests and ambitions.',
    ),
    OnboardingData(
      image: 'Assets/Mask33 .png',
      title: 'Personalized learning paths',
      description:
          'Your learning journey is uniquely yours. Our platform tailors your path based on your skills, goals, and progress. With personalized recommendations and adaptive content, youll reach your learning milestones more effectively.',
    ),
    OnboardingData(
      image: 'Assets/Mask44.png',
      title: 'Certification and Credentials',
      description:
          'Your dedication deserves recognition. Upon successfully completing courses, you ll earn certifications and credentials that validate your expertise. Showcase your achievements to employers and peers, opening doors to new opportunities.',
    ),
    OnboardingData(
      image: 'Assets/page4_image.png',
      title: 'homepage',
      description: 'This is a the fourth m page.',
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
      appBar: AppBar(
        title: Text('Onboarding App'),
      ),
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
            top: 16.0,
            right: 16.0,
            child: TextButton(
              onPressed: () {
                // Handle the skip button action
              },
              child: Text(
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
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Handle the action when the "Next" button is pressed on the last page
                    }
                  },
                  child: Text(
                    _currentPage == _onboardingData.length - 1
                        ? 'Start'
                        : 'Next',
                    style: TextStyle(fontSize: 18.0),
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
