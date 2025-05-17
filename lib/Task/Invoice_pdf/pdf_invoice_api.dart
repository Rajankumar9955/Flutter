import 'dart:io';
import 'package:flutter/services.dart';
import 'file_handle_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfInvoiceApi {
  static Future<File?> generate(PdfColor color, pw.Font a4) async {
    final pdf = pw.Document();
    final byteData = await rootBundle.load('assets/invoice.webp');
print('Image length: ${byteData.lengthInBytes}');
    final iconImage =
       byteData.buffer.asUint8List();
    print('icon Imgae: ${iconImage}');
    final tableHeaders = [
      'Description',
      'Quantity',
      'Unit Price',
      'VAT',
      'Total',
    ];

    final tableData = [
      ['Coffee', '7', '\$5', '1%', '\$35'],
      ['Blue Berries', '5', '\$10', '2%', '\$50'],
      ['Water', '1', '\$3', '1.5%', '\$3'],
      ['Apple', '6', '\$8', '2%', '\$48'],
      ['Lunch', '3', '\$90', '12%', '\$270'],
      ['Drinks', '2', '\$15', '0.5%', '\$30'],
      ['Lemon', '4', '\$7', '0.5%', '\$28'],
    ];

    pdf.addPage(
      pw.MultiPage(
        build:
            (context) => [
              pw.Row(
                children: [
                  pw.Image(pw.MemoryImage(iconImage), height: 72, width: 72),
                  pw.SizedBox(width: 10),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'INVOICE',
                        style: pw.TextStyle(
                          fontSize: 17,
                          fontWeight: pw.FontWeight.bold,
                          color: color,
                        ),
                      ),
                      pw.Text(
                        'Flutter Approach',
                        style: pw.TextStyle(fontSize: 15, color: color),
                      ),
                    ],
                  ),
                  pw.Spacer(),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Rajan Kumar',
                        style: pw.TextStyle(
                          fontSize: 15.5,
                          fontWeight: pw.FontWeight.bold,
                          color: color,
                        ),
                      ),
                      pw.Text(
                        'Rajan Kumar',
                        style: pw.TextStyle(fontSize: 14, color: color),
                      ),
                      pw.Text(
                        DateTime.now().toString(),
                        style: pw.TextStyle(fontSize: 14, color: color),
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.SizedBox(height: 10),
              pw.Text(
                'Dear Rajan,\nLorem ipsum dolor sit amet consectetur adipisicing elit...',
                textAlign: pw.TextAlign.justify,
                style: pw.TextStyle(fontSize: 14, color: color),
              ),
              pw.SizedBox(height: 20),

              // Table
              pw.TableHelper.fromTextArray(
                headers: tableHeaders,
                data: tableData,
                border: null,
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                headerDecoration: const pw.BoxDecoration(
                  color: PdfColors.grey300,
                ),
                cellHeight: 30.0,
                cellAlignments: {
                  0: pw.Alignment.centerLeft,
                  1: pw.Alignment.centerRight,
                  2: pw.Alignment.centerRight,
                  3: pw.Alignment.centerRight,
                  4: pw.Alignment.centerRight,
                },
              ),
              pw.Divider(),
              pw.Container(
                alignment: pw.Alignment.centerRight,
                child: pw.Row(
                  children: [
                    pw.Spacer(flex: 6),
                    pw.Expanded(
                      flex: 4,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  'Net total',
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    color: color,
                                  ),
                                ),
                              ),
                              pw.Text(
                                '\$464',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  color: color,
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  'VAT 19.5%',
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    color: color,
                                  ),
                                ),
                              ),
                              pw.Text(
                                '\$90.48',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  color: color,
                                ),
                              ),
                            ],
                          ),
                          pw.Divider(),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.Text(
                                  'Total amount due',
                                  style: pw.TextStyle(
                                    fontSize: 14,
                                    fontWeight: pw.FontWeight.bold,
                                    color: color,
                                  ),
                                ),
                              ),
                              pw.Text(
                                '\$554.48',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  color: color,
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 10),
                          pw.Container(height: 1, color: PdfColors.grey400),
                          pw.SizedBox(height: 2),
                          pw.Container(height: 1, color: PdfColors.grey400),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
        footer:
            (context) => pw.Column(
              children: [
                pw.Divider(),
                pw.SizedBox(height: 10),
                pw.Text(
                  'Flutter Approach',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    color: color,
                  ),
                ),
                pw.SizedBox(height: 5),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      'Address: ',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        color: color,
                      ),
                    ),
                    pw.Text(
                      'mp nagar zone 1',
                      style: pw.TextStyle(color: color),
                    ),
                  ],
                ),
                pw.SizedBox(height: 5),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      'Email: ',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        color: color,
                      ),
                    ),
                    pw.Text(
                      'flutterapproach@gmail.com',
                      style: pw.TextStyle(
                        color: color,
                        font: pw.Font.courier(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      ),
    );
     print("djfjald ${FileHandleApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf)
}");
    return FileHandleApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }
}
