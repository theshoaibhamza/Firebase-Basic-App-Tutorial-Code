// import 'package:cloud_firestore/cloud_firestore.dart';

// class NewDatabase {
//   final CollectionReference hello =
//       FirebaseFirestore.instance.collection("test");

//   Future<void> Add(
//     String Name,
//     String Age,
//     String Address,
//   ) {
//     return hello.add({
//       "Name": Name,
//       "age": Age,
//       "address": Address,
//     });
//   }

//   Stream<QuerySnapshot> Geting() {
//     final Stream = hello.snapshots();
//     return Stream;
//   }

//   Future<void> Update(
//     String Id,
//     String Name,
//     String Age,
//     String Address,
//   ) {
//     return hello.doc(Id).update({
//       "NAME": Name,
//       "AGE": Age,
//       "ADDRESS": Address,
//     });
//   }

//   Future<void> Delete(
//     String Id,
//   ) {
//     return hello.doc(Id).delete();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final CollectionReference Object =
      FirebaseFirestore.instance.collection("Document Name");

  // ADD
  Future<void> ADD(String Name, String Age, String Address) {
    return Object.add({"NAME": Name, "AGE": Age, "ADDRESS": Address});
  }

  // READ

  Stream<QuerySnapshot> READ() {
    final Stream = Object.snapshots();
    return Stream;
  }

  // UPDATE

  Future<void> UPDATE(String ID, String Name, String Age, String Address) {
    return Object.doc(ID)
        .update({"NAME": Name, "AGE": Age, "ADDRESS": Address});
  }

  // DELETE

  Future<void> DELETE(String ID) {
    return Object.doc(ID).delete();
  }
}
