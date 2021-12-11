// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practice/pages/home.dart';
import 'package:practice/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,

        //single child scroll view will provide a scrolling widget for small screens
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/signin.png",
                fit: BoxFit.cover,
                height: 300,
              ),

              //provides space between the 2 widgets, seems useful
              SizedBox(
                height: 20.0,
              ),

              //a normal text showing widget
              Text(
                "Hello there: $name",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    // a special widget good for taking forms type info from the user
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {}); // calls the build function again
                      },
                    ),
                    TextFormField(
                      obscureText:
                          true, // it will convert the text into dots for password
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    // finally we are at button
                    ElevatedButton(
                      child: Text("Login"),
                      style: TextButton.styleFrom(
                        minimumSize: Size(150, 40),
                      ),
                      onPressed: () {
                        // using pushNamed, we can assign the route via name
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                    ),

                    InkWell(
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });

                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(
                            changeButton ? 50 : 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
