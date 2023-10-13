// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';
import 'package:talklytic/Screen/Auth/Data/color_constants.dart';

class ChatScreen extends StatelessWidget {
  String name;
  double fontSize;
  ChatScreen({super.key, required this.name, this.fontSize = 22});

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
                  child: MediaQuery.of(context).orientation ==
                          Orientation.portrait
                      ? Row(
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
                            SizedBox(width: size.width * 0.2),
                            Text(
                              name,
                              style: TextStyle(
                                fontFamily:
                                    GoogleFonts.manrope().fontFamily,
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.whiteShade,
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  FontAwesomeIcons.video,
                                  color: ColorConstants.whiteShade,
                                  size: fontSize / 1.3,
                                ),
                                SizedBox(width: fontSize / 2),
                                Icon(
                                  FontAwesomeIcons.phone,
                                  color: ColorConstants.whiteShade,
                                  size: fontSize / 1.3,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: fontSize / 5),
                                  color: Color.fromARGB(84, 238, 238, 238),
                                  child: VerticalDivider(
                                    indent: 10,
                                    width: 2,
                                    thickness: 1,
                                    color: Colors.red.shade300,
                                    endIndent: 20,
                                  ),
                                ),
                                Icon(
                                  Icons.search,
                                  color: ColorConstants.whiteShade,
                                  size: fontSize / 0.9,
                                ),
                                SizedBox(width: fontSize / 6),
                                GestureDetector(
                                  onTap: () {
                                    showPopover(
                                      context: context,
                                      bodyBuilder: (context) {
                                        return SafeArea(
                                          child: Container(
                                            color: Colors.red,
                                            child: Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorConstants
                                                          .purpleShade),
                                                  child: Text('Profile'),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorConstants
                                                          .purpleShade),
                                                  child: Text('Profile'),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorConstants
                                                          .purpleShade),
                                                  child: Text('Profile'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      width: 250,
                                      height: 250,
                                      backgroundColor: Colors.green.shade300,
                                    );
                                  },
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: ColorConstants.whiteShade,
                                    size: fontSize / 0.9,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: size.width * 0.2),
                            Text(
                              name,
                              style: TextStyle(
                                fontFamily:
                                    GoogleFonts.manrope().fontFamily,
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.whiteShade,
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  FontAwesomeIcons.video,
                                  color: ColorConstants.whiteShade,
                                  size: fontSize / 1.3,
                                ),
                                SizedBox(width: fontSize / 2),
                                Icon(
                                  FontAwesomeIcons.phone,
                                  color: ColorConstants.whiteShade,
                                  size: fontSize / 1.3,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: fontSize / 5),
                                  color: Color.fromARGB(84, 238, 238, 238),
                                  child: VerticalDivider(
                                    indent: 10,
                                    width: 2,
                                    thickness: 1,
                                    color: Colors.red.shade300,
                                    endIndent: 20,
                                  ),
                                ),
                                Icon(
                                  Icons.search,
                                  color: ColorConstants.whiteShade,
                                  size: fontSize / 0.9,
                                ),
                                SizedBox(width: fontSize / 6),
                                GestureDetector(
                                  onTap: () {
                                    showPopover(
                                      context: context,
                                      bodyBuilder: (context) {
                                        return SafeArea(
                                          child: Container(
                                            color: Colors.red,
                                            child: Column(
                                              children: [
                                                Text('data'),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: ColorConstants.whiteShade,
                                    size: fontSize / 0.9,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
              SizedBox(height: fontSize),
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
                      /// =======Msg =========///
                      Expanded(child: Container()),

                      /// =======Text Field & more ======//
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 20.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.add,
                                size: fontSize,
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
                                        size: fontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: fontSize),
                            CircleAvatar(
                              backgroundColor: ColorConstants.purpleShade,
                              child: Icon(
                                Icons.mic,
                                color: ColorConstants.whiteShade,
                                size: fontSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: fontSize),
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
