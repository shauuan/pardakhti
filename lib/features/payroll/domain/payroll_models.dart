import 'fiscal_settings.dart';

enum PayItemKind { earning, deduction }

enum PayItemCalcMethod {
  fixedMonthly,
  dailyTimesAttendance,
  factorOfBase,
  manual,
}

/// تعریف قلم برای موتور (immutable).
class EnginePayItem {
  const EnginePayItem({
    required this.code,
    required this.name,
    required this.kind,
    required this.calcMethod,
    required this.subjectToInsurance,
    required this.subjectToTax,
    this.amount = 0,
    this.factorBps = 0,
    this.exemptionCap,
  });

  final String code;
  final String name;
  final PayItemKind kind;
  final PayItemCalcMethod calcMethod;
  final bool subjectToInsurance;
  final bool subjectToTax;
  final int amount;
  final int factorBps;
  final int? exemptionCap;
}

/// ورودی ماهانه یک پرسنل.
class PayrollEngineInput {
  const PayrollEngineInput({
    required this.settings,
    required this.year,
    required this.month,
    required this.dailyWage,
    required this.workedDays,
    required this.seniorityBases,
    required this.childrenCount,
    required this.childAllowanceEligible,
    required this.married,
    required this.isHardJob,
    required this.jobAllowanceMonthly,
    required this.overtimeHours,
    required this.nightHours,
    required this.holidayHours,
    required this.manualEarnings,
    required this.manualDeductions,
    this.bonusAmount = 0,
    this.advanceAmount = 0,
    this.loanAmount = 0,
    this.penaltyAmount = 0,
  });

  final FiscalSettings settings;
  final int year;
  final int month;
  final int dailyWage;
  final int workedDays;
  final int seniorityBases;
  final int childrenCount;
  final bool childAllowanceEligible;
  final bool married;
  final bool isHardJob;
  final int jobAllowanceMonthly;
  final double overtimeHours;
  final double nightHours;
  final double holidayHours;
  final List<EnginePayItem> manualEarnings;
  final List<EnginePayItem> manualDeductions;
  final int bonusAmount;
  final int advanceAmount;
  final int loanAmount;
  final int penaltyAmount;
}

class BreakdownLine {
  const BreakdownLine({
    required this.code,
    required this.label,
    required this.amount,
    required this.detail,
    this.subjectToInsurance = false,
    this.subjectToTax = false,
  });

  final String code;
  final String label;
  final int amount;
  final String detail;
  final bool subjectToInsurance;
  final bool subjectToTax;

  Map<String, dynamic> toJson() => {
        'code': code,
        'label': label,
        'amount': amount,
        'detail': detail,
        'subjectToInsurance': subjectToInsurance,
        'subjectToTax': subjectToTax,
      };
}

class PayrollEngineResult {
  const PayrollEngineResult({
    required this.gross,
    required this.insuranceBase,
    required this.employeeInsurance,
    required this.employerInsurance,
    required this.unemploymentInsurance,
    required this.taxBase,
    required this.tax,
    required this.otherDeductions,
    required this.net,
    required this.employerTotalCost,
    required this.lines,
    required this.warnings,
    required this.netNegative,
  });

  final int gross;
  final int insuranceBase;
  final int employeeInsurance;
  final int employerInsurance;
  final int unemploymentInsurance;
  final int taxBase;
  final int tax;
  final int otherDeductions;
  final int net;
  final int employerTotalCost;
  final List<BreakdownLine> lines;
  final List<String> warnings;
  final bool netNegative;

  int get employerInsuranceTotal =>
      employerInsurance + unemploymentInsurance;

  Map<String, dynamic> toJson() => {
        'gross': gross,
        'insuranceBase': insuranceBase,
        'employeeInsurance': employeeInsurance,
        'employerInsurance': employerInsurance,
        'unemploymentInsurance': unemploymentInsurance,
        'taxBase': taxBase,
        'tax': tax,
        'otherDeductions': otherDeductions,
        'net': net,
        'employerTotalCost': employerTotalCost,
        'netNegative': netNegative,
        'warnings': warnings,
        'lines': [for (final l in lines) l.toJson()],
      };
}
