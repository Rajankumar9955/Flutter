import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'file_handle_api.dart';
import 'pdf_invoice_api.dart';

class GenerateInvoiceWidget extends StatelessWidget {
  const GenerateInvoiceWidget({super.key});

  Future<pw.Font> loadFont() async {
    final fontData = await rootBundle.load('assets/font/Montserrat-Regular.ttf');
    return pw.Font.ttf(fontData.buffer as ByteData);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.picture_as_pdf,
            size: 72,
            color: Colors.white,
          ),
          const SizedBox(height: 15),
          const Text(
            'Generate Invoice',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
              child: Text(
                'Invoice PDF',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            onPressed: () async {
              final font = await loadFont();
              final pdfFile = await PdfInvoiceApi.generate(PdfColors.black, font);
              await FileHandleApi.openFile(pdfFile);
                        },
          ),
        ],
      ),
    );
  }
}
