// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:terybin/Database/NewDatabase.dart';
import 'package:terybin/Widgets/BoldText.dart';

class NewReadPage extends StatelessWidget {
  const NewReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: Database().READ(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List Data = snapshot.data!.docs;

            return ListView.builder(
              itemCount: Data.length,
              itemBuilder: (context, index) {
                DocumentSnapshot eachDoc = Data[index];

                String ID = eachDoc.id;

                Map<String, dynamic> map =
                    eachDoc.data() as Map<String, dynamic>;

                String NAME = map['NAME'];
                String AGE = map['AGE'];
                String ADDRESS = map['ADDRESS'];

                return Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(text: NAME),
                      BoldText(text: AGE),
                      BoldText(text: ADDRESS),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
