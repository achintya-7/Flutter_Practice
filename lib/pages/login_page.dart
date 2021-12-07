// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column( 
        children: [
          Image.asset("assets/images/signin.png", 
          fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Hello there",
            style: TextStyle( 
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [ 
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true, // it will convert the text into dots for password
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox( 
                    height: 20.0,
                  ),
                  ElevatedButton(  
                    child: Text("Login"),
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      print("Hi User");
                    },
                  ),
              ],
            ),
          )
        ],
      )
    );
  }
}
