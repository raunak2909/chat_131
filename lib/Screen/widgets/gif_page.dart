// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talklytic/Screen/Auth/Data/color_constants.dart';

class GifPage extends StatefulWidget {
  const GifPage({super.key});

  @override
  State<GifPage> createState() => _GifPageState();
}

class _GifPageState extends State<GifPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.whiteShade,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reaction',
                style: TextStyle(
                  color: ColorConstants.blackShade,
                  fontFamily: GoogleFonts.manrope().fontFamily,
                  fontSize: size.height * 0.03,
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: size.height * 0.005),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width*0.01),
            height: size.height*0.05,
            decoration: BoxDecoration(
                border: Border.all(width: 0.3),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200),
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '   Search',
                  hintStyle: TextStyle(
                    fontFamily: GoogleFonts.manrope().fontFamily,
                  )),
            ),
          ),
          SizedBox(height: size.height * 0.015),
          Expanded(
            child: GridView.builder(
              itemCount: 100,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  height: 50,
                  width: 20,
                  color: Colors.amber,
                  child: Text('1'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
