import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../../features/backup/backup_helper.dart';
import '../database/app_database.dart';

/// ذخیره اندازه/موقعیت پنجره + بکاپ خودکار هنگام بستن.
class AppWindowListener extends WindowListener {
  AppWindowListener(this._db);

  final AppDatabase _db;

  @override
  Future<void> onWindowClose() async {
    try {
      final size = await windowManager.getSize();
      final pos = await windowManager.getPosition();
      await _db.into(_db.appPrefs).insertOnConflictUpdate(
            AppPrefsCompanion.insert(
              key: 'window',
              value: jsonEncode({
                'w': size.width,
                'h': size.height,
                'x': pos.dx,
                'y': pos.dy,
              }),
            ),
          );
      await BackupHelper.createBackup();
    } catch (_) {
      // بستن را متوقف نکن
    }
    await windowManager.destroy();
  }
}

Future<void> restoreWindowBounds(AppDatabase db) async {
  final row = await (db.select(db.appPrefs)
        ..where((t) => t.key.equals('window')))
      .getSingleOrNull();
  if (row == null) return;
  try {
    final map = jsonDecode(row.value) as Map<String, dynamic>;
    final w = (map['w'] as num).toDouble();
    final h = (map['h'] as num).toDouble();
    final x = (map['x'] as num?)?.toDouble();
    final y = (map['y'] as num?)?.toDouble();
    await windowManager.setSize(Size(w, h));
    if (x != null && y != null) {
      await windowManager.setPosition(Offset(x, y));
    }
  } catch (_) {}
}
