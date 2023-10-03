// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/messageList.dart';
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
          Expanded(
            child: SingleChildScrollView(
              child: MessageList(size: size / 2.5),
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
