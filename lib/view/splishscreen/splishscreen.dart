import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled4/view/splishscreen/secondsplishscreen.dart';

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
    Timer(Duration(seconds: 7), () {

      Get.to(SecondSplishScreen());

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFDCA4D),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/bok.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'TAILOR BOOK',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
