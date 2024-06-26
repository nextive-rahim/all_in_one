import 'dart:io';

import 'package:file_picker/file_picker.dart';


class FileService {
  static final FileService _fileService = FileService._internal();

  factory FileService() {
    return _fileService;
  }

  FileService._internal();

  Future<FileModel?> pickAFile({
    bool pdfOnly = false,
    bool image = true,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: pdfOnly
          ? ['pdf']
          : image
              ? ['jpg', 'png']
              : ['jpg', 'pdf', 'doc'],
    );

    if (result == null) {
      return null;
    } else {
      return FileModel(
        file: File(result.files.single.path!),
        name: result.files.single.path!.split('/').last.toString(),
      );
    }
  }
}

/// TODO: Add List<File> capability
class FileModel {
  FileModel({
    required this.file,
    required this.name,
  });

  File file;
  String name;

  String get path => file.path;
}
