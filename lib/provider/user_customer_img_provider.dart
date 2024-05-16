import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:untitled4/custom/fluttertoast.dart';

class UploadImgProvider extends ChangeNotifier {
  File? tailorImage;
  File? customerImage;
  String? imgurll;

  final picker = ImagePicker();

  Future<void> getUserImgSoucre(
      ImageSource source, BuildContext context) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      tailorImage = File(pickedFile.path);
      notifyListeners();
      Navigator.of(context).pop(); // Close the bottom sheet
    } else {
      print('No image selected.');
    }
  }

  Future<void> upLoadImgToStorage() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      String fileName =
          '$uid-${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';

      Reference storageReference =
          FirebaseStorage.instance.ref().child('image/$fileName');
      UploadTask uploadTask = storageReference.putFile(tailorImage!);

      await uploadTask.whenComplete(() => null);
      String imageUrl = await storageReference.getDownloadURL();
      print('Uploaded tailor image URL: $imageUrl');

      await FirebaseFirestore.instance.collection('Tailor').doc(uid).update({
        'photo': imageUrl,
      });

      showToast('Tailor image upload successful');
    } catch (e) {
      print('Error uploading tailor image: $e');
      showToast('Failed to upload tailor image');
    }
  }

  Future<void> getCustomerImgSoucre(
      ImageSource source, BuildContext context) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      customerImage = File(pickedFile.path);
      notifyListeners();
      Navigator.of(context).pop(); // Close the bottom sheet
    } else {
      print('No image selected.');
    }
  }

  Future<void> uploadCustomerImage(String phonenumber) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      String fileName =
          '$phonenumber.jpg';

      Reference storageReference =
          FirebaseStorage.instance.ref().child('customerimg/$fileName');
      UploadTask uploadTask = storageReference.putFile(customerImage!);

      await uploadTask;
      imgurll = await storageReference.getDownloadURL();
      notifyListeners();
      print('Uploaded customer image URL: $imgurll');
      customerImage = null;
      notifyListeners();
    } catch (e) {
      print('Error uploading customer image: $e');
    }
  }

//
//
//   Future<String?> upLoadCustomerImgToStorage() async {
//     try {
//
//       String fileName = '${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
//
//       Reference storageReference =
//       FirebaseStorage.instance.ref().child('customerimg/$fileName');
//       UploadTask uploadTask =  storageReference.putFile(customerImage!);
//
//       await uploadTask;
//       String imageUrl = await storageReference.getDownloadURL();
//       print('Uploaded customer image URL: $imageUrl');
//
// return imageUrl;
//
//
//       showToast('Customer image upload successful');
//     } catch (e) {
//       print('Error uploading customer image: $e');
//
//       showToast('Failed to upload customer image');
//       return null;
//     }
//   }
}
