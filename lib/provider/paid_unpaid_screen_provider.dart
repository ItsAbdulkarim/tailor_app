
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PaidUnPaidProvider extends ChangeNotifier{
  // Retrieve paid customers
  Future<List<DocumentSnapshot>> getPaidCustomers() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Customerrecord')
        .doc(uid)
        .collection('Customerrecord')
        .where('pamentstatus', isEqualTo: 'PAID')
        .get();

    return querySnapshot.docs;
  }




// Retrieve unpaid customers
  Future<List<DocumentSnapshot>> getUnpaidCustomers() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Customerrecord')
        .doc(uid)
        .collection('Customerrecord')
        .where('pamentstatus', isEqualTo: 'UNPAID')
        .get();

    return querySnapshot.docs;
  }






}