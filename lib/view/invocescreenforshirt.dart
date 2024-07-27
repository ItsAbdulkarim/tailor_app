import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'package:provider/provider.dart';

import 'package:untitled4/custom/dotwidgetscreen.dart';
import 'package:untitled4/services/printerand_pdf_for_shirt.dart';

import '../provider/see_customer_provder.dart';


class InvoiceScreenForShirt extends StatefulWidget {

  final String dt;
  final String? customerImg;
  final String customername;
  final String customerphone;
  final String address;
  final String worker;
  final String shirtcollar;
  final String shirtchest;
  final String shirtwaist;
  final String shirtshoulder;
  final String shirtsleeeve;
  final String shirtlength;
  final String addshirtnotes;
  final String billid;
  final String orderdate;
  final String deliverydate;
  final int itemquantity;
  final String itemname;
  final double amount;
  final String pamentatus;
  final String Orderstatus;

  const InvoiceScreenForShirt(
      {super.key,
      required this.customername,
      required this.billid,
      required this.orderdate,
      required this.deliverydate,
      required this.itemquantity,
      required this.itemname,
      required this.amount,
      required this.pamentatus,
      required this.Orderstatus,
        required this.dt,
        this.customerImg,
        required this.customerphone,
        required this.address,
        required this.worker,
        required this.shirtcollar,
        required this.shirtchest,
        required this.shirtwaist,
        required this.shirtshoulder,
        required this.shirtsleeeve,
        required this.shirtlength,
        required this.addshirtnotes});

  @override
  State<InvoiceScreenForShirt> createState() => _InvoiceScreenForShirtState();
}

class _InvoiceScreenForShirtState extends State<InvoiceScreenForShirt> {
  @override
  Widget build(BuildContext context) {
    double totalAmount = widget.itemquantity * widget.amount;
late String tailorName;
late String phone;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          centerTitle: true,
          title: Text(
            'Invocescreen for ${widget.itemname}',
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
          shrinkWrap: true,
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
                    //for tailor name and phone
                    FutureBuilder<DocumentSnapshot>(
                      future: context.read<CustomerDetailPorvider>().getOneUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator()); // Loading indicator
                        }
                        if (!snapshot.hasData || snapshot.data == null) {
                          return Text('No user data available'); // Error message
                        }
                        final userData = snapshot.data!.data() as Map<String, dynamic>?;

                        // Safely access user data
                         tailorName = userData?['shopeName']?.toString() ?? 'Unknown';
                         phone = userData?['phone']?.toString() ?? 'Unknown';

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
                          '${widget.customername}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'DeliverDate:-${widget.deliverydate}',
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
                            '${widget.itemname}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.itemquantity}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.amount}',
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
                          '${widget.pamentatus}',
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
                          '${widget.Orderstatus}',
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
                  child: CustomInvoceButton('print Invoce'

                  ,() {


                    printInvoiceforshirt(widget,tailorName,phone);

                  },
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(child: CustomInvoceButton('print Measurement',() async {
                  final pdfData = await generateDocument(PdfPageFormat.a4,widget);

                  // Print the generated PDF
                  await Printing.layoutPdf(
                    onLayout: (PdfPageFormat format) async => pdfData,
                  );
                }),)
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
