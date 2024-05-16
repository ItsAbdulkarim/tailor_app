import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/paid_unpaid_screen_provider.dart';
class UnPaidScreen extends StatefulWidget {
  const UnPaidScreen({super.key});

  @override
  State<UnPaidScreen> createState() => _UnPaidScreenState();
}

class _UnPaidScreenState extends State<UnPaidScreen> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<DocumentSnapshot>>(
      future: context.read<PaidUnPaidProvider>().getUnpaidCustomers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No unpaid customers available.'));
        } else {
          List<DocumentSnapshot> unpaidCustomers = snapshot.data!;

          return ListView.builder(
            itemCount: unpaidCustomers.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> customerData = unpaidCustomers[index].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(15)

                  ),

                  // Your card widget here with customer details
                  child:Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, top: 5, bottom: 5),
                        child: CircleAvatar(
                          backgroundImage: customerData['customerimg'] !=null?NetworkImage(customerData['customerimg']):NetworkImage('https://tse1.mm.bing.net/th?id=OIP.zyj0FFO-lfhm8uzozYdpbgHaHa&pid=Api&P=0&h=220'),


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
                              Text(customerData['name'],style: TextStyle(fontSize: 15),),
                              Text(customerData['pamentstatus'],style: TextStyle(fontSize: 15),),
                              Text(customerData['orderstatus'],style: TextStyle(fontSize: 15),),
                              Text(
                                '${DateFormat('d MMMM y H:mm').format(DateTime.fromMillisecondsSinceEpoch(customerData['dt'] as int))}',style: TextStyle(fontSize: 15),

                              )



                            ],
                          ),

                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );


  }
}
