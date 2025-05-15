// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, sort_child_properties_last, unused_import, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names, unnecessary_import, avoid_unnecessary_containers, duplicate_ignore, sized_box_for_whitespace, camel_case_types, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_string/random_string.dart';
import 'package:terybin/Database/NewDatabase.dart';
import 'package:terybin/Database/NewReadPage.dart';
import 'package:terybin/Database/Read.dart';
import 'package:terybin/Database/servives.dart';
import 'package:terybin/Pages/LoginPage.dart';
import 'package:terybin/Widgets/BoldText.dart';
import 'package:terybin/Widgets/MyDialogBox.dart';
import 'package:terybin/Widgets/ResponsiveButton.dart';

class MYHome extends StatefulWidget {
  const MYHome({super.key});

  @override
  State<MYHome> createState() => MY_HomeState();
}

class MY_HomeState extends State<MYHome> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: BoldText(text: "MyApp"),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              IconButton(
                  onPressed: () {
                    AuthService().signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route route) => false);
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewReadPage()));
          },
          child: BoldText(
            text: "+",
            size: 30,
            color: Colors.teal,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            height: 800,
            //color: Colors.red,
            child: Column(
              children: [
                SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldText(
                      size: 30,
                      text: "CRUD ",
                      color: Colors.blue,
                    ),
                    BoldText(
                      size: 30,
                      text: "OPERATIONS",
                      color: Colors.yellow.shade800,
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Enter Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: ageController,
                        decoration: InputDecoration(
                            hintText: "Enter Age",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                            hintText: "Enter Address",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          MyDialogBox().MyShowDialog(
                              "Data is Submitted",
                              "Record Has Been Saved To\nDatabase.",
                              "font11",
                              context);
                          Database().ADD(nameController.text,
                              ageController.text, addressController.text);
                        },
                        child: Container(
                          width: 190,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.translate(
                                offset: Offset(15, 0),
                                child: BoldText(
                                  text: "Submit",
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Read()));
                  },
                  child: Container(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                    margin: EdgeInsets.only(left: 320, bottom: 10),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
