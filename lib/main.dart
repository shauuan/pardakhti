import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/database/app_database.dart';
import 'core/database/database_provider.dart';
import 'core/window/app_window_listener.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  final db = AppDatabase();
  await restoreWindowBounds(db);

  const windowOptions = WindowOptions(
    size: Size(AppConfig.defaultWindowWidth, AppConfig.defaultWindowHeight),
    minimumSize: Size(AppConfig.minWindowWidth, AppConfig.minWindowHeight),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    title: AppConfig.appName,
  );

  await windowManager.setPreventClose(true);
  windowManager.addListener(AppWindowListener(db));

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(db),
      ],
      child: const PardakhtiApp(),
    ),
  );
}
