import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/chekbacgrondimg.dart';
import 'package:untitled4/provider/add_customer_provider.dart';
import 'package:untitled4/provider/addworker_provider.dart';
import 'package:untitled4/provider/authentication_provder.dart';
import 'package:untitled4/provider/deleteprovder.dart';
import 'package:untitled4/provider/orderstatus_provider.dart';
import 'package:untitled4/provider/paid_unpaid_screen_provider.dart';
import 'package:untitled4/provider/search_customer_provider.dart';
import 'package:untitled4/provider/see_customer_provder.dart';
import 'package:untitled4/provider/themprovider.dart';
import 'package:untitled4/provider/update_provider.dart';
import 'package:untitled4/provider/update_worker_provider.dart';
import 'package:untitled4/provider/user_customer_img_provider.dart';

import 'package:untitled4/view/UI_screen/Add_customer_screen.dart';
import 'package:untitled4/view/UI_screen/bottomnavigationbar.dart';
import 'package:untitled4/view/UI_screen/general.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    storageBucket: 'tailoreaseapp.appspot.com',
    apiKey: 'AIzaSyDFA-Li7937gU1AbEVwGpru5oWznrMnmdU',
    appId: '1:325343300557:android:32a7168b659c8693ff9284',
    messagingSenderId: '325343300557',
    projectId: 'tailoreaseapp',
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AuthenticationProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return CustomerRecordProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return CustomerDetailPorvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return UpdateProvder();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return DeleteRecordProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return PaidUnPaidProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return UploadImgProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return AddWorkerProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return UpdateWorkerProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return OrderStatusProvider();
          },
        ),
        ChangeNotifierProvider(create: (context) {
          return SearchProvider();
        },),
        ChangeNotifierProvider(create: (context) {
          return ThemChanger();
        },)
      ],
      child: Builder(
        builder: (context) {

          return Consumer<ThemChanger>(builder: (context, value, child) {
            return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                themeMode: context.read<ThemChanger>().selectthemmode,
                theme: ThemeData(
                  brightness: Brightness.light,
                  appBarTheme: AppBarTheme(     backgroundColor: Color(0xFFFFFFFF),),
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,

                ),
                darkTheme: ThemeData(brightness: Brightness.dark),
                home:SplishScreen());
          },);
        },

      ),
    );
  }
}

//
//
//
// builder: (context) {
// return Consumer<ThemChanger>(
// builder: (context, themeProvider, child) {
// return MaterialApp(
// debugShowCheckedModeBanner: false,
// title: 'Flutter Demo',
// themeMode: themeProvider.selectthemmode,
// theme: ThemeData.light(),
// darkTheme: ThemeData.dark(),
// home: SplashScreen(),