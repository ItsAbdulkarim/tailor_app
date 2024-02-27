import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled4/view/authscreen/signin.dart';
import 'package:untitled4/view/onboardingscreen.dart';

class SecondSplishScreen extends StatefulWidget {
  const SecondSplishScreen({super.key});

  @override
  State<SecondSplishScreen> createState() => _SecondSplishScreenState();
}

class _SecondSplishScreenState extends State<SecondSplishScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 7), () {

      Get.to(OnboardScreen());

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          Lottie.asset('images/first.json', width: double.infinity),
          Text(
            "Mastering the Art of Tailor Measurements for Perfect Garments"
            ,style: TextStyle(color: Colors.black,

              fontWeight: FontWeight.bold,
              fontSize: 30),
            textAlign: TextAlign.justify,


          ),
          Text(
            "» Before making the dress, the tailor carefully wrote down the exact size of the client.",
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.justify,
          ),


          Text(
            "» Getting the measurements just right is super important for tailors to make clothes that fit perfectly and feel comfortable.",
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.justify,
          ),


      ],
    ),
        ));
  }
}
