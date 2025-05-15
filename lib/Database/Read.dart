// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, sort_child_properties_last, unused_import, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names, unnecessary_import, avoid_unnecessary_containers, duplicate_ignore, sized_box_for_whitespace, camel_case_types, unused_local_variable, must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:terybin/Database/NewDatabase.dart';
import 'package:terybin/Database/Update.dart';
import 'package:terybin/Widgets/BoldText.dart';
import 'package:terybin/Widgets/MyDialogBox.dart';

class Read extends StatefulWidget {
  Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("READ"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Database().READ(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                // if snapshot has data we store whole data in list in the form of documents

                List data = snapshot.data!.docs;

                // print("Lengthhhhhhhhhhhhhhhhh  : " + data.length.toString());

                // as we are now going to show UI using list we need ListView.builder

                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: ((context, index) {
                      // as data list have documents, so we store each document one by one
                      DocumentSnapshot eachDocument = data[index];

                      // Stored id for later use
                      String id = eachDocument.id;

                      // geting data from each document as a map
                      Map<String, dynamic> map =
                          eachDocument.data() as Map<String, dynamic>;

                      String textAddress = map['ADDRESS'];
                      String textAge = map['AGE'];
                      String textName = map['NAME'];

                      // displaying the ListTile for UI

                      return Container(
                        margin:
                            EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        height: 100,
                        width: 300,
                        child: Row(
                          children: [
                            Container(
                              width: 230,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BoldText(text: "Name : " + textName),
                                  BoldText(text: "Address : " + textAddress),
                                  BoldText(text: "Age : " + textAge),
                                ],
                              ),
                            ),
                            UpdateFile(
                                id: id,
                                map: map,
                                nameController: nameController,
                                addressController: addressController,
                                ageController: ageController),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: BoldText(text: "Update"),
                                        content: Column(
                                          children: [
                                            SizedBox(
                                              height: 90,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    controller: nameController,
                                                    decoration: InputDecoration(
                                                        hintText: "Enter Name",
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40))),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  TextField(
                                                    controller: ageController,
                                                    decoration: InputDecoration(
                                                        hintText: "Enter Age",
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40))),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  TextField(
                                                    controller:
                                                        addressController,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Enter Address",
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40))),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        print(
                                                            "SUBM,ITTTTTTTTTTTED");

                                                        print("name : " +
                                                            nameController
                                                                .text);
                                                        print("Age : " +
                                                            ageController.text);
                                                        print("Address : " +
                                                            addressController
                                                                .text);

                                                        print(
                                                            "SUBM,ITTTTTTTTTTTED");

                                                        print("name : " +
                                                            textName);
                                                        print(
                                                            "Age : " + textAge);
                                                        print("Address : " +
                                                            textAddress);

                                                        Database().UPDATE(
                                                            id,
                                                            nameController.text,
                                                            ageController.text,
                                                            addressController
                                                                .text);
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 190,
                                                      height: 60,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Transform.translate(
                                                            offset:
                                                                Offset(15, 0),
                                                            child: BoldText(
                                                              text: "Submit",
                                                              color:
                                                                  Colors.white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                        ],
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Read()));
                                              },
                                              child: Container(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                margin: EdgeInsets.only(
                                                    left: 320, bottom: 10),
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.ac_unit_rounded))
                          ],
                        ),
                      );
                    }));
              } else {
                // if there is no data
                return Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BoldText(
                      text: "Loading",
                      size: 26,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ));
              }
            })),
      ),
    );
  }
}
