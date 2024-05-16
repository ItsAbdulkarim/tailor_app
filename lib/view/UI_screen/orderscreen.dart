import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:untitled4/custom/custom_searchbar.dart';
import 'package:untitled4/custom/customorderbutonscreen.dart';
import 'package:untitled4/view/UI_screen/ORDERSTATUS_SCREEN/active_status_screen.dart';
import 'package:untitled4/view/UI_screen/ORDERSTATUS_SCREEN/cancel_status_screen.dart';
import 'package:untitled4/view/UI_screen/ORDERSTATUS_SCREEN/complete_status_screen.dart';
import 'package:untitled4/view/UI_screen/ORDERSTATUS_SCREEN/delivered_status_screen.dart';
import 'package:untitled4/view/UI_screen/ORDERSTATUS_SCREEN/normal_status_screen.dart';
import 'package:untitled4/view/UI_screen/ORDERSTATUS_SCREEN/urgent_status_screen.dart';



class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: 0,

      child: Scaffold(
          backgroundColor: Color( 0xFFFFFFFF),
        appBar: AppBar(

          bottom: TabBar(
            isScrollable: true,

            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,

            indicator: BoxDecoration(
              color: Color(0xFF7A7B80),
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 4.0,
                ),
              ),
            ),

            tabs: [

              Tab(text: 'Normal'),
              Tab(text: 'Urgent'),
              Tab(text: 'Active'),
              Tab(text: 'Complete'),
              Tab(text: 'Delivered'),
              Tab(text: 'Canceled'),


            ],
          ),
            backgroundColor: Color( 0xFFFFFFFF),
          centerTitle: true,
          title: Text(
            'Order List',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        body: TabBarView(
          children: [

            NormalScreen(),
            UrgentScreen(),
            ActiveScreen(),
            CompletedScreen(),
            DeliverdScreen(),
            CancelScreen()


          ],
        )
      ),
    );
  }
}
