import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled4/view/splishscreen/secondsplishscreen.dart';

import '../UI_screen/bottomnavigationbar.dart';
import '../authscreen/signupscreen.dart';

class SplishScreen extends StatefulWidget {
  const SplishScreen({super.key});

  @override
  State<SplishScreen> createState() => _SplishScreenState();
}

class _SplishScreenState extends State<SplishScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 6), () {
Get.to(FirebaseAuth.instance.currentUser !=null?AnimatedDrawerScreen(): SignUpScreen());


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color(0xFF1D1D26),
        body: Container(
          height:double.infinity,
width: double.infinity,

decoration: BoxDecoration(
  image: DecorationImage(image: AssetImage('images/splishscreenimg.JPG'),fit: BoxFit.fill),


),


        ));
  }
}
