// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talklytic/Screen/Auth/Screens/widgets/Text_fields.dart';

import '../../../Constants/color_constants.dart';

class login_with_phone extends StatelessWidget {
  const login_with_phone({
    super.key,
    required this.size,
    required this.phoneController,
    required this.obscureText,
  });

  final Size size;
  final TextEditingController phoneController;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(
      alignment: Alignment.center,
      height: size.height / 2,
      width: size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(152, 186, 87, 206),
        Color.fromARGB(170, 239, 229, 87),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Column(
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontFamily: GoogleFonts.manrope().fontFamily,
              color: ColorConstants.blackShade,
              fontSize: 22,
            ),
          ),
          Divider(thickness: 1.5),
          SizedBox(height: size.height * 0.04),
          SizedBox(
            width: size.width * 0.9,
            child: MyTextFieldWidget(
              controller: phoneController,
              validator: (value) {
                if (phoneController.text.isEmpty &&
                    phoneController.text.length < 10) {
                  return 'Please entre a valid phone number';
                }
                return null;
              },
              hintText: 'Entre your Phone',
              obscureText: obscureText,
              keyboardType: TextInputType.number,
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
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
                if (_formKey.currentState!.validate()) {}
              },
              child: Text(
                'Send OTP'.toUpperCase(),
                style: TextStyle(
                  fontFamily: GoogleFonts.manrope().fontFamily,
                  color: ColorConstants.blackShade,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                height: size.height * 0.06,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                  color: ColorConstants.whiteShade,
                  borderRadius: BorderRadius.all(Radius.elliptical(12, 21)),
                ),
                child: Text('0'),
              ),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.06,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                  color: ColorConstants.whiteShade,
                  borderRadius: BorderRadius.all(Radius.elliptical(12, 21)),
                ),
                child: Text('0'),
              ),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.06,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                  color: ColorConstants.whiteShade,
                  borderRadius: BorderRadius.all(Radius.elliptical(12, 21)),
                ),
                child: Text('0'),
              ),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.06,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                  color: ColorConstants.whiteShade,
                  borderRadius: BorderRadius.all(Radius.elliptical(12, 21)),
                ),
                child: Text('0'),
              ),
            ],
          )
        ],
      ),
    );
  }
}