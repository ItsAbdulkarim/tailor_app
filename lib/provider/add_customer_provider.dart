import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerRecordProvider extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addCustomerRecord(
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
      String selectedMeasurement = selectmeasurement.toString();
      String uid = FirebaseAuth.instance.currentUser!.uid;
      int dt = DateTime.now().millisecondsSinceEpoch;

      var taskRef = _firestore
          .collection('Customerrecord')
          .doc(uid)
          .collection('Customerrecord')
          .doc();

      Map<String, dynamic> customerData = {
        'dt': dt,
        'taskid': taskRef.id,
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
        customerData.addAll({
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
        customerData.addAll({
          'Shortquantity': shortquantity.trim(),
          'shortamount': shortamount.trim(),
          'addshortnotes': addshortnotes.trim(),
          'shortshoulderlength': shoulder.trim(),
          'slevelength': sleeveLength.trim(),
        });
      } else if (selectedMeasurement == 'PAINTS') {
        customerData.addAll({
          'paintamount': pantamount.trim(),
          'paintquantity': pantquantity.trim(),
        });
      }

      await taskRef.set(customerData);

      // Notify listeners after the record is added
      notifyListeners();
    } catch (error) {
      print('Error adding customer record: $error');
      // Handle error as needed
    }
  }
}
