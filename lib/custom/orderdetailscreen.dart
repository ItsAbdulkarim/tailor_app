import 'package:flutter/material.dart';

class OrderDetailsWidget extends StatelessWidget {
  final String imageAsset;
  final String serialNumber;
  final String name;
  final String? phoneNumber;
  final String? deliveryDate;
  final String? orderStatus;
  final String paymentStatus;
  final String? orderDate;
  final String? orderassign;

  OrderDetailsWidget({
    required this.imageAsset,
    required this.serialNumber,
    required this.name,
    this.phoneNumber,
    this.deliveryDate,
    this.orderStatus,
    required this.paymentStatus,
    this.orderDate,
    this.orderassign
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown[400],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'S NO: $serialNumber',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (phoneNumber != null)
                    Text(
                      phoneNumber!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (deliveryDate != null)
                    Text(
                      'Delivery date:\n $deliveryDate',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.only(top: 15,right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(orderStatus != null)
                Text(
                  'Order status: $orderStatus',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Payment status: $paymentStatus',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (orderDate != null)
                  Text(
                    'Order date: $orderDate',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                if (orderassign != null)
                  Text(
                    'OrderAssign: $orderassign',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

