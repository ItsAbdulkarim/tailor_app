import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/authentication_provder.dart';
import 'package:untitled4/provider/see_customer_provder.dart';
import 'package:untitled4/provider/themprovider.dart';
import 'package:untitled4/provider/user_customer_img_provider.dart';
import 'package:untitled4/view/UI_screen/TransactionScreen.dart';
import 'package:untitled4/view/UI_screen/homescreen.dart';
import 'package:untitled4/view/UI_screen/invoicescreenforsuit.dart';
import 'package:untitled4/view/UI_screen/invoicescreenfirst.dart';
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
      shadowLayer1Color: Colors.white54,
      shadowLayer2Color: Colors.white60,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
        FutureBuilder<DocumentSnapshot>(
        future: context.read<CustomerDetailPorvider>().getOneUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(
                child: Text('No data available for this user.'));
          } else {
            final userData = snapshot.data!.data() as Map<String, dynamic>?;

            if (userData == null) {
              return Center(child: Text('User data is null.'));
            }

            final shopName = userData['shopeName'] as String?;
            final email = userData['email'] as String?;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: context
                          .watch<UploadImgProvider>()
                          .tailorImage !=
                          null
                          ? FileImage(
                          context.read<UploadImgProvider>().tailorImage!)
                          : null,
                    ),
                    Positioned(
                        right: -10,
                        bottom: 0,
                        child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Wrap(
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.camera_alt),
                                        title: Text('Take a Photo'),
                                        onTap: () async{
                                          await context.read<UploadImgProvider>().getUserImgSoucre(ImageSource.camera, context);
                                          await context.read<UploadImgProvider>().upLoadImgToStorage();



                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.camera_alt),
                                        title: Text('Choose a Gallery'),
                                        onTap: () async{
                                          await  context
                                              .read<UploadImgProvider>()
                                              .getUserImgSoucre(
                                              ImageSource.gallery,
                                              context);
                                          await context.read<UploadImgProvider>().upLoadImgToStorage();


                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.redAccent,
                            )))
                  ],
                ),
                Text('ShopName: ${shopName ?? 'N/A'}'),
                Text('Email: ${email ?? 'N/A'}'),
                // Add other Text widgets for additional data
                // For photo, if it's a URL, you can use Image.network
                // Image.network(userData['photo'])
              ],
            );
          }
        },
      ),

      // SizedBox(
            //   height: 40,
            // ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: C,ircleAvatar(
            //     backgroundImage: AssetImage('images/karim.jpg'),
            //     radius: 60,
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            // Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       user!.email.toString(),
            //       textAlign: TextAlign.center,
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            //     )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ThemChanger>(
                  builder: (context, themeProvider, child) {
                    return RadioListTile<ThemeMode>(
                      title: Text('Light Theme'),
                      value: ThemeMode.light,
                      groupValue: context.read<ThemChanger>().selectthemmode,
                      onChanged: (value) => context.read<ThemChanger>().changeThemMode(value!),
                    );
                  },
                ),
                Consumer<ThemChanger>(
                  builder: (context, themeProvider, child) {
                    return RadioListTile<ThemeMode>(
                      title: Text('Dark Theme'),
                      value: ThemeMode.dark,
                      groupValue: context.read<ThemChanger>().selectthemmode,
                      onChanged: (value) => context.read<ThemChanger>().changeThemMode(value!),
                    );
                  },
                ),
              ],
            ),
            // ListTile(
            //   leading: Text(
            //     'profile',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_back_ios,
            //     color: Colors.black,
            //   ),
            // ),
            // ListTile(
            //   leading: Text(
            //     'profile',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_back_ios,
            //     color: Colors.black,
            //   ),
            // ),
            // ListTile(
            //   leading: Text(
            //     'profile',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_back_ios,
            //     color: Colors.black,
            //   ),
            // ),
            // ListTile(
            //   leading: Text(
            //     'profile',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_back_ios,
            //     color: Colors.black,
            //   ),
            // ),
            // ListTile(
            //   leading: Text(
            //     'profile',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_back_ios,
            //     color: Colors.black,
            //   ),
            // ),
            // ListTile(
            //   leading: Text(
            //     'profile',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_back_ios,
            //     color: Colors.black,
            //   ),
            // ),
            ListTile(
              leading: TextButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Please wait.......'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SpinKitDualRing(
                              color: Colors.blue,
                              size: 70,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('user signOut...'),
                          ],
                        ),
                      );
                    },
                  );
                  await Future.delayed(Duration(seconds: 5));

                  await context.read<AuthenticationProvider>().signOut(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return SignInScreen();
                    },
                  ));
                },
                child: Text('LogOut'),
              ),
              trailing: Icon(
                Icons.logout_sharp,
                color: Colors.black,
              ),
            ),

            ListTile(
              leading: TextButton(
                onPressed: () async {
                  //here add dialog to show are u sure to delete then if yes in yes button u place this

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Please wait.......'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SpinKitDualRing(
                              color: Colors.blue,
                              size: 70,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('User account is deleted...'),
                          ],
                        ),
                      );
                    },
                  );
                  await Future.delayed(Duration(seconds: 5));

                  await context
                      .read<AuthenticationProvider>()
                      .deleteUserAccount(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return SignInScreen();
                    },
                  ));
                },
                child: Text('Delete'),
              ),
              trailing: Icon(
                Icons.delete_outline,
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
  var list = [
    HomeScreen(),
    OrderScreen(),
    TransactionScreen(),
    InvoiceFirstScreen()
  ];

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
        color: Colors.black,
        elevation: 10,
        backgroundColor: Color(0xFFFFFFFF),
        activeColor: Color(0xFF7A7B80),
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
