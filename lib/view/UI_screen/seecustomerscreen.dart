import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/deleteprovder.dart';
import 'package:untitled4/provider/search_customer_provider.dart';
import 'package:untitled4/provider/see_customer_provder.dart';
import 'package:untitled4/view/UI_screen/seecustomer_in%20_fullscreen.dart';

import 'bottomnavigationbar.dart';

class SeeCustomerDetailScreen extends StatefulWidget {
  const SeeCustomerDetailScreen({super.key});

  @override
  State<SeeCustomerDetailScreen> createState() =>
      _SeeCustomerDetailScreenState();
}

class _SeeCustomerDetailScreenState extends State<SeeCustomerDetailScreen> {
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
  String _searchQuery = '';
  bool _searchByPhone = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),

          centerTitle: true,
          actions: [

            Switch(
              activeColor: Colors.black,
              value: _searchByPhone,
              onChanged: (value) {
                setState(() {
                  _searchByPhone = value;
                });
              },
            ),
          ],
          title: Text(
            'see detail',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          leading: InkWell(
            onTap: () {
              Get.to(AnimatedDrawerScreen());
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [



            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
              onChanged: (value) {
    setState(() {
    _searchQuery = value.toLowerCase(); // Update search query
    });
    },
      decoration: InputDecoration(
        labelText: _searchByPhone?'Search by phone number':'Search by Name',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
    ),
            ),

SizedBox(height: 10,),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:_searchQuery.isEmpty
                    ? context.read<CustomerDetailPorvider>().getCustomerData()
                    : _searchByPhone
                    ? context
                    .read<SearchProvider>()
                    .searchUserBYPhone(_searchQuery)
                    : context
                    .read<SearchProvider>()
                    .searchUserByName(_searchQuery),
                builder: (context, snapshot) {
                  List<DocumentSnapshot> tasklist = snapshot.data?.docs ?? [];

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
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF1F1F1),
                                    borderRadius: BorderRadius.circular(20)

                                  ),

                                  child: GestureDetector(
                                    onTap: (){
                                      Get.to(FullRecordScreen(
                                        name: tasklist[index]['name'],
                                        phone: tasklist[index]['phone'],
                                        addresss: tasklist[index][ 'address'],
                                        gender: tasklist[index][ 'gender'],
                                        orderdate: tasklist[index]['orderdate'],
                                        deleverdate: tasklist[index][   'deliverydate'],
                                        pamentstatus: tasklist[index][ 'pamentstatus'],
                                        orderstatus: tasklist[index][   'orderstatus'],
                                        worker: tasklist[index][ 'selectedworker'],
                                        selectmeasurrement: tasklist[index][ 'selectedmeasurement'],
                                        suitquantity: tasklist[index][   'Suitquantity'],
                                        suitamount: tasklist[index][  'suitamount'],
                                        suitlength: tasklist[index][    'kamizlength'],
                                        suitslevelength: tasklist[index][  'asteenlength'],
                                        suitshoulder: tasklist[index][ 'suitshoulderlength'],
                                        suitkalar: tasklist[index][ 'suitkalar'],
                                        suitchest: tasklist[index][  'suitchati'],
                                        suitarmhole: tasklist[index][  'suitbaghal'],
                                        suitdaman: tasklist[index][ 'suitdaman'],
                                        suitpancha: tasklist[index][  'suitshalwarpancha'],
                                        suitshalwar: tasklist[index][  'suitshalwar'],
                                        suitnotes: tasklist[index][  'addnotes'],
                                        sidepocket: tasklist[index][ 'onesidepocket'],
                                        goaldaman:  tasklist[index][    'goaldaman'],
                                        frontpocket:  tasklist[index][ 'frontpocket'],
                                        widedaman:  tasklist[index][  'chorasdaman'],
                                        dt: tasklist[index]['dt'].toString(),
                                        customerImg: tasklist[index]['customerimg'],

                                         ));

                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, top: 5, bottom: 5),
                                          child: CircleAvatar(
                                         backgroundImage: tasklist[index]['customerimg'] !=null?NetworkImage(tasklist[index]['customerimg']):NetworkImage('https://tse1.mm.bing.net/th?id=OIP.zyj0FFO-lfhm8uzozYdpbgHaHa&pid=Api&P=0&h=220'),


                                            radius: 40,
                                          ),
                                        ),

                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            title: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(tasklist[index]['name']),
                                                Text(tasklist[index]['phone']),
                                                Text(
                                                  '${DateFormat('d MMMM y H:mm').format(DateTime.fromMillisecondsSinceEpoch(tasklist[index]['dt'] as int))}',

                                                )



                                              ],
                                            ),
                                            trailing: GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text('Confirm Deletion'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(context); // Close the dialog
                                                            },
                                                            child: Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                              onPressed: () async {
                                                                String taskID =
                                                                    tasklist[index].id;
                                                                String imgurl=tasklist[index][ 'phone'];
                                                                await context
                                                                    .read<
                                                                        DeleteRecordProvider>()
                                                                    .deleteCustomerRecord(
                                                                        context,
                                                                        taskID,
                                                                  imgurl

                                                                );

                                                              },
                                                              child: Text('Delete'))
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.delete_outline,
                                                  size: 40,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
              ),
            ),
          ],
        ));
  }
}
