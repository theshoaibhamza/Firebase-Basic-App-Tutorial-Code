// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, sort_child_properties_last, unused_import, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names, unnecessary_import, avoid_unnecessary_containers, duplicate_ignore, sized_box_for_whitespace, empty_catches, unused_catch_clause, body_might_complete_normally_nullable, empty_statements, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:terybin/Database/servives.dart';
import 'package:terybin/Pages/Home.dart';
import 'package:terybin/Pages/ForgetPassword.dart';

import 'package:terybin/Pages/SignUpPage.dart';
import 'package:terybin/Widgets/BoldText.dart';
import 'package:terybin/Widgets/IconWithText.dart';
import 'package:terybin/Widgets/MyDialogBox.dart';
import 'package:terybin/Widgets/ResponsiveButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  UserCredential? usercredential;
  Login(String email, String password) async {
    if (email.isEmpty) {
      MyDialogBox()
          .MyShowDialog("Login Error", "Please Enter Email", "font14", context);
    } else if (!email.contains("@gmail.com")) {
      MyDialogBox().MyShowDialog(
          "Login Error", "Please Enter Correct Mail", "font14", context);
    } else if (password.isEmpty) {
      MyDialogBox().MyShowDialog(
          "Login Error", "Please Enter Password", "font14", context);
    } else if (password.length < 6) {
      MyDialogBox()
          .MyShowDialog("Login Error", "Invalid Password", "font14", context);
    } else {
      try {
        print("Im presseds");
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MYHome()));
        });
      } on FirebaseAuthException catch (ex) {
        print("You have Facing this error : " + ex.code);

        if (ex.code == 'user-not-found') {
          MyDialogBox().MyShowDialog(
              "Login Failed", "User Not Found", "font14", context);
        } else if (ex.code == 'invalid-credential') {
          MyDialogBox().MyShowDialog(
              "Login Failed", "Incorrect Password", "font14", context);
        } else {
          MyDialogBox().MyShowDialog(
              "Login Failed", ex.code.toString(), "font14", context);
        }
      }
      cath(e) {
        print(e.runtimeType);
      }
    }
  }

  bool passwordObsecure = true;

  AnonymouSignIn() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MYHome();
      }));
    } on FirebaseAuthException catch (e) {}
  }

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 780,
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoldText(
                    text: "Instagram",
                    font: "font26",
                    size: 60,
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
                                hintText:
                                    "Phone Number, username or email address",
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
                            obscureText: passwordObsecure ? true : false,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (passwordObsecure == true) {
                                          passwordObsecure = false;
                                        } else {
                                          passwordObsecure = true;
                                        }
                                      });
                                    },
                                    icon: Icon(Icons.visibility_off_sharp)),
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyForgetPassword()));
                              // this will added later
                            },
                            child: BoldText(
                              size: 13,
                              color: Colors.blue[600],
                              text: "Forgotten password?",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("object");
                            Login(emailController.text.toString(),
                                passwordController.text.toString());
                          },
                          child: Container(
                            width: 350,
                            height: 45,
                            child: Center(
                                child: isLoaded
                                    ? Container(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : BoldText(
                                        text: "Log in",
                                        color: Colors.white,
                                      )),
                            // logo

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[600],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 140,
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
                              text: "or",
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
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            // showDialog
                            // MyDialogBox(
                            //     "Login Error",
                            //     "This Functionality is Not \nImplemented at yet.",
                            //     "font14");

                            MyDialogBox().MyShowDialog(
                                "Login Error",
                                "This Functionality is Not \nImplemented at yet.",
                                "font14",
                                context);
                          },
                          child: IconWithText(
                            sizeIcon: 20,
                            sizeText: 15,
                            icon: Icons.facebook,
                            text: "Log in with Facebook",
                            colorText: Colors.blue,
                            colorIcon: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            AnonymouSignIn();

                            // setState(() {
                            //   isLoaded = true;
                            // });
                            // User? user = await AuthService().signInWithGoogle();

                            // setState(() {
                            //   isLoaded = false;
                            // });

                            // if (user != null) {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => MYHome()));
                            // } else {
                            //   setState(() {
                            //     isLoaded = false;
                            //   });
                            //   print("unable");
                            // }
                          },
                          child: IconWithText(
                            sizeIcon: 20,
                            sizeText: 15,
                            icon: Icons.face_retouching_off_rounded,
                            text: "Login Anonymously",
                            colorText: Colors.black,
                            colorIcon: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 60,
              //color: Colors.yellow,
              child: Column(
                children: [
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoldText(
                        text: "Dont't have an account? ",
                        size: 16,
                        color: Colors.black45,
                      ),
                      GestureDetector(
                        onTap: () {
                          // will be added later
                          Navigator.pushNamed(context, "/signup");
                          print("Pressssseeddddd ");
                        },
                        child: BoldText(
                          text: "Sign Up",
                          size: 17,
                          color: Colors.blue[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
