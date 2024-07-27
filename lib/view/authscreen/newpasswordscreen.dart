import 'package:custom_signin_buttons/button_data.dart';
import 'package:custom_signin_buttons/button_list.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/view/authscreen/forgotpassword.dart';
import 'package:untitled4/view/authscreen/otpscreen.dart';
import 'package:untitled4/view/authscreen/passrescoversuccessfully.dart';
import 'package:untitled4/view/authscreen/signupscreen.dart';

import '../../custom/customtextformfield.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var formkey = GlobalKey<FormState>();
  TextEditingController newcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();
  bool rememberme = false;

  void validateform() {
    if (formkey.currentState!.validate()) {
      print('ok');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Get.to(OtpScreen());
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
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('images/second.json',
                      height: 180, width: 180, fit: BoxFit.cover),
                  Center(
                    child: Text(
                      'Set New Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                      child: Text(
                    "Enter new strong password, password at least 6 character, with max of letter and number",
                    textAlign: TextAlign.center,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'New password',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                          errorText:
                              'passwords must have at least one special character'),
                      MinLengthValidator(6,
                          errorText: 'password must be at least 6 digits long'),
                    ]),
                    controller: newcontroller,

                    suffix: Icon(Icons.visibility),
                    labelText: 'New Password',
                    prefixIcon: Icons.lock,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Confrom Password',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm Password is required';
                      } else if (value != newcontroller.text) {
                        return 'Passwords do not match';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    prefixIcon: Icons.lock,

                    controller: cpasswordcontroller,
                    labelText: 'conform Password',
                    suffix: Icon(Icons.visibility),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      color: Color(0xFF7A7B80),
                      onPressed: () {
                        Get.to(PasswordRecoverSuccess());
                        validateform();
                      },
                      text: ('Login')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
