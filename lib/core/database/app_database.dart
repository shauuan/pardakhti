import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../features/payroll/domain/fiscal_settings.dart';
import 'app_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CompanyProfile,
    AppAuth,
    FiscalYearSettings,
    Employees,
    PayItemDefinitions,
    MonthlyPeriods,
    MonthlyInputs,
    PayrollResults,
    AuditLogs,
    AppPrefs,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedDefaults();
        },
      );

  Future<void> _seedDefaults() async {
    await into(companyProfile).insert(
      CompanyProfileCompanion.insert(
        id: const Value(1),
        name: const Value('شرکت نمونه'),
      ),
    );

    final settings = FiscalSettings.defaults1405();
    await into(fiscalYearSettings).insert(
      FiscalYearSettingsCompanion.insert(
        year: settings.year,
        settingsJson: jsonEncode(settings.toJson()),
      ),
    );

    final items = _defaultPayItems();
    for (final item in items) {
      await into(payItemDefinitions).insert(item);
    }
  }

  List<PayItemDefinitionsCompanion> _defaultPayItems() {
    PayItemDefinitionsCompanion item({
      required String code,
      required String name,
      required String kind,
      required String calcMethod,
      required bool insurance,
      required bool tax,
      bool needsReview = false,
      int sort = 0,
    }) {
      return PayItemDefinitionsCompanion.insert(
        code: code,
        name: name,
        kind: kind,
        calcMethod: calcMethod,
        subjectToInsurance: insurance,
        subjectToTax: tax,
        needsReview: Value(needsReview),
        sortOrder: Value(sort),
      );
    }

    return [
      item(
        code: 'base',
        name: 'حقوق پایه',
        kind: 'earning',
        calcMethod: 'daily_x_attendance',
        insurance: true,
        tax: true,
        sort: 1,
      ),
      item(
        code: 'seniority',
        name: 'پایه سنوات',
        kind: 'earning',
        calcMethod: 'daily_x_attendance',
        insurance: true,
        tax: true,
        sort: 2,
      ),
      item(
        code: 'job',
        name: 'فوق‌العاده شغل',
        kind: 'earning',
        calcMethod: 'fixed_monthly',
        insurance: true,
        tax: true,
        sort: 3,
      ),
      item(
        code: 'housing',
        name: 'حق مسکن',
        kind: 'earning',
        calcMethod: 'fixed_monthly',
        insurance: true,
        tax: true,
        sort: 4,
        needsReview: true,
      ),
      item(
        code: 'food',
        name: 'بن خواروبار',
        kind: 'earning',
        calcMethod: 'fixed_monthly',
        insurance: true,
        tax: true,
        sort: 5,
      ),
      item(
        code: 'marriage',
        name: 'حق تاهل',
        kind: 'earning',
        calcMethod: 'fixed_monthly',
        insurance: true,
        tax: true,
        sort: 6,
        needsReview: true,
      ),
      item(
        code: 'child',
        name: 'حق اولاد',
        kind: 'earning',
        calcMethod: 'fixed_monthly',
        insurance: false,
        tax: true,
        sort: 7,
        needsReview: true,
      ),
      item(
        code: 'overtime',
        name: 'اضافه‌کاری',
        kind: 'earning',
        calcMethod: 'manual',
        insurance: true,
        tax: true,
        sort: 8,
      ),
      item(
        code: 'night',
        name: 'شب‌کاری',
        kind: 'earning',
        calcMethod: 'manual',
        insurance: true,
        tax: true,
        sort: 9,
      ),
      item(
        code: 'holiday',
        name: 'تعطیل‌کاری',
        kind: 'earning',
        calcMethod: 'manual',
        insurance: true,
        tax: true,
        sort: 10,
        needsReview: true,
      ),
      item(
        code: 'bonus',
        name: 'پاداش',
        kind: 'earning',
        calcMethod: 'manual',
        insurance: false,
        tax: true,
        sort: 11,
      ),
      item(
        code: 'advance',
        name: 'مساعده',
        kind: 'deduction',
        calcMethod: 'manual',
        insurance: false,
        tax: false,
        sort: 12,
      ),
      item(
        code: 'loan',
        name: 'وام',
        kind: 'deduction',
        calcMethod: 'manual',
        insurance: false,
        tax: false,
        sort: 13,
      ),
      item(
        code: 'penalty',
        name: 'جریمه',
        kind: 'deduction',
        calcMethod: 'manual',
        insurance: false,
        tax: false,
        sort: 14,
      ),
    ];
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationSupportDirectory();
    final file = File(p.join(dir.path, 'pardakhti.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
