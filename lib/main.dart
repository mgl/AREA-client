import 'package:flutter/material.dart';
import 'package:client/app.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey: 'AIzaSyA_6vGnEbnslDskt6Y3DyQFFi6LFxI89Ic', 
      appId: '1:613243542195:android:06ef0eec5ce705c70c2ec6', 
      messagingSenderId: 'messagingSenderId', 
      projectId: 'area-37a17'),
    );
  runApp(AreaApp());
}
