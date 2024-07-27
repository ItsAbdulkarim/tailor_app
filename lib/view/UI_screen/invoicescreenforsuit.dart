import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/custom/custombutton.dart';
import 'package:untitled4/custom/dotwidgetscreen.dart';
import 'package:untitled4/provider/see_customer_provder.dart';
import 'package:untitled4/services/printer_pdf_for_suit.dart';

class InvoiceScreenForSuit extends StatefulWidget {
  final String name;
  final String billid;
  final String orderdate;
  final String deleverdate;
  final int suitquantity;
  final String selectmeasurrement;
  final double suitamount;
  final String pamentstatus;
  final String orderstatus;

  final String phone;
  final String addresss;
  final String gender;

  final String worker;

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

  const InvoiceScreenForSuit(
      {super.key,
      required this.name,
      required this.billid,
      required this.orderdate,
      required this.deleverdate,
      required this.suitquantity,
      required this.selectmeasurrement,
      required this.suitamount,
      required this.pamentstatus,
      required this.orderstatus,
      required this.phone,
      required this.addresss,
      required this.gender,
      required this.worker,
      required this.suitlength,
      required this.suitslevelength,
      required this.suitshoulder,
      required this.suitkalar,
      required this.suitchest,
      required this.suitarmhole,
      required this.suitdaman,
      required this.suitshalwar,
      required this.suitpancha,
      required this.frontpocket,
      required this.sidepocket,
      required this.goaldaman,
      required this.widedaman,
      required this.suitnotes,
      required this.dt,
      this.customerImg});

  @override
  State<InvoiceScreenForSuit> createState() => _InvoiceScreenForSuitState();
}

class _InvoiceScreenForSuitState extends State<InvoiceScreenForSuit> {
  @override
  Widget build(BuildContext context) {
    double totalAmount = widget.suitquantity * widget.suitamount;
    late String tailorName;
    late String phone;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          centerTitle: true,
          title: Text(
            'Invocescreen for ${widget.selectmeasurrement}',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Colors.black,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: ListView(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFF1F1F1)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<DocumentSnapshot>(
                      future:
                          context.read<CustomerDetailPorvider>().getOneUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child:
                                  CircularProgressIndicator()); // Loading indicator
                        }
                        if (!snapshot.hasData || snapshot.data == null) {
                          return Text(
                              'No user data available'); // Error message
                        }
                        final userData =
                            snapshot.data!.data() as Map<String, dynamic>?;

                        // Safely access user data
                        tailorName =
                            userData?['shopeName']?.toString() ?? 'Unknown';
                         phone =
                            userData?['phone']?.toString() ?? 'Unknown';

                        return Column(
                          children: [
                            Center(
                              child: Text(
                                'Tailor: $tailorName',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                'Phone: $phone',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bill No #:${widget.billid}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'OrderDate:-${widget.orderdate}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.name}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'DeliverDate:-${widget.deleverdate}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xFF7A7B80)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'item',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Quantity',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Amount',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(thickness: 2, color: Colors.black),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.selectmeasurrement}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.suitquantity}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.suitamount}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 2, color: Colors.black),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Pament Status:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${widget.pamentstatus}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Order Status:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${widget.orderstatus}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total Amount:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //this is listview
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child:
                      CustomInvoceButton('print Invoce', () {



                        printInvoiceforSuit(widget,tailorName,phone);
                      }),



                ),

                SizedBox(width: 10,),
                Expanded(child: CustomInvoceButton('print Measurement', () async {

                  final pdfData = await generateDocumentForSuit(PdfPageFormat.a4,widget);

                  // Print the generated PDF
                  await Printing.layoutPdf(
                    onLayout: (PdfPageFormat format) async => pdfData,
                  );






                })),
              ],
            )
          ],
        ),
      ),
    );
  }
}
