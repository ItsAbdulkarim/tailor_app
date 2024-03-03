import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/paid_unpaid_screen_provider.dart';
class PaidScreen extends StatefulWidget {
  const PaidScreen({super.key});

  @override
  State<PaidScreen> createState() => _PaidScreenState();
}

class _PaidScreenState extends State<PaidScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
        future: context.read<PaidUnPaidProvider>().getPaidCustomers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No paid customers available.'));
          } else {
            List<DocumentSnapshot> paidCustomers = snapshot.data!;

            return ListView.builder(
              itemCount: paidCustomers.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> customerData = paidCustomers[index]
                    .data() as Map<String, dynamic>;

                return Card(
                  // Your card widget here with customer details
                  child: ListTile(
                    title: Text(customerData['name'] ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Payment Status: ${customerData['pamentstatus'] ??
                            ''}'),
                        Text('Order Status: ${customerData['orderstatus'] ??
                            ''}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }


    );
  }}