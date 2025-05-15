// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terybin/Database/CRUD_tutorial.dart';
import 'package:terybin/Pages/ReadData.dart';
import 'package:terybin/Widgets/BoldText.dart';

class Create extends StatelessWidget {
  Create({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadData(),
              ));
        },
        child: BoldText(text: "R"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
                child: CircleAvatar(
                  radius: 60,
                ),
                onPressed: () async {
                  XFile? xFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (xFile != null) {
                    print("Image Selected!!");
                  } else {
                    print("Image Not Selected!!");
                  }
                }),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CRUD",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                Text(
                  " Operations",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                  label: Text("Age"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                  label: Text("Address"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Submit data to firestore
                  CrudTutorial().Create(nameController.text, ageController.text,
                      addressController.text);

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("data stored successfully")));
                },
                child: Text("SUBMIT"))
          ],
        ),
      ),
    );
  }
}
