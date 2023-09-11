import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  double fem = 1.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          const Image(
            image: AssetImage('assets/welcome.png'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Centered Content
          Center(
            child: AnimatedCircles(fem: fem, controller: _controller),
          ),
        ],
      ),
    );
  }
}

class AnimatedCircles extends StatelessWidget {
  final double fem;
  final AnimationController controller;

  AnimatedCircles({required this.fem, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 194 * fem,
        height: 194 * fem,
        decoration: BoxDecoration(
          color: Color(0x8906ee6a),
          borderRadius: BorderRadius.circular(97 * fem),
        ),
        child: Stack(
          children: [
            // First Circle
            Positioned(
              left: 15 * fem,
              top: 15 * fem,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: controller.value * 2 * 3.141592653589793,
                    child: child,
                  );
                },
                child: Container(
                  width: 164 * fem,
                  height: 164 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(82 * fem),
                    color: Color(0xff06ee6a),
                  ),
                ),
              ),
            ),

            // Second Circle
            Positioned(
              left: 27 * fem,
              top: 27 * fem,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: controller.value * 2 * 3.141592653589793,
                    child: child,
                  );
                },
                child: Container(
                  width: 140 * fem,
                  height: 140 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70 * fem),
                    color: Color(0xff049cec),
                  ),
                ),
              ),
            ),

            // Third Circle
            Positioned(
              left: 40 * fem,
              top: 40 * fem,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: controller.value * 2 * 3.141592653589793,
                    child: child,
                  );
                },
                child: Container(
                  width: 114 * fem,
                  height: 114 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(57 * fem),
                    color: Color(0xff001863),
                  ),
                ),
              ),
            ),

            // Fourth Circle (Centered)
            Positioned(
              left: 56 * fem,
              top: 56 * fem,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: controller.value * 2 * 3.141592653589793,
                    child: child,
                  );
                },
                child: Container(
                  width: 81 * fem,
                  height: 81 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.5 * fem),
                    color: Color(0xff001863),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/Skillup.png', // Add your Skillup image asset
                      width: 40 * fem,
                      height: 40 * fem,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
