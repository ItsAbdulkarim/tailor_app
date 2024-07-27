//this is for suit screen

import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:untitled4/services/printerand_pdf_for_shirt.dart';
import 'package:untitled4/services/printerand_pdf_for_shirt.dart';
import 'package:untitled4/services/printerand_pdf_for_shirt.dart';
import 'package:untitled4/view/UI_screen/invoicescreenforsuit.dart';

import 'package:untitled4/view/invocescreenforshirt.dart';

Future<pw.Document> generateShirtInvoicePdf(
    InvoiceScreenForSuit invoice, String tailorName, String phone) async {
  final pdf = pw.Document();
  pdf.addPage(pw.Page(build: (context) {
    return pw.ListView(children: [
      pw.Container(
          height: 500,
          decoration: pw.BoxDecoration(
            color: PdfColor.fromInt(0xFFF1F1F1), // Set container color
            borderRadius: pw.BorderRadius.circular(20),
          ),
          alignment: pw.Alignment.center,
          padding: pw.EdgeInsets.all(10),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                  child: pw.Text(' Tailor: $tailorName',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 25))),
              pw.SizedBox(height: 10),
              pw.Center(
                  child: pw.Text(' T-Phone: $phone',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 20))),

              pw.SizedBox(height: 10),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('S:NO:- ${invoice.billid}'),
                  pw.Text('OrderDate: ${invoice.orderdate}'),
                ],
              ),
              pw.SizedBox(height: 10),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Customer Name: ${invoice.name}'),
                  pw.Text('DeliverDate: ${invoice.deleverdate}'),
                ],
              ),
              pw.SizedBox(height: 10),

              pw.Container(
                height: 50,
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  color: PdfColor.fromInt(0xFF7A7B80),
                ),
                child: pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'item',
                        style: pw.TextStyle(
                            fontSize: 18, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        'Quantity',
                        style: pw.TextStyle(
                            fontSize: 18, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        'Amount',
                        style: pw.TextStyle(
                            fontSize: 18, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              pw.Divider(thickness: 2, color: PdfColors.black),

              pw.Container(
                height: 50,
                width: double.infinity,
                decoration: pw.BoxDecoration(),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      '${invoice.selectmeasurrement}',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      '${invoice.suitquantity}',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      '${invoice.suitamount}',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),

              pw.Divider(thickness: 2, color: PdfColors.black),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    'Pament Status:',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    '${invoice.pamentstatus}',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    'Order Status:',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    '${invoice.orderstatus}',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ////
              pw.SizedBox(
                height: 10,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    'Total Amount:',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    '${(invoice.suitquantity * invoice.suitamount).toStringAsFixed(2)}',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ))
    ]);
  }));

  return pdf;
}

void printInvoiceforSuit(
    InvoiceScreenForSuit invoice, String tailorname, tailorphone) async {
  final pdf = await generateShirtInvoicePdf(invoice, tailorname, tailorphone);

  Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}

////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
////////////////////////////////////////
//for to print customer suit measurement

