import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'file_handle_api.dart';
import 'pdf_invoice_api.dart';

class InvoiceMain extends StatefulWidget {
  const InvoiceMain({Key? key}) : super(key: key);

  @override
  State<InvoiceMain> createState() => _InvoiceMainState();
}

class _InvoiceMainState extends State<InvoiceMain> {
  PdfColor themeColor = PdfColors.black;
  pw.Font font = pw.Font.courier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DropdownButtonFormField<PdfColor>(
              decoration: const InputDecoration(
                labelText: 'Select Theme Color',
              ),
              value: themeColor,
              items: const [
                DropdownMenuItem(
                  value: PdfColors.black,
                  child: Text('Black'),
                ),
                DropdownMenuItem(
                  value: PdfColors.grey900,
                  child: Text('Dark Grey'),
                ),
                DropdownMenuItem(
                  value: PdfColors.green,
                  child: Text('Green'),
                ),
                DropdownMenuItem(
                  value: PdfColors.blue,
                  child: Text('Blue'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    themeColor = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16.0),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Select Font',
              ),
              items: const [
                DropdownMenuItem(
                  value: 'courier',
                  child: Text('Courier'),
                ),
                DropdownMenuItem(
                  value: 'helvetica',
                  child: Text('Helvetica'),
                ),
                DropdownMenuItem(
                  value: 'times',
                  child: Text('Times'),
                ),
                DropdownMenuItem(
                  value: 'zapfDingbats',
                  child: Text('ZapfDingbats'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  font = pw.Font.times();
                  // switch (value) {
                  //   case 'courier':
                  //     font = pw.Font.courier();
                  //     break;
                  //   case 'helvetica':
                  //     font = pw.Font.helvetica();
                  //     break;
                  //   case 'times':
                  //     font = pw.Font.times();
                  //     break;
                  //   case 'zapfDingbats':
                  //     font = pw.Font.zapfDingbats();
                  //     break;
                  // }
                });
              },
            ),
            const SizedBox(height: 24.0),

            ElevatedButton(
              onPressed: () async {
               try{
                final pdfFile = await PdfInvoiceApi.generate(themeColor, font);
                // await FileHandleApi.openFile(pdfFile);
                print(pdfFile);
               }catch(e){
print(e.toString());
               }
                },
              child: const Text('Generate Invoice'),
            ),
          ],
        ),
      ),
    );
  }
}
