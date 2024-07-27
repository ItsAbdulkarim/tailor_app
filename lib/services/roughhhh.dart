import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:untitled4/view/invocescreenforshirt.dart';

Future<Uint8List> generateDocument(
    PdfPageFormat format, InvoiceScreenForShirt invoice) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);

  final font1 = pw.Font.helvetica();

  final font2 = pw.Font.helveticaBold();

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

            pw.Text('Invoice', style: pw.TextStyle(fontSize: 24)),
            pw.SizedBox(height: 20),

/////////////////

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
                          '${invoice.customername}',
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
                          '${invoice.customerphone}',
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
                          '${invoice.address}',
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
                          '${invoice.deliverydate}',
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
                          '${invoice.pamentatus}',
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
                          '${invoice.Orderstatus}',
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
                          '${invoice.itemname}',
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
                            '  Shirt Quantity:  ',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.itemquantity}',
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
                            'Shirt Amount:',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.amount}',
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
                            ' Shirt Length:',
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.shirtlength}',
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
                            '${invoice.shirtsleeeve}',
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
                            '${invoice.shirtshoulder}',
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
                            '${invoice.shirtcollar}',
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
                            '${invoice.shirtchest}',
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
                            ' waist:', //correct it again in urdu
                            style: pw.TextStyle(
                                letterSpacing: 1,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 18),
                          ),
                          pw.Text(
                            '${invoice.shirtwaist}',
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
                                    '${invoice.addshirtnotes}',
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
