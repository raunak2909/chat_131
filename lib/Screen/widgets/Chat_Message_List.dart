// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talklytic/Constants/dummy_data.dart';
import 'package:talklytic/Screen/Auth/Data/RegisterModal.dart';
import 'package:talklytic/firebase/firebase_provider.dart';
import 'package:talklytic/model/message_model.dart';

import '../Auth/Data/color_constants.dart';
import '../chat_screen.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({
    super.key,
    required this.size,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
  });

  final Size size;
  final double fontSize;
  final FontWeight fontWeight;

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
                size: fontSize * 2,
              ),
              Container(
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
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.blackShade,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2),
                      width: size.width * 0.025,
                      decoration: BoxDecoration(
                          color: ColorConstants.blackShade,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        '4',
                        style: TextStyle(
                          fontFamily: GoogleFonts.manrope().fontFamily,
                          fontSize: fontSize / 1.1,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.whiteShade,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(6),
                width: size.width * 0.25,
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
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.blackShade,
                      ),
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontSize: fontSize,
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
              fontSize: fontSize * 1.2,
              color: ColorConstants.blackShade,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: FutureBuilder<List<RegisterModal>>(
              future: FirebaseProvider.getAllUsers(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var currUser = snapshot.data![index];

                    /// ChatListTile
                    return StreamBuilder(
                        stream:
                            FirebaseProvider.getChatLastMsg(currUser.userId!),
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            var messages = snapshot.data!.docs;
                            MessageModel? lastMsgModel;
                            if(messages.isNotEmpty){
                              lastMsgModel = MessageModel.fromJson(messages[0].data());
                            }


                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                foregroundImage: NetworkImage(currUser
                                            .uProfilePic !=
                                        ""
                                    ? 'https://avatars.githubusercontent.com/u/76419786?v=4'
                                    : "https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png"),
                                radius: fontSize * 2.5,
                              ),
                              title: InkWell(
                                onTap: () {
                                  if (MediaQuery.of(context).orientation ==
                                      Orientation.portrait) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatScreen(
                                            name: '${currUser.uFirstName}',
                                            toId: currUser.userId!,
                                          ),
                                        ));
                                  }
                                },
                                child: Text(
                                  '${currUser.uFirstName}',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.manrope().fontFamily,
                                    fontSize: fontSize * 1.2,
                                    fontWeight: fontWeight,
                                    color: ColorConstants.blackShade,
                                  ),
                                ),
                              ),
                              subtitle: Text(
                                messages.isEmpty
                                    ? currUser.uLastName
                                    : lastMsgModel!.message,
                                style: TextStyle(
                                  fontFamily: GoogleFonts.manrope().fontFamily,
                                  fontSize: fontSize / 1.4,
                                  color: ColorConstants.blackShade,
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  // Text('${DateTime.now()}'),
                                  messages.isNotEmpty ? Text('${lastMsgModel!.sent}') : Container(width: 0, height: 0,),
                                  messages.isNotEmpty ? showReadStatus(lastMsgModel!, currUser.userId!) : SizedBox()
                                ],
                              ),
                            );
                          }
                          return  Container();
                        });
                  },
                );
              },
            ),
          ),
          SizedBox(height: size.height * 0.05),
          /*Text(
            'All Message',
            style: TextStyle(
              fontFamily: GoogleFonts.manrope().fontFamily,
              fontSize: fontSize * 1.2,
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
                    radius: fontSize * 2.5,
                  ),
                  title: InkWell(
                    onTap: () {
                      if (MediaQuery.of(context).orientation ==
                          Orientation.portrait) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChatScreen(name: '${AllMsg.name[index]}'),
                            ));
                      }
                    },
                    child: Text(
                      '${AllMsg.name[index]}',
                      style: TextStyle(
                        fontFamily: GoogleFonts.manrope().fontFamily,
                        fontSize: fontSize * 1.2,
                        fontWeight: fontWeight,
                        color: ColorConstants.blackShade,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'msg',
                    style: TextStyle(
                      fontFamily: GoogleFonts.manrope().fontFamily,
                      fontSize: fontSize / 1.4,
                      color: ColorConstants.blackShade,
                    ),
                  ),
                  trailing: Column(
                    children: [
                      // Text('${DateTime.now()}'),
                      Text('Time'),
                      Icon(
                        FontAwesomeIcons.checkDouble,
                        size: fontSize,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),*/
        ],
      ),
    );
  }


  Widget showReadStatus(MessageModel lastMsg, String chatUserId){
    if(lastMsg.fromId==FirebaseProvider.currUserId){

      return Icon(
        FontAwesomeIcons.checkDouble,
        size: fontSize,
        color: lastMsg.read!="" ? Colors.blue : Colors.grey,
      );

    } else {
      return StreamBuilder(
        stream: FirebaseProvider.getUnReadCount(chatUserId),
        builder: (_, snapshot){
          if(snapshot.hasData){
            var messages = snapshot.data!.docs;
            if(messages.isEmpty){
              return SizedBox();
            } else {
              return Container(
                width: 20,
                height: 20,
                child: Center(child: Text('${messages.length}', style: TextStyle(color: Colors.white),),),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle
                ),
              );
            }
          }
          return SizedBox();
        },
      );
    }
  }
}
