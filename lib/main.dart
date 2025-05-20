import 'package:flutter/material.dart';
import 'package:revirpod_ecommerce_project/global.dart';
import 'package:revirpod_ecommerce_project/login.dart';

void main() async {
  // HERE CALL EVERY PRE APP LOUNCH SETUP
  GlobalClass.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
