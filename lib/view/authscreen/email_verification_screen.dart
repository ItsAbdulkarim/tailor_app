import 'dart:async'; // Importing async library for Timer
import 'package:firebase_auth/firebase_auth.dart'; // Importing FirebaseAuth for authentication
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled4/view/UI_screen/bottomnavigationbar.dart'; // Importing Material package for widgets// Import your dashboard screen here

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool emailVerified = false; // Variable to track email verification status
  Timer? timer; // Timer to check email verification periodically

  @override
  void initState() {
    // This method is called when the stateful widget is inserted into the tree

  // Send email verification

    // Start a timer that runs every 5 seconds
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      // Call verificationCheck method to check if email is verified
      verificationCheck();
    });

    super.initState(); // Call the super class' initState method
  }

  verificationCheck() {
    // Method to check if email is verified

    FirebaseAuth.instance.currentUser!.reload(); // Reload the current user's data

    if (FirebaseAuth.instance.currentUser!.emailVerified) { // Check if email is verified
      timer?.cancel(); // Cancel the timer if email is verified
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        // Navigate to the dashboard screen if email is verified
        return const AnimatedDrawerScreen();
      }));
    }
  }

  @override
  void dispose() {
    // This method is called when the stateful widget is removed from the tree

    timer!.cancel(); // Cancel the timer to prevent memory leaks

    super.dispose(); // Call the super class' dispose method
  }

  @override
  Widget build(BuildContext context) {
    // This method builds and returns the widget hierarchy

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'), // AppBar title
      ),

      body: ListView(
        children: [
          const SizedBox(height: 100),
          Text('Verify Email\nAn email has been sent to ${FirebaseAuth.instance.currentUser!.email}'), // Text widget to display email address
          Text('Please Verify It'), // Text widget instructing user to verify email
          const SizedBox(height: 20),
      Center(child: SpinKitDualRing(color: Colors.blue)), // Circular progress indicator while waiting for email verification

          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.currentUser!.sendEmailVerification(); // Resend email verification
            },
            child: const Text('Resend Email'), // Button to resend email verification
          ),
        ],
      ),
    );
  }
}
