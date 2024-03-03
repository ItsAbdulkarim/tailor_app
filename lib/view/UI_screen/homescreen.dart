import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled4/custom/customcontainer_home.dart';
import 'package:untitled4/view/UI_screen/Add_customer_screen.dart';
import 'package:untitled4/view/UI_screen/seecustomerscreen.dart';
import 'package:untitled4/view/UI_screen/update_order_screen_first.dart';
import 'package:untitled4/view/UI_screen/worker_list_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,

      appBar: AppBar(

        backgroundColor:Colors.blue.shade800,
        centerTitle: true,
        title: Text('Homescreen',style: TextStyle(

            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)?.toggle();
          },
          icon: Icon(Icons.menu, size: 30,color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          children: [
            CustomContainer(
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AddCustomerScreen();
                    },
                  ));
                },
                img: 'images/addcust.png',
                title: 'Add Customer',
                subtitle: 'See details'),
            CustomContainer(
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SeeCustomerDetailScreen();
                    },
                  ));
                },
                img: 'images/eye.png',
                title: 'View Customer',
                subtitle: 'See details'),
            CustomContainer(
              ontap: (){

                Get.to(SeeCustomerDetailUpdateScreen());
              },
                img: 'images/todayorder.png',
                title: 'Update Orders',
                subtitle: 'See details'),
            CustomContainer(
                img: 'images/totalorder.png',
                title: 'Total Orders',
                subtitle: 'See details'),
            CustomContainer(
                img: 'images/assignwork.png',
                title: 'Assign Order',
                subtitle: 'See details'),
            CustomContainer(
              ontap: (){
                Get.to(WorkerListScreen());
              },
                img: 'images/shortlist.png',
                title: 'Worker List',
                subtitle: 'See details'),
          ],
        ),
      ),
    );
  }
}
