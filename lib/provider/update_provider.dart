import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UpdateProvder extends ChangeNotifier {
  bool isLoading = false;


  Future<void> updateCustomerRecord(
      String taskid,
      BuildContext context,
      String selectmeasurement,
      String Name,
      String phone,
      String address,
      String Gender,
      String OrderDate,
      String DeliveryDate,
      String paymentStatus,
      String orderStatus,
      String selectWorker,
      String shkamizquantity,
      String shkamizamount,
      String kamizLength,
      String sleeveLength,
      String addkamisnotess,
      bool firstshirtshl,
      bool secondshirtshl,
      bool thirdshirtshl,
      bool fourthshirtshl,
      String shortquantity,
      String shortamount,
      String addshortnotes,
      String shoulder,
      String pantamount,
      String pantquantity) async {
    try {
      isLoading = true;
      notifyListeners();
      String uid = FirebaseAuth.instance.currentUser!.uid;


      var taskRef = FirebaseFirestore.instance
          .collection('Customerrecord')
          .doc(uid)
          .collection('Customerrecord')
          .doc(taskid);

      String selectedMeasurement = selectmeasurement.toString();

      Map<String, dynamic> updatedData = {
        'customerimg': '',
        'name': Name.trim(),
        'phone': phone.trim(),
        'address': address.trim(),
        'gender': Gender,
        'orderdate': OrderDate.trim(),
        'deliverydate': DeliveryDate.trim(),
        'pamentstatus': paymentStatus,
        'orderstatus': orderStatus,
        'selectedworker': selectWorker,
        'selectedmeasurement': selectedMeasurement,
      };

      if (selectedMeasurement == 'SUITS') {
        updatedData.addAll({
          'Suitquantity': shkamizquantity.trim(),
          'suitamount': shkamizamount.trim(),
          'kamizlength': kamizLength.trim(),
          'asteenlength': sleeveLength.trim(),
          'addnotes': addkamisnotess.trim(),
          'frontpocket': firstshirtshl,
          'onesidepocket': secondshirtshl,
          'bothsidepocket': thirdshirtshl,
          'gooldaman': fourthshirtshl,
        });
      } else if (selectedMeasurement == 'SHIRT') {
        updatedData.addAll({
          'Shortquantity': shortquantity.trim(),
          'shortamount': shortamount.trim(),
          'addshortnotes': addshortnotes.trim(),
          'shortshoulderlength': shoulder.trim(),
          'slevelength': sleeveLength.trim(),
        });
      } else if (selectedMeasurement == 'PAINTS') {
        updatedData.addAll({
          'paintamount': pantamount.trim(),
          'paintquantity': pantquantity.trim(),
        });
      }

      await taskRef.update(updatedData);

      // Notify listeners after the record is updated
      notifyListeners();
    } catch (error) {
      print('Error updating customer record: $error');
      // Handle error as needed
    } finally {
      isLoading = false;
      notifyListeners();
      Navigator.pop(context);
    }
  }
}
