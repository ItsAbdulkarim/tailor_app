import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_signin_buttons/button_data.dart';
import 'package:custom_signin_buttons/button_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/view/authscreen/signin.dart';

import '../../custom/customtextformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obsecuretextcmp = true;
  bool obsecuretextp = true;
  bool isLoading = false;
  TextEditingController shopnamecontroller = TextEditingController();
  // TextEditingController fullname = TextEditingController();

  // TextEditingController mobilecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conformp = TextEditingController();
  // TextEditingController addresscontroller=TextEditingController();
  @override
  void dispose() {
    shopnamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    conformp.dispose();
    super.dispose();
  }
  var formkey = GlobalKey<FormState>();
  bool rememberme = false;
//register method .it is used to register user
  void formvalidation() async {
    if (formkey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });

        FirebaseAuth auth = FirebaseAuth.instance;
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: emailcontroller.text.trim().toString(),
                password: passwordcontroller.text.trim().toString());

        if (userCredential.user != null) {

          String uid = FirebaseAuth.instance.currentUser!.uid;
          //saved data in firestore
         FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
         await firebaseFirestore.collection('Tailor').doc(uid).set(
             {

             'email':emailcontroller.text.trim(),
               'name':shopnamecontroller.text.trim(),
               'photo':null,
               'uid':uid,
               'createddate':DateTime.now().millisecondsSinceEpoch



             });






Get.to(SignInScreen());

          Fluttertoast.showToast(
              msg: 'Register successfully',
              fontSize: 20,
              textColor: Colors.redAccent);
        }
      } on FirebaseAuthException catch (e) {
        print(e.code);
        print(e.message!);
        Fluttertoast.showToast(
            msg: e.message.toString(),
            fontSize: 20,
            textColor: Colors.redAccent);
      } finally {
        setState(() {
          isLoading = false;
        });
      }

      print('ok');
//this is part of if statment to clear all the field when click the button
      emailcontroller.clear();
      passwordcontroller.clear();
      shopnamecontroller.clear();
      conformp.clear();



    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: isLoading
              ? SpinKitDualRing(
                  color: Colors.blue, // Set the color of the spinner
                  size: 120.0,
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('images/third.json',
                            height: 200, width: 200, fit: BoxFit.cover),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Create an account',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text('SignUp now get started with an account'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Shop Name',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        CustomTextField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Shop/Tailor Name is required'),
                          ]),
                          controller: shopnamecontroller,
                          labelText: 'Shop Name/Talior Name',
                          prefixIcon: Icons.home,
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       'Full Name',
                        //       textAlign: TextAlign.start,
                        //       style: TextStyle(fontSize: 20),
                        //     ),
                        //   ],
                        // ),
                        // CustomTextField(
                        //   validator: MultiValidator([
                        //     RequiredValidator(errorText: 'Name field is required'),
                        //   ]),
                        //   controller: fullname,
                        //   labelText: 'Full Name',
                        //   prefixIcon: Icons.person,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       'Phone Number',
                        //       textAlign: TextAlign.start,
                        //       style: TextStyle(fontSize: 20),
                        //     ),
                        //   ],
                        // ),
                        // CustomTextField(
                        //   keybboardtype: TextInputType.number,
                        //   validator: MultiValidator([
                        //     RequiredValidator(errorText: 'Phone Number is required'),
                        //   ]),
                        //   controller: mobilecontroller,
                        //   labelText: 'Phone Number',
                        //   prefixIcon: Icons.phone,
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Email Address',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        CustomTextField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'email is required'),
                            EmailValidator(
                                errorText: 'enter a valid email address'),
                          ]),
                          controller: emailcontroller,
                          labelText: 'Email',
                          prefixIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Password',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        CustomTextField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Password is required'),
                              PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                  errorText:
                                      'passwords must have at least one special character'),
                              MinLengthValidator(6,
                                  errorText:
                                      'password must be at least 6 digits long'),
                            ]),
                            prefixIcon: Icons.lock,
                            controller: passwordcontroller,
                            labelText: 'Password',
                            obscureText: obsecuretextp,
                            suffix: IconButton(
                                onPressed: () {
                                  obsecuretextp = !obsecuretextp;
                                  setState(() {});
                                },
                                icon: Icon(obsecuretextp
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Conformed Password',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        CustomTextField(
                            obscureText: obsecuretextcmp,
                            prefixIcon: Icons.lock,
                            controller: conformp,
                            labelText: 'Confromed Password',
                            suffix: InkWell(
                                onTap: () {
                                  obsecuretextcmp = !obsecuretextcmp;
                                  setState(() {});
                                },
                                child: Icon(obsecuretextcmp
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm Password is required';
                              } else if (value != passwordcontroller.text) {
                                return 'Passwords do not match';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       'Address',
                        //       textAlign: TextAlign.start,
                        //       style: TextStyle(fontSize: 20),
                        //     ),
                        //   ],
                        // ),
                        // CustomTextField(
                        //   validator: MultiValidator([
                        //     RequiredValidator(errorText: 'Address is required'),
                        //   ]),
                        //   controller: addresscontroller,
                        //   labelText: 'Address',
                        //   prefixIcon: Icons.location_on,
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        // Row(
                        //   children: [
                        //     Checkbox(
                        //       value: rememberme,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           rememberme = value!;
                        //         });
                        //       },
                        //     ),
                        //     Text(
                        //       'I have read and agree to the ',
                        //       style: TextStyle(fontSize: 12),
                        //     ),
                        //     TextButton(
                        //         onPressed: () {}, child: Text('Terms of Services'))
                        //   ],
                        // ),
                        CustomButton(
                            color: Colors.blue,
                            onPressed: () async {
                              formvalidation();
                            },
                            text: ('SignUp')),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'or',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(child: Divider())
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SignInButton(
                        //       button: Button.Google,
                        //       height: 30,
                        //       width: 30,
                        //       small: true,
                        //       onPressed: () {},
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     SignInButton(
                        //       button: Button.Facebook,
                        //       small: true,
                        //       height: 30,
                        //       width: 30,
                        //       onPressed: () {},
                        //     )
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                                onPressed: () {
                                  Get.to(SignInScreen());
                                },
                                child: Text('Login'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
