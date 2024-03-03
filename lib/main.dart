import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/add_customer_provider.dart';
import 'package:untitled4/provider/authentication_provder.dart';
import 'package:untitled4/provider/deleteprovder.dart';
import 'package:untitled4/provider/paid_unpaid_screen_provider.dart';
import 'package:untitled4/provider/see_customer_provder.dart';
import 'package:untitled4/provider/update_provider.dart';


import 'package:untitled4/view/UI_screen/Add_customer_screen.dart';
import 'package:untitled4/view/UI_screen/bottomnavigationbar.dart';
import 'package:untitled4/view/UI_screen/homescreen.dart';
import 'package:untitled4/view/authscreen/forgotpassword.dart';
import 'package:untitled4/view/authscreen/newpasswordscreen.dart';
import 'package:untitled4/view/authscreen/otpscreen.dart';
import 'package:untitled4/view/authscreen/passrescoversuccessfully.dart';
import 'package:untitled4/view/authscreen/signin.dart';
import 'package:untitled4/view/authscreen/signupscreen.dart';
import 'package:untitled4/view/onboardingscreen.dart';
import 'package:untitled4/view/splishscreen/rough.dart';
import 'package:untitled4/view/splishscreen/secondsplishscreen.dart';


import 'package:untitled4/view/splishscreen/splishscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(


options: FirebaseOptions(
    apiKey: 'AIzaSyDTA25Nv7MQG0D7ZkZYn2lARK5YUd9w0N8',
    appId: '1:528661148026:android:41eb37f4d3c310b75366c3',
    messagingSenderId: '528661148026',
    projectId: 'tailorease-a4c58'



)




);



  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return AuthenticationProvider();
        },),
        ChangeNotifierProvider(create: (context) {
          return CustomerRecordProvider();
        },),
        ChangeNotifierProvider(create: (context) {
          return CustomerDetailPorvider();
        },),
        ChangeNotifierProvider(create: (context) {
          return UpdateProvder();

        },),
        ChangeNotifierProvider(create: (context) {
          return DeleteRecordProvider();
        },),
        ChangeNotifierProvider(create: (context) {
          return PaidUnPaidProvider();
        },)
      ],
      
      
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: AppBarTheme(

              backgroundColor: Colors.brown
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SignUpScreen()),
    );
  }
}
