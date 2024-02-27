import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled4/custom/fluttertoast.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isUserRegistersuccessfully = false;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
//this is user registeration method
  Future<void> userRegisteration(
      BuildContext context, name, email, password, comporpassword) async {
    try {
      isLoading = true;
      notifyListeners();
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        firestore.collection('Tailor').doc(user.uid).set({
          'shopeName': name,
          'email': email,
          'password': password,
          'photo': null,
          'createddate': DateTime.now().millisecondsSinceEpoch,
        });

        showToast('User register Successfully ${user.uid}');
        isUserRegistersuccessfully = true;
      }
    } on FirebaseAuthException catch (e) {
      isUserRegistersuccessfully = false;
      //just for the knowledege
      print('error during registeration${e.message}');
      print('error during registeration${e.code}');
      showToast('error during registeration ${e}');
    } finally {
      isLoading = false;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  ///////////////////////////////////////////////////
  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = firebaseAuth.currentUser;
      if (user != null) {
        showToast('User login Successful ${user.uid}');
        isUserRegistersuccessfully = true;
        // Perform any additional actions after successful login, if needed.
      }
    } on FirebaseException catch (e) {
      isUserRegistersuccessfully = false;
      print('this is code ${e.code}');
      print('this is message ${e.message}');
      if (e.message == 'user-not-found') {
        showToast('No user found with this email. Please check your email.');
      } else if (e.code == 'wrong-password') {
        showToast('Wrong password provided. Please check your password.');
      } else if (e.code == 'invalid-email') {
        showToast('Invalid email address. Please provide a valid email.');
      } else if (e.code == 'user-disabled') {
        showToast('User account is disabled. Contact support for assistance.');
      } else if (e.code == 'too-many-requests') {
        showToast('Too many login attempts. Try again later.');
      } else if (e.code == 'credential-malformed') {
        showToast(
            'The supplied auth credential is incorrect, malformed, or has expired.');
        // Additional actions to handle the malformed credential
      } else if (e.code == 'invalid-credential') {
        // Show a generic error message for any unhandled error codes
        showToast(
            'the supplied auth credential is incorrect it may be password or email');
      } else {
        showToast('An error occurred during login${e}. Please try again.');
      }

      // ... (remaining code)

      // Handle specific login errors if needed.
    } finally {
      isLoading = false;
      notifyListeners();
      Navigator.pop(context);
    }
  }
}
