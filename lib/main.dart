import 'package:flutter/material.dart';
import 'package:client/app.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey: 'AIzaSyA_6vGnEbnslDskt6Y3DyQFFi6LFxI89Ic', 
      appId: 'appId', 
      messagingSenderId: 'messagingSenderId', 
      projectId: 'projectId'),
    );
  runApp(const AreaApp());
}
