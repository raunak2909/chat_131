import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talklytic/Screen/Auth/Data/color_constants.dart';
import 'package:talklytic/widgets/myDrawer.dart';
import 'package:talklytic/x.dart';

import '../widgets/Chat_Message_List.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      // drawer: const MyDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          color: ColorConstants.purpleShade,
        ),
        child: SingleChildScrollView(
         
          child: Column(
            children: [
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi,Vishesh!'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.manrope().fontFamily,
                                    fontSize: 15,
                                    color: ColorConstants.whiteShade,
                                    letterSpacing: 3),
                              ),
                              SizedBox(height: size.height * 0.001),
                              Text(
                                'You Recevied',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.manrope().fontFamily,
                                  fontSize: 18,
                                  color: ColorConstants.whiteShade,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // const MyDrawer();
        
        
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorConstants.whiteShade,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  const MyDrawer();
                                },
                                child: Icon(
                                  Icons.menu,
                                  size: size.height * 0.035,
                                  color: ColorConstants.whiteShade,
                                ),
                              ),
                            ),
                          ),
        
                          const Button()
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: '48',
                          style: TextStyle(
                            fontFamily: GoogleFonts.manrope().fontFamily,
                            fontSize: 24,
                            color: ColorConstants.yellowShade,
                            letterSpacing: 5,
                          ),
                          children: [
                            TextSpan(
                              text: 'message',
                              style: TextStyle(
                                fontFamily: GoogleFonts.manrope().fontFamily,
                                fontSize: 24,
                                color: ColorConstants.whiteShade,
                                letterSpacing: 5,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.06),
                      SizedBox(
                        height: size.height * 0.15,
                        width: size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              height: 54,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    foregroundImage: const NetworkImage(
                                        'https://avatars.githubusercontent.com/u/76419786?v=4'),
                                    radius: size.height * 0.05,
                                  ),
                                  Text(
                                    'Vishesh',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.manrope().fontFamily,
                                      fontSize: 15,
                                      color: ColorConstants.whiteShade,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ChatMessageList(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
