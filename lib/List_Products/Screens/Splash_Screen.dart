import 'package:flutter/material.dart';

import 'Home_Screen.dart';





// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: SplashScreen(),
//   ));
// }

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();


    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Adjust based on your theme
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Shopee",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade900, // Blue color for "Students"
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
