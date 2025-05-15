// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:terybin/Database/CRUD_tutorial.dart';
import 'package:terybin/Widgets/BoldText.dart';

class ReadData extends StatelessWidget {
  ReadData({super.key});
  // 0 Create Function In Your Database File V
  // 1 Condition V
  // 2 Store In List V
  // 3 ListView.builder V
  // 4 Store Each Doc V
  // 5 Save ID of Each Doc (Later Use) V
  // 6 Convert To Map V
  // 7 Convert Map To Variables (Optional) V

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BoldText(text: "Read"),
        ),
        body: StreamBuilder(
          stream: CrudTutorial().Reading(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List Data = snapshot.data!.docs;

              return ListView.builder(
                itemCount: Data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  DocumentSnapshot eachDoc = Data[index];

                  // Saving Id For Later Use

                  String id = eachDoc.id;

                  Map<String, dynamic> map =
                      eachDoc.data() as Map<String, dynamic>;

                  String Name = map['NameAttribute'];
                  String Age = map['AgeAttribute'];
                  String Address = map['AddressAttribute'];

                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BoldText(text: Name),
                            BoldText(text: Age),
                            BoldText(text: Address),
                          ],
                        )
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
        ));
  }
}
