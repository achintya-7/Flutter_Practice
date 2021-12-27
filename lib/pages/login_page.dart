// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:practice/pages/home_page.dart';
import 'package:practice/utils/routes.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  // function to go from loginPage to homePage
  movetoHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // will check if the form is validated and should we continue or show the error
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      // will wait for 1 seconds
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton =
            false; // will change the boolean to false so the login button regains the original state.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,

        //single child scroll view will provide a scrolling widget for small screens
        child: SingleChildScrollView(
          child: Form(
            // form will be used to validate the empty username and password
            key: _formKey, // form requires a key to operate
            child: Column(
              children: [
                Image.asset(
                  "assets/images/signin.png",
                  fit: BoxFit.cover,
                  height: 300,
                ).h32(context),

                // provides space between the 2 widgets, seems useful
                SizedBox(
                  height: 20.0,
                ),

                // a normal text showing widget
                Text(
                  "Hello there: $name",
                  style: TextStyle(
                    fontSize: 28,
                    color: context.accentColor,
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

                        // this will change the value everytime, the text field is changed.
                        // after the value is changed, name will be changed and it call the build function again
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
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => movetoHome(
                              context), // we have now made a function rather than writing it here
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons
                                        .done, // will change the icon to a "tick" mark
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
