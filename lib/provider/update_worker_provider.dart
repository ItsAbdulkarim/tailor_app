import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UpdateWorkerProvider extends ChangeNotifier {
  Future<void> updateWorkerMethod(
      String taskid, name, phone, speciality, price) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    int dt = DateTime.now().millisecondsSinceEpoch;
    var workerlist = FirebaseFirestore.instance
        .collection('worker')
        .doc(uid)
        .collection('worker')
        .doc(taskid);
    workerlist.update({
      'workername': name,
      'workerphone': phone,
      'specialty': speciality,
      'price': price,
    });
  }
}
