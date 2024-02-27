import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'bottomnavigationbar.dart';

class SeeCustomerDetailScreen extends StatefulWidget {
  const SeeCustomerDetailScreen({super.key});

  @override
  State<SeeCustomerDetailScreen> createState() =>
      _SeeCustomerDetailScreenState();
}

class _SeeCustomerDetailScreenState extends State<SeeCustomerDetailScreen> {
  @override
  CollectionReference? tasksRef;
  @override
  void initState() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    tasksRef = FirebaseFirestore.instance
        .collection('Customerrecord')
        .doc(uid)
        .collection('Customerrecord');

    super.initState();
  }

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
        body: StreamBuilder<QuerySnapshot>(
          stream: tasksRef!.snapshots(),
          builder: (context, snapshot) {
            List tasklist = snapshot.data!.docs;
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
                                ),
                              )
                            ],
                          )),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else {
              return const Center(child: SpinKitDualRing(color: Colors.purple));
            }
          },
        ));
  }
}