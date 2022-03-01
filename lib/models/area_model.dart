import 'package:client/views/login/login_main_view.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:client/app.dart';
import 'package:google_sign_in/google_sign_in.dart';
/*
class AreaModel {
  static Future<bool> requestSignInUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(LoginMainView.customSnackBar(
            content: 'No user found for that email.'));
        return (false);
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(LoginMainView.customSnackBar(
            content: 'Wrong password provided for that user.'));
        return (false);
      }
    } catch (e) {
      return (false);
    }
    return true;
  }

  static Future<User?> requestRegisterUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(LoginMainView.customSnackBar(
            content: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(LoginMainView.customSnackBar(
            content: 'The account already exists for that email.'));
      }
    }
    return user;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await user.reload();
    User? refreshedUser = auth.currentUser;
    return refreshedUser;
  }

  static Future<String?> getImageURLGoogle() async {

  }

  // static Future<void> signInWithGoogle({required BuildContext context}) async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);
  //     UserCredential result = await auth.signInWithCredential(authCredential);
  //     User? user = result.user;
  //     print("\nNIQUE\n");
  //     print(user?.displayName);
  //     print(user?.email);
  //   }
  // }

  static Future<UserCredential> signInWithGoogleDesktop(
      {required BuildContext context}) async {
    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
    googleAuthProvider.setCustomParameters({'login_hint': 'user@example.com'});
    return await FirebaseAuth.instance.signInWithPopup(googleAuthProvider);
  }

  static Future<User?> signInWithGoogleMobile({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print('account exists with different credential\n');
        } else if (e.code == 'invalid-credential') {
          print('invalid credential\n');
        }
      } catch (e) {
        print('auth doesn\'t work...\n');
      }
    }
    return user;
  }
}
*/