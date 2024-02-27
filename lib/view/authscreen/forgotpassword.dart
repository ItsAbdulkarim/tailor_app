import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/view/authscreen/otpscreen.dart';
import 'package:untitled4/view/authscreen/signin.dart';

import '../../custom/customtextformfield.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController forgotpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          leading: InkWell(
            onTap: (){Get.to(SignInScreen());},
            child: Icon(Icons.arrow_back_ios,
            size: 35,
              color: Colors.black87,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Lottie.asset('images/second.json',
                      height: 250, width: 250, fit: BoxFit.cover),
                ),
                Center(
                  child: Text(
                    'Forgott Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Enter the email address associated with your account to receive password reset code',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Email Address',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                CustomTextField(
                  labelText: 'Enter email',
                  controller: forgotpasswordcontroller,
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onPressed: () {

                      Get.to(OtpScreen());



                    }, color: Colors.blue, text: 'Submit')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
