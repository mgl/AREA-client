import 'package:client/models/action_container.dart';
import 'package:flutter/material.dart';
import 'package:client/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/globals.dart';

void main() async {
  globalContainer = ActionContainer();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA_6vGnEbnslDskt6Y3DyQFFi6LFxI89Ic",
          authDomain: "area-37a17.firebaseapp.com",
          projectId: "area-37a17",
          storageBucket: "area-37a17.appspot.com",
          messagingSenderId: "613243542195",
          appId: "1:613243542195:web:db0322be575c945c0c2ec6"));
  runApp( AreaApp());
}
