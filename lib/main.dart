// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/pages/home.dart';
import 'package:practice/pages/login_page.dart';
import 'package:practice/utils/routes.dart';
import 'package:practice/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application. Everything is a widget in flutter.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // This here shows how we implement themes in the
      // app using themedata and thememode
      themeMode: ThemeMode.light,
      theme: Mytheme.lightTheme(context),

      // ROUTES
      // this is how intents work here,
      // Hover over it and it will show that it takes Map
      // Map is similar to JSON and dictionary in Python which has a key and a value
      initialRoute:
          "/home", // this is the initial route from where the mobile screen will start
      routes: {
        "/": (context) =>
            LoginPage(), // the stuff after the arrow is the RETURN in lambda function
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        // You can also define the routes directly like this
        // but professionally, people make a class (MyRoutes) and then use the variables in it
        // Remember classes, basically the variables are string which acts as the routes of the directory
        // "/home": (context) => HomePage(),
        // "/login": (context) => LoginPage(),
      },
    );
  }
}
