import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:client/app.dart';
import 'package:client/models/area_model.dart';

class EPAuthentication {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    Future<bool?> connectionValidation;
    connectionValidation = AreaModel.requestSignInUsingEmailPassword(
        email: email, password: password, context: context).then((value) {if (value == true) {Navigator.of(context).restorablePushNamed(AreaApp.homeRoute);}});
    }

  static registerUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    AreaModel.requestRegisterUsingEmailPassword(
        email: email, password: password, context: context);
  }
}
