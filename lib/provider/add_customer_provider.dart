import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/user_customer_img_provider.dart';

// I MADE THE CHANGE IN THIS SCREEN

class CustomerRecordProvider extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  Future<int> getNextCustomerId() async {
    try {
      DocumentReference counterRef = FirebaseFirestore.instance.collection('Counters').doc('customerCounter');
      DocumentSnapshot snapshot = await counterRef.get();

      if (!snapshot.exists) {
        // Initialize the counter document if it doesn't exist
        await counterRef.set({'currentId': 1});
        print('Counter document initialized successfully');
        return 1; // Return the initial ID
      }

      // Counter document exists, increment the ID and update the counter
      int currentId = snapshot['currentId'];
      int nextId = currentId + 1;
      await counterRef.update({'currentId': nextId});

      return nextId;
    } catch (e) {
      print("Error in getNextCustomerId: $e");
      return -1; // Return a default value or handle the error accordingly
    }
  }
  Future<void> addCustomerRecord({
    required BuildContext context,
    required String selectmeasurement,
    required String Name,
    required String phone,
    required String address,
    required String Gender,
    required String OrderDate,
    required String DeliveryDate,
    required String paymentStatus,
    required String orderStatus,
    required String selectWorker,
     String? suitquantity,
     String? suitamount,
     String? suitlength,
     String? suitsleeveLength,
     String? suitShoulder,
     String? suitkalar,
     String? suitchati,
     String? suitbaghal,
     String? suitdaman,
     String? suitshalwar,
     String? suitpancha,
     String? suitnotes,
     bool? frontpocket,
     bool? sidepocket,
     bool? goaldaman,
     bool? chorasdaman,
/////////////////////for shirt//////////////

    String? shirtquantity,
    String? shirtamount,
    String? shirtcollar,
    String? shirtchest,
    String? shirtwaist,
    String? shirtshoulder,
    String? shirtsleeeve,
    String? shirtlength,
    String? addshirtnotes,
    bool? shirtfirst,
    bool? shirtsecond,
    bool? shirtthird,
    bool? shirtforth,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      String uid = FirebaseAuth.instance.currentUser!.uid;
      int dt = DateTime.now().millisecondsSinceEpoch;
      //
      // Random random = Random();
      // int uniqueId = random.nextInt(10000);

      var taskRef = _firestore
          .collection('Customerrecord')
          .doc(uid)
          .collection('Customerrecord')
          .doc();
      String? imageUrl = await context.read<UploadImgProvider>().imgurll;
      // Get the next unique ID
      int uniqueId = await getNextCustomerId();
      Map<String, dynamic> customerData = {
        'dt': dt,
        'taskid': taskRef.id,
        'uniqueId': uniqueId,
        'customerimg': imageUrl,
        'name': Name.trim(),
        'phone': phone.trim(),
        'address': address.trim(),
        'gender': Gender,
        'orderdate': OrderDate.trim(),
        'deliverydate': DeliveryDate.trim(),
        'pamentstatus': paymentStatus,
        'orderstatus': orderStatus,
        'selectedworker': selectWorker,
        'selectedmeasurement': selectmeasurement,
      };

      if (selectmeasurement == 'SUITS') {
        customerData.addAll({
          'Suitquantity': suitquantity,
          'suitamount': suitamount,
          'kamizlength': suitlength,
          'asteenlength': suitsleeveLength,
          'suitshoulderlength': suitShoulder,
          'suitkalar': suitkalar,
          'suitchati': suitchati,
          'suitbaghal': suitbaghal,
          'suitdaman': suitdaman,
          'suitshalwar': suitshalwar,
          'suitshalwarpancha': suitpancha,
          'addnotes': suitnotes,
          'frontpocket': frontpocket,
          'onesidepocket': sidepocket,
          'goaldaman': goaldaman,
          'chorasdaman': chorasdaman,
        });
      } else if (selectmeasurement == 'SHIRT') {
        customerData.addAll({
          'Shirtquantity': shirtquantity,
          'shirtamount': shirtamount,
          'shirtcollar': shirtcollar,
          'shirtchest': shirtchest,
          'shirtwaist': shirtwaist,
          'shirtshoulderlength': shirtshoulder,
          'shirtslevelength': shirtsleeeve,
          'shirtlength': shirtlength,
          'addshirtnotes': addshirtnotes,
        });
      } else if (selectmeasurement == 'PAINTS') {
        customerData.addAll({
          // 'paintamount': pantamount.trim(),
          // 'paintquantity': pantquantity.trim(),
        });
      }

      await taskRef.set(customerData);

      // Notify listeners after the record is added
      notifyListeners();
    } catch (error) {
      print('Error adding customer record: $error');
      // Handle error as needed
    } finally {
      isLoading = false;
      notifyListeners();
      Navigator.pop(context);
    }
  }
}