Future<Uint8List> generateDocumentForSuit(
    PdfPageFormat format, InvoiceScreenForSuit invoice) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);

  final font1 = pw.Font.helvetica();

  final font2 = pw.Font.helveticaBold();
  pw.ImageProvider? imageProvider;
  if (invoice.customerImg != null && invoice.customerImg!.isNotEmpty) {
    try {
      imageProvider = await networkImage(invoice.customerImg!);
    } catch (e) {
      print('Error loading image: $e');
      imageProvider = null;
    }
  }

  doc.addPage(pw.MultiPage(
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: pw.PageOrientation.portrait,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) {
        if (context.pageNumber == 1) {
          return pw.SizedBox();
        }
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const pw.BoxDecoration(
                border: pw.Border(
                    bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey))),
            child: pw.Text('Portable Document Format',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (pw.Context context) {
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text(
                'Page ${context.pageNumber} of ${context.pagesCount}',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (pw.Context context) => <pw.Widget>[
            pw.Header(
                level: 0,
                title: 'Portable Document Format',
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text('Customer Measurement', textScaleFactor: 2),
                      pw.PdfLogo()
                    ])),

/////////////////////

/////////////////
            pw.SizedBox(height: 20),
            if (imageProvider != null) pw.Image(imageProvider),
            if (imageProvider != null) pw.SizedBox(height: 20),

            pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                  border: pw.Border.all(color: PdfColors.black, width: 2),
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                      child: pw.Text(
                        'Personal Infromation',
                        style: pw.TextStyle(
                          letterSpacing: 2,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text(
                          'Name',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                        pw.Text(
                          '${invoice.name}',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text(
                          'Phone',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                        pw.Text(
                          '${invoice.phone}',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text(
                          'Address',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                        pw.Text(
                          '${invoice.addresss}',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ),

//////orderstatus

            pw.SizedBox(
              height: 10,
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                  border: pw.Border.all(color: PdfColors.black, width: 2),
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                      child: pw.Text(
                        'Order Date',
                        style: pw.TextStyle(
                          letterSpacing: 2,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text(
                          'OrderDate',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                        pw.Text(
                          '${invoice.orderdate}',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text(
                          'DeliveryDate',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                        pw.Text(
                          '${invoice.deleverdate}',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

//pament status
            pw.SizedBox(
              height: 10,
            ),

            pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                  border: pw.Border.all(color: PdfColors.black, width: 2),
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                      child: pw.Text(
                        'Pament Status',
                        style: pw.TextStyle(
                          letterSpacing: 2,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text(
                          'Pament Status',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                        pw.Text(
                          '${invoice.pamentstatus}',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

//orderstatus
            pw.SizedBox(
              height: 10,
            ),
//orderstatu

            pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                  border: pw.Border.all(color: PdfColors.black, width: 2),
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                      child: pw.Text(
                        'Order Status',
                        style: pw.TextStyle(
                          letterSpacing: 2,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text(
                          'Order Status',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                        pw.Text(
                          '${invoice.orderstatus}',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

//worker name

            pw.SizedBox(
              height: 10,
            ),

            pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                  border: pw.Border.all(color: PdfColors.black, width: 2),
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                      child: pw.Text(
                        'WorkerName',
                        style: pw.TextStyle(
                          letterSpacing: 2,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text(
                          'Worker',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                        pw.Text(
                          '${invoice.worker}',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /////

            //measurement/////////////////
            pw.SizedBox(
              height: 10,
            ),

            pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                  border: pw.Border.all(color: PdfColors.black, width: 2),
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                      child: pw.Text(
                        'Measurement',
                        style: pw.TextStyle(
                          letterSpacing: 2,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text(
                          'Measurement',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                        pw.Text(
                          '${invoice.selectmeasurrement}',
                          style: pw.TextStyle(
                              letterSpacing: 1,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
//////////////////////////////////////////////
            ////////
            //////
            /////complete measurement

            pw.SizedBox(
              height: 10,
            ),

            //measurement container

            pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Container(
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  borderRadius: pw.BorderRadius.circular(10),
                  border: pw.Border.all(color: PdfColors.black, width: 2),
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                      child: pw.Text(
                        'Measurement',
                        style: pw.TextStyle(
                          letterSpacing: 2,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            '  Suit Quantity:  ',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitquantity}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            'Suit Amount:',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitamount}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Suit Length:',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitlength}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Sleeve Length:',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitslevelength}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            'Shoulder:',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitshoulder}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Kalar:',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitkalar}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Chest:',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitchest}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Armhole:', //correct it again in urdu
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitarmhole}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Daman:', //correct it again in urdu
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitdaman}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Shalwar:', //correct it again in urdu
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitshalwar}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Pancha:', //correct it again in urdu
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.suitpancha}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Front Pocket:', //correct it again in urdu
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.frontpocket}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Side Pocket:', //correct it again in urdu
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.sidepocket}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Goal Daman:', //correct it again in urdu
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.goaldaman}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            ' Wide Daman:', //correct it again in urdu
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.widedaman}',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    pw.Text('------------------------------------',
                        style: pw.TextStyle(
                          fontSize: 38,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Container(
                        width: double.infinity,
                        decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(10),
                          border:
                              pw.Border.all(color: PdfColors.black, width: 2),
                        ),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Center(
                              child: pw.Text(
                                'Notes',
                                style: pw.TextStyle(
                                  letterSpacing: 2,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            pw.Text('------------------------------------',
                                style: pw.TextStyle(
                                  fontSize: 38,
                                  fontWeight: pw.FontWeight.bold,
                                )),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceAround,
                              children: [
                                pw.Text(
                                  'Notes: ',
                                  style: pw.TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 18),
                                ),
                                pw.Expanded(
                                  child: pw.Text(
                                    '${invoice.suitnotes}',
                                    style: pw.TextStyle(
                                        letterSpacing: 1, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Container(
                        width: double.infinity,
                        decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(10),
                          border:
                              pw.Border.all(color: PdfColors.black, width: 2),
                        ),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Center(
                              child: pw.Text(
                                'Date And Time',
                                style: pw.TextStyle(
                                  letterSpacing: 2,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            pw.Text('------------------------------------',
                                style: pw.TextStyle(
                                  fontSize: 38,
                                  fontWeight: pw.FontWeight.bold,
                                )),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceAround,
                              children: [
                                pw.Text(
                                  'Date & Time',
                                  style: pw.TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 18),
                                ),
                                pw.Text(
                                  '${DateFormat('d MMMM y H:mm').format(DateTime.fromMillisecondsSinceEpoch(int.parse(invoice.dt)))}',
                                  style: pw.TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.Paragraph(
                text:
                    'Text is available under the Creative Commons Attribution Share Alike License.')
          ]));

  return await doc.save();
}
