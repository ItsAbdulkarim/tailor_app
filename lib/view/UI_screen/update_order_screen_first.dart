import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/see_customer_provder.dart';
import 'package:untitled4/view/UI_screen/update_screen.dart';

import 'bottomnavigationbar.dart';

class SeeCustomerDetailUpdateScreen extends StatefulWidget {
  const SeeCustomerDetailUpdateScreen({super.key});

  @override
  State<SeeCustomerDetailUpdateScreen> createState() =>
      _SeeCustomerDetailUpdateScreenState();
}

class _SeeCustomerDetailUpdateScreenState extends State<SeeCustomerDetailUpdateScreen> {
  @override
  // CollectionReference? tasksRef;
  // @override
  // void initState() {
  //   String uid = FirebaseAuth.instance.currentUser!.uid;
  //   tasksRef = FirebaseFirestore.instance
  //       .collection('Customerrecord')
  //       .doc(uid)
  //       .collection('Customerrecord');
  //
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          centerTitle: true,
          title: Text(
            'see detail',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          leading: InkWell(
            onTap: () {
              Get.to(AnimatedDrawerScreen());
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        body:StreamBuilder<QuerySnapshot>(
          stream: context.read<CustomerDetailPorvider>().getCustomerData(),
          builder: (context, snapshot) {
            List<DocumentSnapshot> tasklist = snapshot.data?.docs??[];

            if (snapshot.connectionState == ConnectionState.none) {
              return const Center(child: Text('No connection yet'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: SpinKitDualRing(color: Colors.purple));
            }

            if (tasklist.isEmpty) {
              return const Center(child: Text('No Tasks Saved Yet'));
            }

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: tasklist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      height: 110,
                      child: Card(

                        color: Colors.blueGrey.shade300,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        elevation: 7,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 5, bottom: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.redAccent,
                                radius: 40,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(tasklist[index]['name']),
                                    Text(tasklist[index]['phone']),
                                    Text(tasklist[index]['dt'].toString())
                                  ],
                                ),
                                trailing: IconButton(onPressed: (){
                                  String taskID = tasklist[index].id;
                                  // Pass the taskID to the UpdateRecordScreen
                                  Get.to(UpdateCustomerScreen(taskSnapshot: tasklist[index],

                                  taskID: taskID,
                                  ));
                                },icon: Icon(Icons.edit),)
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            return const Center(child: Text('Unexpected ConnectionState'));
          },
        ));

  }
}
