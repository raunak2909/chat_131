// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:talklytic/Constants/color_constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: size.height,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                color: ColorConstants.blackShade,
              ),
              child: Column(
                children: [
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
