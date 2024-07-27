

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_signin_buttons/button_data.dart';
import 'package:custom_signin_buttons/button_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/provider/authentication_provder.dart';
import 'package:untitled4/view/UI_screen/bottomnavigationbar.dart';
import 'package:untitled4/view/authscreen/email_verification_screen.dart';
import 'package:untitled4/view/authscreen/forgotpassword.dart';
import 'package:untitled4/view/authscreen/signupscreen.dart';

import '../../custom/customtextformfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool isObsecure = true;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  void validateform() async {
    if (formkey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Please wait.......'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpinKitDualRing(
                    color: Color(0xFF7A7B80),
                  size: 70,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Login user...'),
              ],
            ),
          );
        },
      );// show dialoge
      await context.read<AuthenticationProvider>().loginUser(context,
          emailcontroller.text.trim(),

          passwordcontroller.text.trim());
      if (context.read<AuthenticationProvider>().isUserRegistersuccessfully) {


        // Check if user's email is verified
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null && user.emailVerified) {
          // Navigate to home screen if email is verified
          Get.offAll(AnimatedDrawerScreen());
        } else {
          // If email is not verified, navigate to the verification screen
          Get.offAll(EmailVerificationScreen());
        }
        print('Login successful');


      }
      emailcontroller.clear();
      passwordcontroller.clear();



      print('ok');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

         backgroundColor: Color(0xffDADEDD),

        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(

            gradient:  LinearGradient(colors: [
              
              Color(0xffDADEDD),
              Color(0xffE9E9E7),
              Color(0xffEFF1EE),
              Color(0xffEFEFED),

            ],

            begin: Alignment.topLeft,
            end: Alignment.bottomLeft)
          ),
          child: ListView(
            children: [
              Image.asset('images/signinimg.PNG',height: 400,width: double.infinity,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Lottie.asset('images/second.json',
                      //     height: 180, width: 180, fit: BoxFit.cover),
                      Center(
                        child: Text(
                          'Login to your account',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('Welcome back,Please enter your details'),
                      SizedBox(
                        height: 20,
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
                          RequiredValidator(errorText: 'Email is required'),
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
                        obscureText: isObsecure,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'password is reuired'),
                          PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                              errorText:
                                  'passwords must have at least one special character'),
                          MinLengthValidator(6,
                              errorText:
                                  'password must be at least 8 digits long'),
                        ]),
                        prefixIcon: Icons.lock,
                        controller: passwordcontroller,
                        labelText: 'Password',
                        suffix: InkWell(
                            onTap: () {
                              setState(() {});
                              isObsecure = !isObsecure;
                            },
                            child: Icon(isObsecure
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(ForgetPassword());
                          },
                          child: Text('Forgot Password?')),
                      CustomButton(
                          color: Color(0xFF7A7B80),
                          onPressed: () async {
                            validateform();
                          },
                          text: ('Login')),
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                              onPressed: () {
                                Get.to(SignUpScreen());
                              },
                              child: Text('SignUp'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
