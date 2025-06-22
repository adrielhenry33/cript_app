import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
  static start() async{
    Directory directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
  }
}