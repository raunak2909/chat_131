// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talklytic/Screen/Auth/Data/color_constants.dart';
import 'package:talklytic/Screen/Auth/Screens/widgets/Text_fields.dart';
import 'package:talklytic/Screen/mobile_scaffold.dart';

import 'login_phone.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool obscureText = true;
  IconData iconData = Icons.visibility_off;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          SizedBox(
            width: size.width * 0.9,
            child: MyTextFieldWidget(
              controller: emailController,
              validator: (value) {
                if (emailController.text.isEmpty) {
                  return 'Please entre a valid email';
                }
                return null;
              },
              hintText: 'Email',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          SizedBox(
            width: size.width * 0.9,
            child: MyTextFieldWidget(
              controller: passwordController,
              validator: (value) {
                if (passwordController.text.isEmpty) {
                  return 'Please entre a valid password';
                }
                return null;
              },
              hintText: 'Password',
              obscureText: obscureText,
              keyboardType: TextInputType.text,
              prefixIcon: Icon(
                Icons.lock_rounded,
                color: Colors.white,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  obscureText = !obscureText;
                  if (obscureText) {
                    iconData = Icons.visibility_off;
                  } else {
                    iconData = Icons.visibility;
                  }
                  setState(() {});
                },
                child: Icon(
                  iconData,
                  color: obscureText ? Colors.white : Colors.blue,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('Forgot Password!')],
            ),
          ),
          Text(
            'or',
            style: TextStyle(
              fontFamily: GoogleFonts.manrope().fontFamily,
              fontSize: 22,
              color: ColorConstants.blackShade,
            ),
          ),
          SizedBox(
            width: size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.purpleShade,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(6, 12)),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return login_with_phone(
                      size: size,
                      phoneController: phoneController,
                      obscureText: obscureText,
                    );
                  },
                );
              },
              child: Text(
                'Phone',
                style: TextStyle(
                  fontFamily: GoogleFonts.manrope().fontFamily,
                  color: ColorConstants.whiteShade,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          SizedBox(
            width: size.width / 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.yellowShade,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var cred = FirebaseAuth.instance;
                  try {
                    cred.signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString());
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobileScaffold(),
                        ));
                  } on FirebaseAuthException catch (e) {
                    print(e.code);
                  }
                }
              },
              child: Text(
                'Login'.toUpperCase(),
                style: TextStyle(
                  fontFamily: GoogleFonts.manrope().fontFamily,
                  color: ColorConstants.blackShade,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            "Don't have an account?",
            style: TextStyle(
              fontFamily: GoogleFonts.manrope().fontFamily,
              color: ColorConstants.blackShade,
              fontSize: 15,
            ),
          ),
          Text(
            "signup",
            style: TextStyle(
              fontFamily: GoogleFonts.manrope().fontFamily,
              color: ColorConstants.purpleShade,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
