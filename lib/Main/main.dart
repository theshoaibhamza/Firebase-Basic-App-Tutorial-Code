// ignore_for_file: prefer_const_constructors, dead_code, unused_label, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:terybin/Pages/Create.dart';
import 'package:terybin/Pages/LoginPage.dart';
import 'package:terybin/Database/Read.dart';
import 'package:terybin/Pages/Home.dart';
import 'package:terybin/Pages/ReadData.dart';
import 'package:terybin/Pages/SignUpPage.dart';
import 'package:terybin/Database/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //home: Create(),
      //home: AuthWraper(),
      home: SignUpPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => MYHome(),
      },
    );
  }
}

class AuthWraper extends StatelessWidget {
  const AuthWraper({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    // Already Signed-in
    if (user != null) {
      return MYHome();
    }

    // Logged-out
    else {
      return LoginPage();
    }
  }
}
