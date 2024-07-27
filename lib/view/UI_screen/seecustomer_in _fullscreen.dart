import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../custom/dotwidgetscreen.dart';

// MADE THE CHANGE IN THIS SCREEN
class FullRecordScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String addresss;
  final String gender;
  final String orderdate;
  final String deleverdate;
  final String pamentstatus;

  final String orderstatus;
  final String worker;

  final String selectmeasurrement;
  final String suitquantity;
  final String suitamount;
  final String suitlength;
  final String suitslevelength;
  final String suitshoulder;
  final String suitkalar;
  final String suitchest;
  final String suitarmhole;
  final String suitdaman;
  final String suitshalwar;
  final String suitpancha;
  final bool frontpocket;
  final bool sidepocket;
  final bool goaldaman;
  final bool widedaman;

  final String suitnotes;

  final String dt;
  final String? customerImg;
  // final String shirtquantity;
  // final String shirtamount;
  // final String shirtcollar;
  // final String shirtchest;
  // final String shirtwaist;
  // final String shirtshoulder;
  // final String shirtsleeeve;
  // final String shirtlength;
  // final String addshirtnotes;
  // final bool shirtfirst;
  // final bool shirtsecond;
  // final bool shirtthird;
  // final bool shirtforth;

  FullRecordScreen({
    required this.suitlength,
    required this.suitslevelength,
    required this.suitshoulder,
    required this.suitkalar,
    required this.suitchest,
    required this.suitarmhole,
    required this.suitdaman,
    required this.suitpancha,
    required this.suitshalwar,
    required this.frontpocket,
    required this.sidepocket,
    required this.goaldaman,
    required this.widedaman,
    required this.suitnotes,
    required this.suitamount,
    required this.suitquantity,
    required this.addresss,
    required this.orderstatus,
    required this.orderdate,
    required this.deleverdate,
    required this.gender,
    required this.pamentstatus,
    required this.selectmeasurrement,
    required this.worker,
    required this.name,
    required this.phone,
    required this.dt,
    this.customerImg,
    //////////////////////////////
    // required this.shirtquantity,
    // required this.shirtamount,
    // required this.shirtcollar,
    //
    //
    //  required this.shirtchest,
    //  required this.shirtwaist,
    //  required this.shirtshoulder,
    //  required this.shirtsleeeve,
    //  required this.shirtlength,
    //  required this.addshirtnotes,
    //  required this.shirtfirst,
    //  required this.shirtsecond,
    //  required this.shirtthird,
    //  required this.shirtforth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('Customer Details'),
        // AppBar remains the same
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: customerImg != null
                            ? NetworkImage(customerImg!)
                            : NetworkImage(
                                'https://tse1.mm.bing.net/th?id=OIP.zyj0FFO-lfhm8uzozYdpbgHaHa&pid=Api&P=0&h=220'),
                        fit: BoxFit.cover)),
              ),

              // Display icon if no image available

              // Display full record data
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Personal Infromation',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '$name',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '$phone',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '$addresss',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '$gender',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Color(0xFFF1F1F1)),
              //   child: Column(
              //     children: [
              //       Text(
              //         'personal infromation',
              //         style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.bold,
              //             decoration: TextDecoration.underline),
              //       ),
              //       Text(
              //         'Name: $name',
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //       Text(
              //         'Phone: $phone',
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //       Text(
              //         'Address: $addresss',
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //       Text(
              //         'Gender: $gender',
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              ////////////////////////////////////order
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Order Date',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'OrderDate',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '$orderdate',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'DeliveryDate',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '$deleverdate',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Color(0xFFF1F1F1)),
              //   width: double.infinity,
              //   child: Column(
              //     children: [
              //       Text(
              //         'OrderDate',
              //         style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.bold,
              //             decoration: TextDecoration.underline),
              //       ),
              //       Text(
              //         'OrderDate: $orderdate',
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //       Text(
              //         'DeleviveryDate: $deleverdate',
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //////////////////////////////////////////pament status
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Pament Status',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Pament Status',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '$pamentstatus',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Color(0xFFF1F1F1)),
              //   width: double.infinity,
              //   child: Column(
              //     children: [
              //       Text(
              //         'Pament Status',
              //         style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.bold,
              //             decoration: TextDecoration.underline),
              //       ),
              //       Text(
              //         'pament Status: $pamentstatus',
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              //pament

              ////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
