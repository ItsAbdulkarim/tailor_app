import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/custom/dotwidgetscreen.dart';
import 'package:untitled4/view/UI_screen/invoicescreenforsuit.dart';
import 'package:untitled4/view/UI_screen/seecustomer_in%20_fullscreen.dart';
import 'package:untitled4/view/UI_screen/shirtscreenfull.dart';
import 'package:untitled4/view/invocescreenforshirt.dart';

import '../../provider/deleteprovder.dart';
import '../../provider/see_customer_provder.dart';

class InvoiceFirstScreen extends StatefulWidget {
  const InvoiceFirstScreen({super.key});

  @override
  State<InvoiceFirstScreen> createState() => _InvoiceFirstScreenState();
}

class _InvoiceFirstScreenState extends State<InvoiceFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(

        backgroundColor: Color(0xFFFFFFFF),
        centerTitle: true,
        title: Text(
          'Invocescreen',
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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: context.read<CustomerDetailPorvider>().getCustomerData(),
              builder: (context, snapshot) {
                List<DocumentSnapshot> tasklist = snapshot.data?.docs ?? [];
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(child: Text('No connection yet'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: SpinKitDualRing(color: Colors.purple));
                }

                if (tasklist.isEmpty) {
                  return const Center(child: Text('No Tasks Saved Yet'));
                }

                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: tasklist.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                             onTap: (){


                               var selectmeasurement=  tasklist[index]['selectedmeasurement'];
                               print(selectmeasurement);

                               // Parsing string to integer and double


                               if(selectmeasurement=='SHIRT') {
                                 int shirtItemQuantity = int.parse(tasklist[index]['Shirtquantity']);
                                 double shirtAmount = double.parse(tasklist[index]['shirtamount']);
                                 Get.to(InvoiceScreenForShirt(
                                     customername:tasklist[index]['name'],
                                     billid: tasklist[index][ 'uniqueId'].toString(),
                                     orderdate: tasklist[index]['orderdate'],
                                     deliverydate: tasklist[index]
                                     ['deliverydate'],
                                     itemquantity: shirtItemQuantity,
                                     itemname: tasklist[index]
                                     ['selectedmeasurement'],
                                     amount: shirtAmount,
                                     pamentatus: tasklist[index]
                                     ['pamentstatus'],
                                     Orderstatus: tasklist[index]
                                     ['orderstatus'],

                                   worker: tasklist[index][   'selectedworker'],
                                   address: tasklist[index][    'address'],
                                   customerImg: tasklist[index][ 'customerimg'],
                                   addshirtnotes: tasklist[index][ 'addshirtnotes'],
                                   customerphone: tasklist[index][ 'phone'],
                                   dt: tasklist[index][ 'dt'].toString(),
                                   shirtchest: tasklist[index]['shirtchest'],
                                   shirtcollar: tasklist[index][ 'shirtcollar'],
                                   shirtlength: tasklist[index][  'shirtlength'],
                                   shirtshoulder: tasklist[index][  'shirtshoulderlength'],
                                   shirtsleeeve: tasklist[index][ 'shirtslevelength'],
                                   shirtwaist:tasklist[index][  'shirtwaist'] ,




                                 ));
                               }else if(selectmeasurement=='SUITS') {

                                 int suititemQuantity = int.parse(tasklist[index]['Suitquantity']);
                                 double suitAmount = double.parse(tasklist[index]['suitamount']);
                                 Get.to(InvoiceScreenForSuit(

                                   billid: tasklist[index][ 'uniqueId'].toString(),
                                   name: tasklist[index]['name'],
                                   phone: tasklist[index]['phone'],
                                   addresss: tasklist[index]['address'],
                                   gender: tasklist[index]['gender'],
                                   orderdate: tasklist[index]['orderdate'],
                                   deleverdate: tasklist[index]
                                   ['deliverydate'],
                                   pamentstatus: tasklist[index]
                                   ['pamentstatus'],
                                   orderstatus: tasklist[index]
                                   ['orderstatus'],
                                   worker: tasklist[index]
                                   ['selectedworker'],
                                   selectmeasurrement: tasklist[index]
                                   ['selectedmeasurement'],
                                   suitquantity: suititemQuantity,
                                   suitamount: suitAmount,
                                   suitlength: tasklist[index]
                                   ['kamizlength'],
                                   suitslevelength: tasklist[index]
                                   ['asteenlength'],
                                   suitshoulder: tasklist[index]
                                   ['suitshoulderlength'],
                                   suitkalar: tasklist[index]['suitkalar'],
                                   suitchest: tasklist[index]['suitchati'],
                                   suitarmhole: tasklist[index]
                                   ['suitbaghal'],
                                   suitdaman: tasklist[index]['suitdaman'],
                                   suitpancha: tasklist[index]
                                   ['suitshalwarpancha'],
                                   suitshalwar: tasklist[index]
                                   ['suitshalwar'],
                                   suitnotes: tasklist[index]['addnotes'],
                                   sidepocket: tasklist[index]
                                   ['onesidepocket'],
                                   goaldaman: tasklist[index]['goaldaman'],
                                   frontpocket: tasklist[index]
                                   ['frontpocket'],
                                   widedaman: tasklist[index]
                                   ['chorasdaman'],
                                   dt: tasklist[index]['dt'].toString(),
                                   customerImg: tasklist[index]
                                   ['customerimg'],
                                 ));

                               }



                             },



                              child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 5, bottom: 5),
                                        child: CircleAvatar(
                                          backgroundImage: tasklist[index]
                                                      ['customerimg'] !=
                                                  null
                                              ? NetworkImage(
                                                  tasklist[index]['customerimg'])
                                              : NetworkImage(
                                                  'https://tse1.mm.bing.net/th?id=OIP.zyj0FFO-lfhm8uzozYdpbgHaHa&pid=Api&P=0&h=220'),
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
                                              Text(tasklist[index]['uniqueId']
                                                  .toString()),
                                              Text(tasklist[index]['phone']),
                                              Text(
                                                '${DateFormat('d MMMM y H:mm').format(DateTime.fromMillisecondsSinceEpoch(tasklist[index]['dt'] as int))}',
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
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
          )
        ],
      ),
    );
  }
}
