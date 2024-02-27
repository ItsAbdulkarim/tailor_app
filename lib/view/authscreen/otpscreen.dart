import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/view/authscreen/forgotpassword.dart';
import 'package:untitled4/view/authscreen/newpasswordscreen.dart';
import 'package:untitled4/view/authscreen/signin.dart';
import 'package:untitled4/custom/customtextformfield.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpcode = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Get.to(ForgetPassword());
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: Colors.black87,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: SingleChildScrollView(

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
                    'OTP Verification',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    'Enter the OTP sent to - xyz@gmail.com ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  onChanged: (value) {
                    setState(() {
                      otpcode = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  autoFocus: true,
                  cursorColor: Colors.red,
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 60,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.red),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(child: Text('00:24 Sec')),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("Don't recieve code ? ")),
                    TextButton(onPressed: (){}, child: Text("Re_send"))
                  ],
                ),
               
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onPressed: () {



                      Get.to(NewPasswordScreen());



                    }, color: Colors.blue, text: 'Submit')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
