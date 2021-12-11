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
  final _formKey = GlobalKey<FormState>();


  movetoHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,

        //single child scroll view will provide a scrolling widget for small screens
        child: SingleChildScrollView(
          child: Form( // form will be used to validate the empty username and password
            key: _formKey, // form requires a key to operate
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
                        // validator will be used to check if the text field is empty or not
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                        },
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
                          // validator will be used to check if the text field is empty or not
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            return null;
                          }),
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

                      Material(
                        color: Colors.purple,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => movetoHome(context), // we have now made a function rather than writing it here
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
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
