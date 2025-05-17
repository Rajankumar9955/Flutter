import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class FileHandleApi {
  static Future<File?> saveDocument({
  required String name,
  required pw.Document pdf,
}) async {
  try {
    final bytes = await pdf.save();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  } catch (e) {
    print('Error saving document: $e');
    return null;
  }
}

static Future<void> openFile(File? file) async {
  if (file == null) return;
  try {
    await OpenFile.open(file.path);
  } catch (e) {
    print('Error opening file: $e');
  }
}

}
