import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

abstract final class BackupHelper {
  static Future<void> createBackup() async {
    final support = await getApplicationSupportDirectory();
    final dbFile = File(p.join(support.path, 'pardakhti.sqlite'));
    final docs = await getApplicationDocumentsDirectory();
    final backupDir = Directory(p.join(docs.path, 'PardakhtiBackups'));
    await backupDir.create(recursive: true);
    final stamp = DateTime.now().toIso8601String().replaceAll(':', '-');
    final dest = p.join(backupDir.path, 'pardakhti-$stamp.sqlite');
    if (await dbFile.exists()) {
      await dbFile.copy(dest);
    }
    final files = backupDir.listSync().whereType<File>().toList()
      ..sort((a, b) => b.path.compareTo(a.path));
    for (var i = 10; i < files.length; i++) {
      await files[i].delete();
    }
  }
}