//orderstatu

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Order Status',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Order Status',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '$orderstatus',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Color(0xFFF1F1F1)),
              //   width: double.infinity,
              //   child: Column(
              //     children: [
              //       Text(
              //         'Order Status',
              //         style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.bold,
              //             decoration: TextDecoration.underline),
              //       ),
              //       Text(
              //         'Order Status: $orderstatus',
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              ///////////////////////////////// //worker
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'WorkerName',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Worker',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '$worker',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Color(0xFFF1F1F1)),
              //   width: double.infinity,
              //   child: Column(
              //     children: [
              //       Text(
              //         'WorkerName',
              //         style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.bold,
              //             decoration: TextDecoration.underline),
              //       ),
              //       Text(
              //         'Worker: $worker',
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              //measurement/////////////////
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Measurement',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Measurement',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '$selectmeasurrement',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Color(0xFFF1F1F1)),
              //   width: double.infinity,
              //   child: Column(
              //     children: [
              //       Text(
              //         'Measurement',
              //         style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.bold,
              //             decoration: TextDecoration.underline),
              //       ),
              //       Text(
              //         'Measurement: $selectmeasurrement',
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 10,
              ),

/////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),

              //measurement container

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Measurement',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'سوٹ کی مقدار / Suit Quantity: ',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitquantity',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'سوٹ کی رقم / Suit Amount:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitamount',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'سوٹ کی لمبائی / Suit Length:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitlength',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'آستین کی لمبائی / Sleeve Length:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitslevelength',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'کندھا / Shoulder:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitshoulder',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'کلر / Kalar:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitkalar',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'سینے / Chest:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitchest',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'آرم ہول / Armhole:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitarmhole',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'دامن / Daman:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitdaman',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'شلوار / Shalwar: ',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitshalwar',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'پانچا / Pancha:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$suitpancha',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'سامنے کی جیب / Front Pocket:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$frontpocket',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'سائیڈ جیب / Side Pocket:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$sidepocket',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'گول دامن / Goal Daman:',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$goaldaman',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      getdot('------------------------------------'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'وائیڈ دامن / Widedaman: ',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '$widedaman',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Notes',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Notes: ',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              '$suitnotes',
                              style: TextStyle(
                                  letterSpacing: 1,

                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Date And Time',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      getdot('------------------------------------'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Date & Time',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '${DateFormat('d MMMM y H:mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(dt)))}',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
/////////////////// comment due to dotcontaner
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Suit Quantity
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'سوٹ کی مقدار / Suit Quantity: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           '$suitquantity',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Suit Amount
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'سوٹ کی رقم / Suit Amount: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           '$suitamount',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Suit Length
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'سوٹ کی لمبائی / Suit Length: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$suitlength',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Sleeve Length
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'آستین کی لمبائی / Sleeve Length: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$suitslevelength',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Shoulder
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'کندھا / Shoulder: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$suitshoulder',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Kalar
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'کلر / Kalar: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$suitkalar',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Chest
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'سینے / Chest: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$suitchest',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Armhole
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'آرم ہول / Armhole: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$suitarmhole',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Daman
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'دامن / Daman: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$suitdaman',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Shalwar
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'شلوار / Shalwar: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$suitshalwar',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Pancha
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'پانچا / Pancha: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$suitpancha',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Front Pocket
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'سامنے کی جیب / Front Pocket: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$frontpocket',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Side Pocket
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'سائیڈ جیب / Side Pocket: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$sidepocket',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Goal Daman
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'گول دامن / Goal Daman: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$goaldaman',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   // Widedaman
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xFFF1F1F1),
//                     ),
//                     padding: EdgeInsets.all(16),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'وائیڈ دامن / Widedaman: ',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         Text(
//                           '$widedaman',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(
//                 height: 12,
//               ),
//
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Color(0xFFF1F1F1)),
//                 child: Text(
//                   'Notes: $suitnotes',
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//
//               Text(
//                 'Date: ${DateFormat('d MMMM y H:mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(dt)))}',
//                 style: TextStyle(fontSize: 20),
//               )

              // if (customerImg != null) Image.network(customerImg!),
            ],
          ),
        ),
      ),
    );
  }
}
