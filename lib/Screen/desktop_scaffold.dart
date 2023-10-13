// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:talklytic/Screen/chat_screen.dart';
import 'package:talklytic/widgets/myDrawer.dart';

import '../widgets/Chat_Message_List.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ChatMessageList(
                size: size / 3,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: ChatScreen(
                name: 'Vishesh',
                fontSize: 24,
              )),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow.shade200,
              child: Column(
                children: [],
              ),
            ),
          )
        ],
      ),
    );
  }
}
