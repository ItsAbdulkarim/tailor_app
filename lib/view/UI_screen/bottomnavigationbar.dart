import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';import 'package:untitled4/view/UI_screen/TransactionScreen.dart';
import 'package:untitled4/view/UI_screen/homescreen.dart';
import 'package:untitled4/view/UI_screen/invoicescreen.dart';
import 'package:untitled4/view/UI_screen/orderscreen.dart';
import 'package:untitled4/view/authscreen/signin.dart';

class AnimatedDrawerScreen extends StatefulWidget {
  const AnimatedDrawerScreen({super.key});

  @override
  State<AnimatedDrawerScreen> createState() => _AnimatedDrawerScreenState();
}

class _AnimatedDrawerScreenState extends State<AnimatedDrawerScreen> {


  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(


      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.easeInOutCubic,

      showShadow: true,
      borderRadius: 24.0,
      shadowLayer1Color: Colors.brown[200],
      shadowLayer2Color: Colors.brown[300],
      menuScreen: MenuScreen(),
      mainScreen: BottomBarScreen(),
      angle: -10,
      duration: Duration(milliseconds: 700),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var user=FirebaseAuth.instance.currentUser;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/karim.jpg'),
                radius: 60,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  user!.email.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
            ListTile(
              leading: Text(
                'profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Text(
                'profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Text(
                'profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Text(
                'profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Text(
                'profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Text(
                'profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Text(
                'profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: TextButton(
                onPressed: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignInScreen();
                  },));
                },
                child: Text('LogOut'),
              ),
              trailing: Icon(
                Icons.logout_sharp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  var selected = 0;
  var list = [HomeScreen(), OrderScreen(), TransactionScreen(), InvoiceScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
        },
        color: Colors.white,
        elevation: 20,
        backgroundColor:Colors.blue.shade800,
        activeColor: Colors.white,
        height: 60.0,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.folder_copy_outlined, title: 'Order'),
          TabItem(icon: Icons.group, title: 'Customer'),
          TabItem(icon: Icons.file_copy_outlined, title: 'invoce'),
        ],
      ),
      body: list[selected],
    );
  }
}
