import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UpdateProvder extends ChangeNotifier {
  bool isLoading = false;


  Future<void> updateCustomerRecord({
   required String taskid,
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
    required String suitquantity,
    required String suitamount,
    required String suitlength,
    required String suitsleeveLength,
    required String suitShoulder,
    required String suitkalar,
    required String suitchati,
    required String suitbaghal,
    required String suitdaman,
    required String suitshalwar,
    required String suitpancha,
    required String suitnotes,
    required bool frontpocket,
    required bool sidepocket,
    required bool goaldaman,
    required bool chorasdaman,


  }
      ) async {
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
          'Suitquantity': suitquantity.trim(),
          'suitamount': suitamount.trim(),
          'kamizlength': suitlength.trim(),
          'asteenlength': suitsleeveLength.trim(),
          'suitshoulderlength':suitShoulder.trim(),
          'suitkalar':suitkalar.trim(),
          'suitchati':suitchati.trim(),
          'suitbaghal':suitbaghal.trim(),
          'suitdaman':suitdaman.trim(),
          'suitshalwar':suitshalwar.trim(),
          'suitshalwarpancha':suitpancha.trim(),
          'addnotes': suitnotes.trim(),
          'frontpocket': frontpocket,
          'onesidepocket': sidepocket,
          'goaldaman': goaldaman,
          'chorasdaman': chorasdaman,
        });
      } else if (selectedMeasurement == 'SHIRT') {
        updatedData.addAll({
          // 'Shortquantity': shortquantity.trim(),
          // 'shortamount': shortamount.trim(),
          // 'addshortnotes': addshortnotes.trim(),
          // 'shortshoulderlength': shoulder.trim(),
          // 'slevelength': sleeveLength.trim(),
        });
      } else if (selectedMeasurement == 'PAINTS') {
        updatedData.addAll({
          // 'paintamount': pantamount.trim(),
          // 'paintquantity': pantquantity.trim(),
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
