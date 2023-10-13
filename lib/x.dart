// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class xScreen extends StatelessWidget {
  const xScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              showPopover(
                height: 250,
                width: 250,
                backgroundColor: Colors.purpleAccent,
                context: context,
                onPop: () {
                  print('popped!!');
                },
                bodyBuilder: (context) {
                  return Container(
                    color: Colors.amber,
                    height: 250,
                    width: 250,
                    child: Text('data'),
                  );
                },
              );
            },
            child: Icon(Icons.horizontal_rule)),
      ),
    );
  }
}
