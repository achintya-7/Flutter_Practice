// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:practice/pages/home.dart';
import 'package:practice/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData( 
        brightness: Brightness.dark,
      ),
      // This here shows how we implement themes in the 
      // app using themedata and thememode

      // ROUTES
      // this is how intents work here,
      // Hover over it and it will show that it takes Map
      // Map is similar to JSON and dictionary which has a key and a value
      initialRoute:  "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
