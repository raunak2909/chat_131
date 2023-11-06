// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talklytic/Screen/Auth/Data/color_constants.dart';
import 'package:talklytic/Screen/Auth/Screens/Responsive/mobile_view.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String text = '';
  int currIndex = 0;
  final String quoteText = '"In a world of pixels, be the one who clicks."';

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _startTypingAnimation();
     homepageRoute();
    super.initState();
  }

  void _startTypingAnimation() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (currIndex < quoteText.length) {
        setState(() {
          text += quoteText[currIndex];
          currIndex++;
        });
        _startTypingAnimation();
      }
     
    });
    
  }

  void homepageRoute() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MobileAuthScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorConstants.whiteShade,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1),
              AvatarGlow(
                glowColor: Colors.grey,
                endRadius: 100,
                duration: Duration(milliseconds: 2000),
                repeatPauseDuration: Duration(milliseconds: 700),
                // repeat: false,
                child: Image.asset(
                  'assets/app_icon.png',
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: size.height * 0.1),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: size.height * 0.015,
                      wordSpacing: 3,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
