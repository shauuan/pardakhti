import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/utils/iran_validators.dart';

class EmployeeRepository {
  EmployeeRepository(this._db);

  final AppDatabase _db;

  Stream<List<Employee>> watchAll({String? query, bool activeOnly = true}) {
    final q = _db.select(_db.employees);
    if (activeOnly) {
      q.where((t) => t.active.equals(true));
    }
    q.orderBy([(t) => OrderingTerm.asc(t.personnelCode)]);
    return q.watch().map((rows) {
      if (query == null || query.trim().isEmpty) return rows;
      final s = query.trim();
      return rows
          .where(
            (e) =>
                e.personnelCode.contains(s) ||
                e.nationalId.contains(s) ||
                e.firstName.contains(s) ||
                e.lastName.contains(s) ||
                (e.department?.contains(s) ?? false),
          )
          .toList();
    });
  }

  Future<List<Employee>> getActive() {
    return (_db.select(_db.employees)..where((t) => t.active.equals(true)))
        .get();
  }

  Future<Employee?> getById(int id) {
    return (_db.select(_db.employees)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  String? validate(EmployeesCompanion data, {int? excludeId}) {
    final code = data.personnelCode.present ? data.personnelCode.value : null;
    final nid = data.nationalId.present ? data.nationalId.value : null;
    if (code == null || code.isEmpty) return 'کد پرسنلی الزامی است';
    if (nid == null || !IranValidators.nationalId(nid)) {
      return 'کد ملی نامعتبر است';
    }
    if (data.sheba.present &&
        data.sheba.value != null &&
        data.sheba.value!.isNotEmpty &&
        !IranValidators.sheba(data.sheba.value!)) {
      return 'شماره شبا نامعتبر است';
    }
    return null;
  }

  Future<int> upsert(EmployeesCompanion data, {int? id}) async {
    final err = validate(data, excludeId: id);
    if (err != null) throw ArgumentError(err);
    if (id == null) {
      return _db.into(_db.employees).insert(data);
    }
    await (_db.update(_db.employees)..where((t) => t.id.equals(id)))
        .write(data);
    return id;
  }

  Future<void> softDelete(int id) async {
    await (_db.update(_db.employees)..where((t) => t.id.equals(id))).write(
      const EmployeesCompanion(active: Value(false)),
    );
  }

  Future<void> log(String action, String summary, {String? entityId}) {
    return _db.into(_db.auditLogs).insert(
          AuditLogsCompanion.insert(
            action: action,
            entityType: 'employee',
            entityId: Value(entityId),
            summary: summary,
          ),
        );
  }
}
