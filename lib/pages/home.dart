// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practice/widgets/drawer.dart';

class HomePage extends StatelessWidget {

  final int days = 1;
  final String name = "Achintya";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        // backgroundColor: Colors.white,
        // title: Text("Catalog App",
        //   style: TextStyle(color: Colors.black)),
        // iconTheme: IconThemeData(color: Colors.black)
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to day $days of the project made by $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
