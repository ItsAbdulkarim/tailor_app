

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CustomerDetailPorvider extends ChangeNotifier {
  Stream<QuerySnapshot> getCustomerData() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('Customerrecord')
        .doc(uid)
        .collection('Customerrecord');
    return collectionReference.snapshots();
  }

// //or
//   Stream<QuerySnapshot> getCustomerrData() {
//     String uid = FirebaseAuth.instance.currentUser!.uid;
//     return FirebaseFirestore.instance
//         .collection('Customerrecord')
//         .doc(uid)
//         .collection('Customerrecord')
//         .snapshots();
//   }

Future<DocumentSnapshot> getOneUser()async{
  String uid = FirebaseAuth.instance.currentUser!.uid;
  DocumentSnapshot documentSnapshot =await FirebaseFirestore.instance.collection('Tailor').doc(uid).get();
  return documentSnapshot;
    

}




}
