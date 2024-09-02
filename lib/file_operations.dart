// file_operations.dart
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<List<String>> getFilesList(String folderPath) async {
  // Get the directory using the provided folder path
  Directory directory = Directory(folderPath);

  // Check if the directory exists
  if (!(await directory.exists())) {
    throw FileSystemException("Directory not found");
  }

  // Get a list of all files in the directory
  List<FileSystemEntity> fileList = directory.listSync();

  // Extract file paths from the list
  List<String> filePaths = [];
  for (var file in fileList) {
    if (file is File) {
      filePaths.add(file.path);
    }
  }
for(int i = 0 ;i<filePaths.length;i++){
  print(filePaths[i]);
}
  return filePaths;
}
