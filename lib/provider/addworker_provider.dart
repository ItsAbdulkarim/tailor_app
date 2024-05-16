import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AddWorkerProvider extends ChangeNotifier {
  //add or save worker to firestore
  Future<void> AddWorkerMethod(name, phone, speciality, price) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    int dt = DateTime.now().millisecondsSinceEpoch;
    var workerlist = FirebaseFirestore.instance
        .collection('worker')
        .doc(uid)
        .collection('worker')
        .doc();
    workerlist.set({
      'workername': name,
      'workerphone': phone,
      'specialty': speciality,
      'price': price,
      'dt': dt,
      'workerid': workerlist.id
    });
  }

  //show worker method
  Stream<QuerySnapshot> getWorker() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('worker')
        .doc(uid)
        .collection('worker')
        .snapshots();

  }
}
