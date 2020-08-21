import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileManager{
  Future<File> getFile() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    final dir = Directory(docDirectory.path + "/dir");
    File file;

     await dir.create().then((value) {
        file = File('${value.path}/data.json');
      });

    return file;
  }
}