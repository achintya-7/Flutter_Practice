// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageURL =
        "https://styles.redditmedia.com/t5_2spn1/styles/communityIcon_4li81d7kp6871.jpg?width=256&format=pjpg&s=4cc01843df1dcf26c942aa1919667fb982817584";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration:BoxDecoration( color: Colors.deepPurple),
                  accountEmail: Text("achintya22052000@gmail.com",
                      style: TextStyle(color: Colors.white)),
                  accountName:
                      Text("Achintya", style: TextStyle(color: Colors.white)),
                  
                  currentAccountPicture: CircleAvatar( 
                    backgroundImage: NetworkImage(imageURL), //use ASsetImage if you are getting image from assets
                  ),
                 ),
                ),
                
            ListTile(
              leading: Icon(CupertinoIcons.home, 
              color: Colors.white,),
              title: Text( 
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle( color: Colors.white),
              ),
            ),

            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email Me",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            )   
          ],
        ),
      ),
    );
  }
}
