// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, sort_child_properties_last, unused_import, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names, unnecessary_import, avoid_unnecessary_containers, duplicate_ignore, sized_box_for_whitespace, body_might_complete_normally_nullable, empty_catches, unnecessary_nullable_for_final_variable_declarations, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:terybin/Pages/LoginPage.dart';
import 'package:terybin/Widgets/BoldText.dart';
import 'package:terybin/Widgets/IconWithText.dart';
import 'package:terybin/Widgets/LightText.dart';
import 'package:terybin/Widgets/MyDialogBox.dart';
import 'package:terybin/Widgets/ResponsiveButton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserCredential? credential;

  void Signup(
      String email, String name, String username, String password) async {
    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  SigunUpUsingFaceBook() {}

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        //color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              BoldText(
                text: "Instagram",
                font: "font26",
                size: 60,
              ),
              SizedBox(
                height: 10,
              ),
              BoldText(
                color: Colors.black45,
                align: TextAlign.center,
                text: "Sign up to see photos and videos\nfrom your friends.",
                // font: "font26",
                size: 20,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  MyDialogBox().MyShowDialog("Login Error",
                      "Not implemeted at Yet.", "font14", context);
                },
                child: Container(
                  width: 350,
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(15, 0),
                        child: BoldText(
                          text: "Log in with Facebook",
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      // Icon(
                      //   icon,
                      //   size: 35,
                      //   color: Colors.white,
                      // )
                      // logo
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[600],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 25),
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      child: Expanded(
                          child: Divider(
                        thickness: 1,
                        color: Colors.black38,
                      )),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    BoldText(
                      text: "OR",
                      color: Colors.black38,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: 130,
                      child: Expanded(
                          child: Divider(
                        thickness: 1,
                        color: Colors.black38,
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Full Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            hintText: "Username",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.visibility_off_sharp)),
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // ResponsiveButton(
                    //     text: "Sign Up",
                    //     width: 350,
                    //     height: 45,
                    //     color: Colors.blue[600],
                    //     onTap: 'home' // i will change it later,
                    //     ),

                    GestureDetector(
                      onTap: () {
                        print("object");
                        Signup(
                            emailController.text.toString(),
                            nameController.text.toString(),
                            usernameController.text.toString(),
                            passwordController.text.toString());
                      },
                      child: Container(
                        width: 350,
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.translate(
                              offset: Offset(20, 0),
                              child: BoldText(
                                text: "Sign up",
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),

                            // logo
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[600],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    LightText(
                      color: Colors.black45,
                      //align: TextAlign.center,
                      text: "By signing up, you agree to our",
                      // font: "font26",
                      size: 20,
                    ),
                    BoldText(
                      color: Colors.black54,
                      align: TextAlign.center,
                      text: "Terms & Privacy Policy",
                      // font: "font26",
                      size: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoldText(
                          text: "Have an account? ",
                          size: 17,
                          color: Colors.black54,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: BoldText(
                            text: "Login",
                            size: 17,
                            color: Colors.blue[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
