import 'package:flutter/material.dart';
import 'package:kabitaab/pages/splash_screen.dart';
import 'package:kabitaab/pages/home_screen.dart';
import 'package:kabitaab/services/remoteservices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // getAuthor();
    // ApiService.getAllTitle();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Splash(),
    );
  }
}
