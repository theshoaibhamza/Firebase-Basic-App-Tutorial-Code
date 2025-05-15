// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, sort_child_properties_last, unused_import, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names, unnecessary_import, avoid_unnecessary_containers, duplicate_ignore, sized_box_for_whitespace, camel_case_types, unused_local_variable, must_be_immutable
import 'package:flutter/material.dart';
import 'package:terybin/Database/NewDatabase.dart';
import 'package:terybin/Widgets/BoldText.dart';
import 'package:terybin/Widgets/MyDialogBox.dart';

class UpdateFile extends StatelessWidget {
  UpdateFile(
      {super.key,
      required this.id,
      required this.map,
      required this.nameController,
      required this.addressController,
      required this.ageController});

  String id;
  Map<String, dynamic> map;
  TextEditingController nameController;
  TextEditingController ageController;
  TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              nameController.text = map['NAME'];
              ageController.text = map['AGE'];
              addressController.text = map['ADDRESS'];
              // Update Code Here

              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: BoldText(text: "Update Data"),
                      content: Container(
                        height: 350,
                        child: Column(
                          children: [
                            // here
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
                              height: 50,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    MyDialogBox().MyShowDialog(
                                        "Data Updated",
                                        "Record Has Been Updated in\nDatabase.",
                                        "font11",
                                        context);

                                    Database().UPDATE(
                                        id,
                                        nameController.text,
                                        ageController.text,
                                        addressController.text);
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Transform.translate(
                                          offset: Offset(0, 0),
                                          child: BoldText(
                                            text: "Submit",
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // color:
                                      //     Colors.blue,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: BoldText(
                                      text: "Ok",
                                      color: Colors.black,
                                    ))
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            icon: Icon(Icons.edit)),
        IconButton(
            onPressed: () {
              Database().DELETE(id);
            },
            icon: Icon(Icons.delete)),
      ],
    );
  }
}
