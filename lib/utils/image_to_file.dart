import 'package:flutter/services.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<File> getAssetFile() async {
  final data = await rootBundle.load('assets/file.png');

  final dir = await getTemporaryDirectory();

  final file = File('${dir.path}/file.png');

  await file.writeAsBytes(data.buffer.asUint8List());

  return file;
}