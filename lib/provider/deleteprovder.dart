import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled4/custom/fluttertoast.dart';

class DeleteRecordProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  Future<void> deleteCustomerRecord(
    BuildContext context,
    String taskID,
      String phonenumber
  ) async {
    try {
      isLoading = true;
      notifyListeners();

      String uid = FirebaseAuth.instance.currentUser!.uid;

      var taskRef = firestore
          .collection('Customerrecord')
          .doc(uid)
          .collection('Customerrecord')
          .doc(taskID);

      // Delete the customer record from Firestore
      await taskRef.delete();

      String fileName = '$phonenumber.jpg';
      Reference storageReference =
      FirebaseStorage.instance.ref().child('customerimg/$fileName');
      await storageReference.delete();
      print('Image deleted successfully');


      showToast('Record deleted successfully');


      // Notify listeners after the record and associated image are deleted
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

//

  Future<void> deleteCustomerImage(String phonenumber) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      String fileName = '$phonenumber.jpg';
      Reference storageReference =
          FirebaseStorage.instance.ref().child('customerimg/$fileName');
      await storageReference.delete();
      print('Image deleted successfully');
    } catch (error) {
      print('Error deleting image: $error');
      // Handle error as needed
    }
  }

  Future<void> deleteWorker(workerid) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var ref = FirebaseFirestore.instance
        .collection('worker')
        .doc(uid)
        .collection('worker')
        .doc(workerid);

    await ref.delete();
    showToast('Record delete successfully');
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
