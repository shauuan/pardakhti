import 'package:drift/drift.dart';

class CompanyProfile extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get name => text().withDefault(const Constant(''))();
  TextColumn get nationalId => text().nullable()();
  TextColumn get economicCode => text().nullable()();
  TextColumn get insuranceWorkshopCode => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get logoPath => text().nullable()();
  TextColumn get displayCurrency =>
      text().withDefault(const Constant('rial'))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AppAuth extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get passwordHash => text()();
  TextColumn get salt => text()();
  TextColumn get recoveryKeyHash => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get onboarded => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class FiscalYearSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get year => integer().unique()();
  TextColumn get settingsJson => text()();
}

class Employees extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get personnelCode => text().unique()();
  TextColumn get nationalId => text().unique()();
  TextColumn get insuranceNumber => text().nullable().unique()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get fatherName => text().nullable()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  TextColumn get gender => text().withDefault(const Constant('male'))();
  BoolColumn get married => boolean().withDefault(const Constant(false))();
  IntColumn get childrenCount => integer().withDefault(const Constant(0))();
  BoolColumn get childAllowanceEligible =>
      boolean().withDefault(const Constant(true))();
  DateTimeColumn get hireDate => dateTime()();
  TextColumn get contractType => text().withDefault(const Constant('permanent'))();
  TextColumn get department => text().nullable()();
  TextColumn get jobTitle => text().nullable()();
  TextColumn get bankName => text().nullable()();
  TextColumn get sheba => text().nullable()();
  TextColumn get accountNumber => text().nullable()();
  IntColumn get dailyWage => integer()();
  IntColumn get seniorityBases => integer().nullable()();
  IntColumn get jobAllowanceMonthly =>
      integer().withDefault(const Constant(0))();
  BoolColumn get isHardJob => boolean().withDefault(const Constant(false))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  TextColumn get notes => text().nullable()();
}

class PayItemDefinitions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().unique()();
  TextColumn get name => text()();
  TextColumn get kind => text()(); // earning | deduction
  TextColumn get calcMethod => text()();
  BoolColumn get subjectToInsurance => boolean()();
  BoolColumn get subjectToTax => boolean()();
  IntColumn get exemptionCap => integer().nullable()();
  BoolColumn get needsReview => boolean().withDefault(const Constant(false))();
  BoolColumn get isSystem => boolean().withDefault(const Constant(true))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}

class MonthlyPeriods extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get year => integer()();
  IntColumn get month => integer()();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  DateTimeColumn get lockedAt => dateTime().nullable()();
  TextColumn get settingsSnapshotJson => text().nullable()();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
        {year, month},
      ];
}

class MonthlyInputs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get periodId => integer().references(MonthlyPeriods, #id)();
  IntColumn get employeeId => integer().references(Employees, #id)();
  IntColumn get workedDays => integer().withDefault(const Constant(30))();
  RealColumn get overtimeHours => real().withDefault(const Constant(0))();
  RealColumn get nightHours => real().withDefault(const Constant(0))();
  RealColumn get holidayHours => real().withDefault(const Constant(0))();
  IntColumn get absenceDays => integer().withDefault(const Constant(0))();
  IntColumn get unpaidLeaveDays => integer().withDefault(const Constant(0))();
  IntColumn get bonusAmount => integer().withDefault(const Constant(0))();
  IntColumn get advanceAmount => integer().withDefault(const Constant(0))();
  IntColumn get loanAmount => integer().withDefault(const Constant(0))();
  IntColumn get penaltyAmount => integer().withDefault(const Constant(0))();
  TextColumn get manualJson => text().withDefault(const Constant('[]'))();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
        {periodId, employeeId},
      ];
}

class PayrollResults extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get periodId => integer().references(MonthlyPeriods, #id)();
  IntColumn get employeeId => integer().references(Employees, #id)();
  IntColumn get gross => integer()();
  IntColumn get insuranceBase => integer()();
  IntColumn get employeeInsurance => integer()();
  IntColumn get employerInsurance => integer()();
  IntColumn get unemploymentInsurance => integer()();
  IntColumn get taxBase => integer()();
  IntColumn get tax => integer()();
  IntColumn get otherDeductions => integer()();
  IntColumn get net => integer()();
  IntColumn get employerTotalCost => integer()();
  TextColumn get breakdownJson => text()();
  BoolColumn get manualAdjusted =>
      boolean().withDefault(const Constant(false))();
  TextColumn get adjustmentReason => text().nullable()();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
        {periodId, employeeId},
      ];
}

class AuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get at => dateTime().withDefault(currentDateAndTime)();
  TextColumn get action => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text().nullable()();
  TextColumn get summary => text()();
  TextColumn get beforeJson => text().nullable()();
  TextColumn get afterJson => text().nullable()();
  TextColumn get reason => text().nullable()();
}

class AppPrefs extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}
