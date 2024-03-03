import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled4/custom/fluttertoast.dart';

class DeleteRecordProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  Future<void> deleteCustomerRecord(BuildContext context, String taskID) async {
    try {
      isLoading = true;
      notifyListeners();

      String uid = FirebaseAuth.instance.currentUser!.uid;

      var taskRef = firestore
          .collection('Customerrecord')
          .doc(uid)
          .collection('Customerrecord')
          .doc(taskID);

      await taskRef.delete();
      showToast('Record delete successfully');

      // Notify listeners after the record is deleted
      notifyListeners();
    } catch (error) {
      print('Error deleting customer record: $error');
      // Handle error as needed
    } finally {
      isLoading = false;
      notifyListeners();
      Navigator.of(context).pop();
    }
  }
}

//also can do like this
//
// class DeleteRecordProvider extends ChangeNotifier {
//   bool isLoading = false;
//
//   Future<void> deleteCustomerRecord(BuildContext context, String taskID) async {
//     try {
//       isLoading = true;
//       notifyListeners();
//
//       // Your deletion logic here, e.g., Firestore delete operation
//       await FirebaseFirestore.instance
//           .collection('Customerrecord')
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('Customerrecord')
//           .doc(taskID)
//           .delete();
//
//       // Notify listeners after the record is deleted
//       notifyListeners();
//     } catch (error) {
//       print('Error deleting customer record: $error');
//       // Handle error as needed
//     } finally {
//       isLoading = false;
//       notifyListeners();
//       Navigator.of(context).pop(); // Close the dialog
//     }
//   }
// }
