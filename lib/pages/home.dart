// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final int days = 1;
  final String name = "Achintya";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1st App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to day $days of the project made by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
