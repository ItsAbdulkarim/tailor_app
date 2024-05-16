import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/user_customer_img_provider.dart';

class CustomerRecordProvider extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading= false;

  Future<void> addCustomerRecord({required BuildContext context,
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

    // String shortquantity,
    // String shortamount,
    // String addshortnotes,
    // String shoulder,
    // // String pantamount,
    // String pantquantity


  }

      ) async {
    try {
      isLoading=true;
      notifyListeners();
      String selectedMeasurement = selectmeasurement.toString();
      String uid = FirebaseAuth.instance.currentUser!.uid;
      int dt = DateTime.now().millisecondsSinceEpoch;

      var taskRef = _firestore
          .collection('Customerrecord')
          .doc(uid)
          .collection('Customerrecord')
          .doc();
      String? imageUrl = await context.read<UploadImgProvider>().imgurll;


      Map<String, dynamic> customerData = {
        'dt': dt,
        'taskid': taskRef.id,
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
        'selectedmeasurement': selectedMeasurement,
      };

      if (selectedMeasurement == 'SUITS') {
        customerData.addAll({
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
        customerData.addAll({
          // 'Shortquantity': shortquantity.trim(),
          // 'shortamount': shortamount.trim(),
          // 'addshortnotes': addshortnotes.trim(),
          // 'shortshoulderlength': shoulder.trim(),
          // 'slevelength': suitsleeveLength.trim(),
        });
      } else if (selectedMeasurement == 'PAINTS') {
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
    }finally{

      isLoading=false;
      notifyListeners();
      Navigator.pop(context);

    }
  }
}
