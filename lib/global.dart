import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
class GlobalClass {
  // here used to setup every pre app start configuration
  static setup() async {
    // initialized flutter ui
    print("flutter widget initialization");
    WidgetsFlutterBinding.ensureInitialized(); // here is used to initialized flutter widget
    // initialized firebase here
    print("firebase initialization");
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  }

}