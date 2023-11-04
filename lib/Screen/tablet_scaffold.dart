// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'widgets/Chat_Message_List.dart';
import 'chat_screen.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Row(
        children: [
          SizedBox(
            width: size.width * 0.4,
            child: SingleChildScrollView(
              child: ChatMessageList(
                size: size / 2.6,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ChatScreen(name: 'Vishesh'),
          ),
        ],
      ),
    );
  }
}
