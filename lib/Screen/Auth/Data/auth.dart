// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'RegisterModal.dart';

class AuthUsr {
  final FirebaseAuth _firebase = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseStrore = FirebaseFirestore.instance;

  Future<void> signinWithEmailandPassword(
      {required String email, required String password,required Widget loginscreen,required BuildContext context}) async {
    try {
      await _firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(_firebase.currentUser!.email);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginscreen,));
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e is FirebaseAuthException && e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e);
      }
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String firstNameController,
    required String lastNameController,
    required String phoneController,
  }) async {
    try {
      await _firebase.createUserWithEmailAndPassword(
          email: email, password: password);
      _firebaseStrore.collection('users').doc(_firebase.currentUser!.uid).set(
          RegisterModal(
                  userId: _firebase.currentUser!.uid,
                  uFirstName: firstNameController,
                  uLastName: lastNameController,
                  uEmail: email,
                  uPhone: phoneController)
              .toJson());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signout() async {
    await _firebase.signOut();
  }
}
