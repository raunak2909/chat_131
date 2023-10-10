// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talklytic/Constants/dummy_data.dart';

import '../Screen/Auth/Data/color_constants.dart';
import '../Screen/chat_screen.dart';

class MessageList extends StatelessWidget {
  const MessageList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.01,
      ),
      width: size.width,
      // height: size.height*0.646,
      decoration: const BoxDecoration(
        color: ColorConstants.whiteShade,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(28),
          topLeft: Radius.circular(28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.search,
                size: size.width * 0.08,
              ),
              Container(
                // height: size.height * 0.05,
                padding: EdgeInsets.all(6),
                width: size.width * 0.35,
                decoration: BoxDecoration(
                    color: ColorConstants.yellowShade,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Direct Message',
                      style: TextStyle(
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontSize: size.width * 0.033,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.blackShade,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.height * 0.03,
                      width: size.width * 0.04,
                      decoration: BoxDecoration(
                          color: ColorConstants.blackShade,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        '4',
                        style: TextStyle(
                          fontFamily: GoogleFonts.manrope().fontFamily,
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.whiteShade,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.05,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Groupe',
                      style: TextStyle(
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.blackShade,
                      ),
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.blackShade,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.05),
          Text(
            'Pinned Message',
            style: TextStyle(
              fontFamily: GoogleFonts.manrope().fontFamily,
              fontSize: size.width * 0.05,
              color: ColorConstants.blackShade,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: PinnedMsg.name.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/76419786?v=4'),
                    radius: size.height * 0.05,
                  ),
                  title: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(name: '${PinnedMsg.name[index]}'),
                          ));
                    },
                    child: Text(
                      '${PinnedMsg.name[index]}',
                      style: TextStyle(
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontSize: size.width * 0.05,
                        color: ColorConstants.blackShade,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'msg..',
                    style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: size.width * 0.03,
                      color: ColorConstants.blackShade,
                    ),
                  ),
                  trailing: Column(
                    children: [
                      // Text('${DateTime.now()}'),
                      Text('Time'),
                      Icon(
                        FontAwesomeIcons.checkDouble,
                        size: size.width * 0.04,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Text(
            'All Message',
            style: TextStyle(
              fontFamily: GoogleFonts.manrope().fontFamily,
              fontSize: size.width * 0.05,
              color: ColorConstants.blackShade,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: AllMsg.name.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/76419786?v=4'),
                    radius: size.height * 0.05,
                  ),
                  title: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(name: '${AllMsg.name[index]}'),
                          ));
                    },
                    child: Text(
                      '${AllMsg.name[index]}',
                      style: TextStyle(
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontSize: size.width * 0.05,
                        color: ColorConstants.blackShade,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'msg',
                    style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: size.width * 0.03,
                      color: ColorConstants.blackShade,
                    ),
                  ),
                  trailing: Column(
                    children: [
                      // Text('${DateTime.now()}'),
                      Text('Time'),
                      Icon(
                        FontAwesomeIcons.checkDouble,
                        size: size.width * 0.04,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
