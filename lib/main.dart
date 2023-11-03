// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:talklytic/Screen/Auth/Screens/Responsive/desktop_view.dart';
import 'package:talklytic/Screen/Auth/Screens/login_page.dart';
import 'package:talklytic/Screen/desktop_scaffold.dart';
import 'package:talklytic/Screen/mobile_scaffold.dart';
import 'package:talklytic/Screen/tablet_scaffold.dart';
import 'package:talklytic/widgets/myDrawer.dart';

import 'Responsive/homepage.dart';
import 'Screen/Auth/Screens/Responsive/mobile_view.dart';
import 'Screen/Auth/Screens/WelcomeScreen.dart';
import 'Screen/Personal/profile.dart';
import 'Screen/chat_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(
      //   mobileScaffold: MobileAuthScreen(),
      //   tabletScaffold: TabletScaffold(),
      //   desktopScaffld: DesktopAuthScreen(),
      // ),
      home:const ProfileScreenPage(),
    );
  }

  void initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
