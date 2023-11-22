import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talklytic/Screen/Auth/Data/RegisterModal.dart';
import 'package:talklytic/model/message_model.dart';

class FirebaseProvider {
  static final FirebaseAuth mAuth = FirebaseAuth.instance;
  static final FirebaseFirestore mFirestore = FirebaseFirestore.instance;

  static const String USER_COLLECTION = "users";
  static const String CHATROOM_COLLECTION = "chatroom";

  static String currUserId = mAuth.currentUser!.uid;

  static Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required Widget loginscreen,
      required BuildContext context}) async {
    try {
      await mAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(mAuth.currentUser!.email);
      print("uid: ${mAuth.currentUser!.uid}");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => loginscreen,
          ));
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

  static Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String firstNameValue,
    required String lastNameValue,
    required String phoneValue,
  }) async {
    try {
      await mAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      mFirestore.collection(USER_COLLECTION).doc(mAuth.currentUser!.uid).set(
          RegisterModal(
                  userId: mAuth.currentUser!.uid,
                  uFirstName: firstNameValue,
                  uLastName: lastNameValue,
                  uEmail: email,
                  uPhone: phoneValue)
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

  Future<void> signOut() async {
    await mAuth.signOut();
  }

  static Future<List<RegisterModal>> getAllUsers() async {
    List<RegisterModal> arrUsers = [];

    var arrUserData = await mFirestore.collection(USER_COLLECTION).get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> eachUser
        in arrUserData.docs) {
      var dataModel = RegisterModal.fromJson(eachUser.data());
      if (dataModel.userId != mAuth.currentUser!.uid) {
        arrUsers.add(dataModel);
      }
    }

    return arrUsers;
  }

  static signOutUser(){
    mAuth.signOut();
  }

  static String getChatID(String fromId, String toId) {
    if(fromId.hashCode<=toId.hashCode){
      return "${fromId}_$toId";
    } else {
      return "${toId}_$fromId";
    }
  }



  static void sendMsg(String msg, String toId) {
    var chatId = getChatID(currUserId, toId);
    print(currUserId);
    print("Chat id : $chatId");

    var sentTime = DateTime.now().millisecondsSinceEpoch;

    var newMessage = MessageModel(
        fromId: currUserId,
        mId: sentTime.toString(),
        message: msg,
        sent: sentTime.toString(),
        toId: toId);


      mFirestore
          .collection(CHATROOM_COLLECTION)
          .doc(chatId)
          .collection("messages")
          .doc(sentTime.toString())
          .set(newMessage.toJson());

  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessage(
      String toId){
    var chatId =  getChatID(currUserId, toId);
    print("Chat id : $chatId");

    return mFirestore
        .collection(CHATROOM_COLLECTION)
        .doc(chatId)
        .collection("messages")
        .snapshots();
  }

  static void updateReadTime(String mId, String fromId){
    var chatId = getChatID(currUserId, fromId);

    var readTime = DateTime.now().millisecondsSinceEpoch;

    mFirestore
        .collection(CHATROOM_COLLECTION)
        .doc(chatId)
        .collection("messages")
        .doc(mId)
        .update({"read" : readTime.toString()});
  }


}
