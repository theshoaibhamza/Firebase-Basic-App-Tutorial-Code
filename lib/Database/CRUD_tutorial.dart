import 'package:cloud_firestore/cloud_firestore.dart';

class CrudTutorial {
  // INSTANCE

  final CollectionReference obj = FirebaseFirestore.instance.collection("CRUD");

  // CREATE

  Future<void> Create(
    String Name,
    String Age,
    String Address,
  ) {
    return obj.add({
      "NameAttribute": Name,
      "AgeAttribute": Age,
      "AddressAttribute": Address,
    });
  }

  // READ

  Stream<QuerySnapshot> Reading() {
    return obj.snapshots();
  }

  // UPDATE

  // DELETE
}
