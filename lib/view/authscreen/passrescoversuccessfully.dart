import 'package:custom_signin_buttons/button_data.dart';
import 'package:custom_signin_buttons/button_list.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/view/authscreen/forgotpassword.dart';
import 'package:untitled4/view/authscreen/newpasswordscreen.dart';
import 'package:untitled4/view/authscreen/otpscreen.dart';
import 'package:untitled4/view/authscreen/signin.dart';
import 'package:untitled4/view/authscreen/signupscreen.dart';

import '../../custom/customtextformfield.dart';

class PasswordRecoverSuccess extends StatefulWidget {
  const PasswordRecoverSuccess({super.key});

  @override
  State<PasswordRecoverSuccess> createState() => _PasswordRecoverSuccessState();
}

class _PasswordRecoverSuccessState extends State<PasswordRecoverSuccess> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Get.to(NewPasswordScreen());
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: Colors.black87,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('images/second.json',
                    height: 180, width: 180, fit: BoxFit.cover),
                Center(
                  child: Text(
                    'Password Recover Successfully',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Center(
                    child: Text(
                  "Return to the login screen to enter the application",
                  textAlign: TextAlign.justify,
                )),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                    color: Colors.blue,
                    onPressed: () {
Get.to(SignInScreen());
                    },
                    text: ('Return to Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
