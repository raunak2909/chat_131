// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talklytic/Screen/Auth/Data/color_constants.dart';

class ChatScreen extends StatelessWidget {
  String name;
  double  fontSize;
  ChatScreen({super.key, required this.name,this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: ColorConstants.purpleShade,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: ColorConstants.whiteShade,
                      ),
                    ),
                    Spacer(),
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.whiteShade,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.more_horiz,
                      color: ColorConstants.whiteShade,
                      size: size.width * 0.07,
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Expanded(
                child: Container(
                  // constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                      color: ColorConstants.whiteShade,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      )),
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 20.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.add,
                                size: size.width * 0.07,
                                color: ColorConstants.blackShade,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.3),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey.shade200),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Say Something...',
                                            hintStyle: TextStyle(
                                              fontFamily: GoogleFonts.manrope()
                                                  .fontFamily,
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Icon(
                                        FontAwesomeIcons.faceSmile,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.05),
                            CircleAvatar(
                              backgroundColor: ColorConstants.purpleShade,
                              child: Icon(
                                Icons.mic,
                                color: ColorConstants.whiteShade,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                    ],
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
