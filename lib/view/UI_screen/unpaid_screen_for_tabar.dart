import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

              return Card(
                // Your card widget here with customer details
                child: ListTile(
                  title: Text(customerData['name'] ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Payment Status: ${customerData['pamentstatus'] ?? ''}'),
                      Text('Order Status: ${customerData['orderstatus'] ?? ''}'),
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
