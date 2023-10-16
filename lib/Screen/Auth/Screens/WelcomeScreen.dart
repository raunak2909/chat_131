// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, must_be_immutable


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:talklytic/Screen/Auth/Data/color_constants.dart';
import 'package:talklytic/Screen/Auth/Screens/login_page.dart';

import 'Register_Page.dart';

class AuthenticationHomepage extends StatefulWidget {
  Widget LoginScreen;
  AuthenticationHomepage({
    Key? key,
    required this.LoginScreen,
  }) : super(key: key);

  @override
  State<AuthenticationHomepage> createState() => _AuthenticationHomepageState();
}

class _AuthenticationHomepageState extends State<AuthenticationHomepage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.whiteShade,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(children: [
            Container(
                ),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.2),
                    Container(
                      alignment: Alignment.center,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(60, 255, 255, 255),
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(12, 21),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 32.0,
                              color: Color.fromARGB(117, 255, 255, 255),
                              blurStyle: BlurStyle.outer,
                              offset: Offset(12, -1),
                            )
                          ]),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Talk'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: GoogleFonts.dancingScript().fontFamily,
                            fontSize: 52,
                            color: ColorConstants.purpleShade,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                            // decoration: TextDecoration.lineThrough,
                            decorationColor: ColorConstants.yellowShade,
                            decorationThickness: 3,
                          ),
                        ),
                        TextSpan(
                          text: 'ytic'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: GoogleFonts.dancingScript().fontFamily,
                            fontSize: 52,
                            color: ColorConstants.blackShade,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                            // decoration: TextDecoration.lineThrough,
                            decorationColor: ColorConstants.purpleShade,
                            decorationThickness: 3,
                          ),
                        ),
                      ])),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: size.height / 1.8,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: ColorConstants.purpleShade,
                        unselectedLabelColor: ColorConstants.blackShade,
                        tabs: [
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Login'.toUpperCase(),
                              style: TextStyle(
                                fontFamily: GoogleFonts.manrope().fontFamily,
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Signup'.toUpperCase(),
                              style: TextStyle(
                                fontFamily: GoogleFonts.manrope().fontFamily,
                                fontSize: 18,
                                letterSpacing: 2,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          LoginPageScreen(LoginScreen: widget.LoginScreen),
                          RegisterPageScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
