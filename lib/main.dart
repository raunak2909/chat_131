import 'package:flutter/material.dart';
import 'package:talklytic/Screen/desktop_scaffold.dart';
import 'package:talklytic/Screen/mobile_scaffold.dart';
import 'package:talklytic/Screen/tablet_scaffold.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talklytic/widgets/myDrawer.dart';
import 'Screen/Auth/Screens/WelcomeScreen.dart';
import 'firebase_options.dart';
import 'Screen/chat_screen.dart';
import 'Responsive/homepage.dart';

void main() async{
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
      home: const HomePage(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffld: DesktopScaffold(),
      ),
      // home: const AuthenticationHomepage(),
    );
  }
  void initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
}
