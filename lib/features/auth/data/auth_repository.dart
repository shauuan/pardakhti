import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../domain/password_hasher.dart';

class AuthRepository {
  AuthRepository(this._db);

  final AppDatabase _db;

  Future<AppAuthData?> current() {
    return (_db.select(_db.appAuth)..where((t) => t.id.equals(1)))
        .getSingleOrNull();
  }

  Future<bool> isOnboarded() async {
    final row = await current();
    return row?.onboarded ?? false;
  }

  /// برمی‌گرداند کلید بازیابی خام (فقط یک‌بار هنگام راه‌اندازی).
  Future<String> setup({
    required String password,
    required String companyName,
  }) async {
    final salt = PasswordHasher.randomSalt();
    final hash = PasswordHasher.hash(password, salt);
    final recovery = PasswordHasher.recoveryKey();
    final recoveryHash = PasswordHasher.hash(recovery, salt);

    await _db.into(_db.appAuth).insertOnConflictUpdate(
          AppAuthCompanion.insert(
            id: const Value(1),
            passwordHash: hash,
            salt: salt,
            recoveryKeyHash: recoveryHash,
            onboarded: const Value(true),
          ),
        );

    await (_db.update(_db.companyProfile)..where((t) => t.id.equals(1))).write(
      CompanyProfileCompanion(name: Value(companyName)),
    );

    await _db.into(_db.auditLogs).insert(
          AuditLogsCompanion.insert(
            action: 'onboard',
            entityType: 'auth',
            summary: 'راه‌اندازی اولیه و تنظیم رمز',
          ),
        );

    return recovery;
  }

  Future<bool> login(String password) async {
    final row = await current();
    if (row == null) return false;
    return PasswordHasher.verify(password, row.salt, row.passwordHash);
  }

  Future<bool> resetWithRecovery(String recoveryKey, String newPassword) async {
    final row = await current();
    if (row == null) return false;
    final ok =
        PasswordHasher.verify(recoveryKey.trim(), row.salt, row.recoveryKeyHash);
    if (!ok) return false;
    final hash = PasswordHasher.hash(newPassword, row.salt);
    await (_db.update(_db.appAuth)..where((t) => t.id.equals(1))).write(
      AppAuthCompanion(passwordHash: Value(hash)),
    );
    await _db.into(_db.auditLogs).insert(
          AuditLogsCompanion.insert(
            action: 'password_reset',
            entityType: 'auth',
            summary: 'بازنشانی رمز با کلید بازیابی',
          ),
        );
    return true;
  }

  Future<void> changePassword({
    required String currentPassword,
    required String nextPassword,
  }) async {
    final row = await current();
    if (row == null) throw StateError('حسابی وجود ندارد');
    if (!PasswordHasher.verify(currentPassword, row.salt, row.passwordHash)) {
      throw ArgumentError('رمز فعلی نادرست است');
    }
    final hash = PasswordHasher.hash(nextPassword, row.salt);
    await (_db.update(_db.appAuth)..where((t) => t.id.equals(1))).write(
      AppAuthCompanion(passwordHash: Value(hash)),
    );
  }
}
