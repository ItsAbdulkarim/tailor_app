import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:untitled4/custom/custom_searchbar.dart';
import 'package:untitled4/custom/customorderbutonscreen.dart';



class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController searchcontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:   Colors.blue.shade800,
        centerTitle: true,
        title: Text(
          'Order List',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.withOpacity(.5)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomOrderStatus(title: 'Normal', onTap: () {}),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child:
                          CustomOrderStatus(title: 'Urgent', onTap: () {}),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomOrderStatus(title: 'Active', onTap: () {}),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child:
                      CustomOrderStatus(title: 'Completed', onTap: () {}),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child:
                          CustomOrderStatus(title: 'delevered', onTap: () {}),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomOrderStatus(title: 'Canceled', onTap: () {}),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomSearchBar(controller: searchcontroller, onSearch: () {}),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
