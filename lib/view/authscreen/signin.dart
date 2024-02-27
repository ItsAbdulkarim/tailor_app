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
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/view/UI_screen/bottomnavigationbar.dart';
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
  bool rememberme = false;
  bool isObsecure = true;
  bool isLoading = false;
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  void validateform() async {
    if (formkey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        FirebaseAuth auth = FirebaseAuth.instance;
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailcontroller.text.trim(),
            password: passwordcontroller.text.trim());

        if (userCredential.user != Null) {

          await Future.delayed(Duration(seconds: 3));
          Get.offAll(AnimatedDrawerScreen());


        }else{



          Fluttertoast.showToast(
            msg: 'Login failed', // You might want to handle this case accordingly
            fontSize: 20,
            textColor: Colors.redAccent,
          );
        }

        Fluttertoast.showToast(
            msg: 'Login Successfully',
            fontSize: 20,
            textColor: Colors.redAccent);
      } on FirebaseException catch (e) {
        Fluttertoast.showToast(
            msg: e.message!, fontSize: 20, textColor: Colors.redAccent);
      } finally {
        setState(() {
          isLoading = false;
        });
      }

      print('ok');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: rememberme,
                            onChanged: (value) {
                              setState(() {
                                rememberme = value!;
                              });
                            },
                          ),
                          Text('Remember me'),
                          SizedBox(
                            width: 70,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(ForgetPassword());
                              },
                              child: Text('Forgot Password?'))
                        ],
                      ),
                      CustomButton(
                          color: Colors.blue,
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
                          SignInButton(
                            button: Button.Google,
                            height: 30,
                            width: 30,
                            small: true,
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SignInButton(
                            button: Button.Facebook,
                            small: true,
                            height: 30,
                            width: 30,
                            onPressed: () {},
                          )
                        ],
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
            ),
            if (isLoading)
              Container(
                color: Colors.white,
                child: Center(
                  child: SpinKitCircle(
                    color: Colors.blue, // You can customize the color
                    size: 50.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
