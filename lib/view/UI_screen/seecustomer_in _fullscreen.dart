import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  const FullRecordScreen({
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
          child: Padding(
            padding: const EdgeInsets.all(10),
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
SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF1F1F1)),
                  child: Column(
                    children: [
                      Text(
                        'personal infromation',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        'Name: $name',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Phone: $phone',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Address: $addresss',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Gender: $gender',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                ////////////////////////////////////order
                SizedBox(
                  height: 20,
                ),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF1F1F1)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'OrderDate',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        'OrderDate: $orderdate',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'DeleviveryDate: $deleverdate',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                //////////////////////////////////////////
SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF1F1F1)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Pament Status',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        'pament Status: $pamentstatus',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                //pament

                ////////////////////////////////////////////////
                SizedBox(height: 20,),
//orderstatu
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF1F1F1)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Order Status',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        'Order Status: $orderstatus',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                ///////////////////////////////// //worker
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF1F1F1)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'WorkerName',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        'Worker: $worker',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                //measurement/////////////////
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF1F1F1)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Measurement',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        'Measurement: $selectmeasurrement',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF1F1F1)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Measurement',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        'Measurement: $selectmeasurrement',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

/////////////////////////////////////////////
                SizedBox(height: 20,),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Color(0xFFF1F1F1),
                //   ),
                //   padding: EdgeInsets.all(16), // Add padding for better spacing
                //   width: double.infinity,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Expanded(
                //             child: Text(
                //               'Suit Quantity: $suitquantity',
                //               style: TextStyle(
                //                 fontSize: 18, // Decrease font size for better readability
                //                 fontWeight: FontWeight.bold, // Make text bold for emphasis
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Text(
                //               'Suit Amount: $suitamount',
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 12), // Add vertical spacing between rows
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Expanded(
                //             child: Text(
                //               'Suit\nLength: $suitlength',
                //               style: TextStyle(
                //                 fontSize: 18,
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Text(
                //               'Sleeve\nLength: $suitslevelength',
                //               style: TextStyle(
                //                 fontSize: 18,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 12),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'Shoulder: $suitshoulder',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'Kalar: $suitkalar',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 12),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'Chest: $suitchest',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'Armhole: $suitarmhole',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 12),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'Daman: $suitdaman',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'Shalwar: $suitshalwar',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 12),
                //       Text(
                //         'Pancha: $suitpancha',
                //         style: TextStyle(
                //           fontSize: 18,
                //         ),
                //       ),
                //       SizedBox(height: 12),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'Front Pocket: $frontpocket',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'Side Pocket: $sidepocket',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 12),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'Goal Daman: $goaldaman',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'Widedaman: $widedaman',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),





                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     // Suit Quantity and Suit Amount
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Color(0xFFF1F1F1),
                //       ),
                //       padding: EdgeInsets.all(16),
                //       width: double.infinity,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'سوٹ کی مقدار: $suitquantity',
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           Text(
                //             'سوٹ کی رقم: $suitamount',
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 12),
                //     // Suit Length and Sleeve Length
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Color(0xFFF1F1F1),
                //       ),
                //       padding: EdgeInsets.all(16),
                //       width: double.infinity,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'سوٹ کی لمبائی: $suitlength',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'آستین کی لمبائی: $suitslevelength',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 12),
                //     // Shoulder and Kalar
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Color(0xFFF1F1F1),
                //       ),
                //       padding: EdgeInsets.all(16),
                //       width: double.infinity,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'کندھا: $suitshoulder',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'کلر: $suitkalar',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 12),
                //     // Chest and Armhole
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Color(0xFFF1F1F1),
                //       ),
                //       padding: EdgeInsets.all(16),
                //       width: double.infinity,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'سینے: $suitchest',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'آرم ہول: $suitarmhole',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 12),
                //     // Daman and Shalwar
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Color(0xFFF1F1F1),
                //       ),
                //       padding: EdgeInsets.all(16),
                //       width: double.infinity,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'دامن: $suitdaman',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'شلوار: $suitshalwar',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 12),
                //     // Pancha
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Color(0xFFF1F1F1),
                //       ),
                //       padding: EdgeInsets.all(16),
                //       width: double.infinity,
                //       child: Text(
                //         'پانچا: $suitpancha',
                //         style: TextStyle(
                //           fontSize: 18,
                //         ),
                //       ),
                //     ),
                //     SizedBox(height: 12),
                //     // Front Pocket and Side Pocket
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Color(0xFFF1F1F1),
                //       ),
                //       padding: EdgeInsets.all(16),
                //       width: double.infinity,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'سامنے کی جیب: $frontpocket',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'سائیڈ جیب: $sidepocket',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 12),
                //     // Goal Daman and Widedaman
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Color(0xFFF1F1F1),
                //       ),
                //       padding: EdgeInsets.all(16),
                //       width: double.infinity,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'گول دامن: $goaldaman',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //           Text(
                //             'وائیڈ دامن: $widedaman',
                //             style: TextStyle(
                //               fontSize: 18,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),




                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Suit Quantity
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'سوٹ کی مقدار / Suit Quantity: ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$suitquantity',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Suit Amount
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'سوٹ کی رقم / Suit Amount: ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$suitamount',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Suit Length
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'سوٹ کی لمبائی / Suit Length: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$suitlength',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Sleeve Length
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'آستین کی لمبائی / Sleeve Length: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$suitslevelength',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Shoulder
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'کندھا / Shoulder: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$suitshoulder',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Kalar
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'کلر / Kalar: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$suitkalar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Chest
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'سینے / Chest: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$suitchest',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Armhole
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'آرم ہول / Armhole: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$suitarmhole',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Daman
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'دامن / Daman: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$suitdaman',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Shalwar
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'شلوار / Shalwar: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$suitshalwar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Pancha
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'پانچا / Pancha: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          
                          Text('$suitpancha',style: TextStyle(
                            fontSize: 18,
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Front Pocket
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'سامنے کی جیب / Front Pocket: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$frontpocket',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Side Pocket
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'سائیڈ جیب / Side Pocket: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$sidepocket',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Goal Daman
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'گول دامن / Goal Daman: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$goaldaman',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Widedaman
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF1F1F1),
                      ),
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'وائیڈ دامن / Widedaman: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '$widedaman',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),





































SizedBox(height: 12,),

                Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF1F1F1)),
                  child: Text(
                    'Notes: $suitnotes',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),

                Text(
                  'Date: ${DateFormat('d MMMM y H:mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(dt)))}',
                  style: TextStyle(fontSize: 20),
                )



                // if (customerImg != null) Image.network(customerImg!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
