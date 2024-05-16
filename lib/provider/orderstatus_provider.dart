import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class OrderStatusProvider extends ChangeNotifier{


  Future<List<DocumentSnapshot>> getNormalStatus() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Customerrecord')
        .doc(uid)
        .collection('Customerrecord')
        .where('orderstatus', isEqualTo: 'NORMAL')
        .get();

    return querySnapshot.docs;
  }


  Future<List<DocumentSnapshot>> getUrgentStatus() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Customerrecord')
        .doc(uid)
        .collection('Customerrecord')
        .where('orderstatus', isEqualTo: 'URGENT')
        .get();

    return querySnapshot.docs;
  }


  Future<List<DocumentSnapshot>> getActiveStatus() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Customerrecord')
        .doc(uid)
        .collection('Customerrecord')
        .where('orderstatus', isEqualTo: 'ACTIVE')
        .get();

    return querySnapshot.docs;
  }


  Future<List<DocumentSnapshot>> getCompletedStatus() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Customerrecord')
        .doc(uid)
        .collection('Customerrecord')
        .where('orderstatus', isEqualTo: 'COMPLETED')
        .get();

    return querySnapshot.docs;
  }


  Future<List<DocumentSnapshot>> getDeliveredStatus() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Customerrecord')
        .doc(uid)
        .collection('Customerrecord')
        .where('orderstatus', isEqualTo: 'DELEVERED')
        .get();

    return querySnapshot.docs;
  }


  Future<List<DocumentSnapshot>> getCancelStatus() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Customerrecord')
        .doc(uid)
        .collection('Customerrecord')
        .where('orderstatus', isEqualTo: 'CANCLE')
        .get();

    return querySnapshot.docs;
  }




}