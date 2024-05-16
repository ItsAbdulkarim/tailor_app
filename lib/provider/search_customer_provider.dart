import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier
{
// Function to search for users by name or phone number
  Stream<QuerySnapshot<Object?>> searchUserBYPhone(String query) {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Perform Firestore query to search for users
      Stream<QuerySnapshot<Object?>> stream = FirebaseFirestore.instance
          .collection('Customerrecord')
          .doc(uid)
          .collection('Customerrecord')
      // Search by name
          .where('phone', isEqualTo: query) // Search by phone number
          .snapshots();

      // Return the stream of query snapshots
      return stream;
    } catch (error) {
      print('Error searching users: $error');
      // Return an empty stream if there's an error
      return Stream.empty();
    }
  }
//////////////////////////////////////////////////////////////


  Stream<QuerySnapshot<Object?>> searchUserByName(String query) {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Perform Firestore query to search for users
      Stream<QuerySnapshot<Object?>> stream = FirebaseFirestore.instance
          .collection('Customerrecord')
          .doc(uid)
          .collection('Customerrecord')
          .where('name', isEqualTo: query) // Search by name
           // Search by phone number
          .snapshots();

      // Return the stream of query snapshots
      return stream;
    } catch (error) {
      print('Error searching users: $error');
      // Return an empty stream if there's an error
      return Stream.empty();
    }
  }



}