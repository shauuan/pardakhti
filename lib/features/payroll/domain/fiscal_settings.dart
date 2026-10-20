import 'rounding.dart';
import 'tax_bracket.dart';

enum DayBasisMode { fixed30, actualMonthDays }

enum HourlyDivisorMode { sevenPoint33, monthly220 }

/// تنظیمات سال مالی — immutable؛ هنگام قفل ماه snapshot می‌شود.
class FiscalSettings {
  const FiscalSettings({
    required this.year,
    required this.minDailyWage,
    required this.minMonthlyWage,
    required this.housingAllowance,
    required this.foodAllowance,
    required this.marriageAllowance,
    required this.childAllowancePerChild,
    required this.seniorityDaily,
    required this.employeeInsurancePercent,
    required this.employerInsurancePercent,
    required this.unemploymentInsurancePercent,
    required this.hardJobExtraPercent,
    required this.insuranceCeilingFactor,
    required this.dayBasis,
    required this.hourlyDivisorMode,
    required this.overtimeFactorBps,
    required this.nightFactorBps,
    required this.holidayFactorBps,
    required this.roundingMode,
    required this.taxTableBasis,
    required this.taxBrackets,
    this.hourlyBaseIncludesBase = true,
    this.hourlyBaseIncludesSeniority = true,
    this.hourlyBaseIncludesJobAllowance = true,
  });

  final int year;
  final int minDailyWage;
  final int minMonthlyWage;
  final int housingAllowance;
  final int foodAllowance;
  final int marriageAllowance;
  final int childAllowancePerChild;
  final int seniorityDaily;
  final int employeeInsurancePercent;
  final int employerInsurancePercent;
  final int unemploymentInsurancePercent;
  final int hardJobExtraPercent;
  final int insuranceCeilingFactor;
  final DayBasisMode dayBasis;
  final HourlyDivisorMode hourlyDivisorMode;

  /// ضریب اضافه‌کاری به basis point (۱۴۰۰ = ۱.۴)
  final int overtimeFactorBps;
  final int nightFactorBps;
  final int holidayFactorBps;
  final RoundingMode roundingMode;
  final TaxTableBasis taxTableBasis;
  final List<TaxBracket> taxBrackets;

  final bool hourlyBaseIncludesBase;
  final bool hourlyBaseIncludesSeniority;
  final bool hourlyBaseIncludesJobAllowance;

  int get insuranceCeiling => minMonthlyWage * insuranceCeilingFactor;

  /// پیش‌فرض سال ۱۴۰۵ طبق ASSUMPTIONS.md
  factory FiscalSettings.defaults1405() {
    return const FiscalSettings(
      year: 1405,
      minDailyWage: 5541850,
      minMonthlyWage: 166255500,
      housingAllowance: 30000000,
      foodAllowance: 22000000,
      marriageAllowance: 5000000,
      childAllowancePerChild: 16625550,
      seniorityDaily: 166667,
      employeeInsurancePercent: 7,
      employerInsurancePercent: 20,
      unemploymentInsurancePercent: 3,
      hardJobExtraPercent: 0,
      insuranceCeilingFactor: 7,
      dayBasis: DayBasisMode.fixed30,
      hourlyDivisorMode: HourlyDivisorMode.sevenPoint33,
      overtimeFactorBps: 1400,
      nightFactorBps: 350,
      holidayFactorBps: 1400,
      roundingMode: RoundingMode.nearestRial,
      taxTableBasis: TaxTableBasis.monthly,
      taxBrackets: [
        TaxBracket(fromAmount: 0, toAmount: 400000000, ratePercent: 0),
        TaxBracket(
          fromAmount: 400000000,
          toAmount: 800000000,
          ratePercent: 10,
        ),
        TaxBracket(
          fromAmount: 800000000,
          toAmount: 1000000000,
          ratePercent: 15,
        ),
        TaxBracket(
          fromAmount: 1000000000,
          toAmount: 1200000000,
          ratePercent: 20,
        ),
        TaxBracket(
          fromAmount: 1200000000,
          toAmount: 1400000000,
          ratePercent: 25,
        ),
        TaxBracket(fromAmount: 1400000000, toAmount: null, ratePercent: 30),
      ],
    );
  }

  Map<String, dynamic> toJson() => {
        'year': year,
        'minDailyWage': minDailyWage,
        'minMonthlyWage': minMonthlyWage,
        'housingAllowance': housingAllowance,
        'foodAllowance': foodAllowance,
        'marriageAllowance': marriageAllowance,
        'childAllowancePerChild': childAllowancePerChild,
        'seniorityDaily': seniorityDaily,
        'employeeInsurancePercent': employeeInsurancePercent,
        'employerInsurancePercent': employerInsurancePercent,
        'unemploymentInsurancePercent': unemploymentInsurancePercent,
        'hardJobExtraPercent': hardJobExtraPercent,
        'insuranceCeilingFactor': insuranceCeilingFactor,
        'dayBasis': dayBasis.name,
        'hourlyDivisorMode': hourlyDivisorMode.name,
        'overtimeFactorBps': overtimeFactorBps,
        'nightFactorBps': nightFactorBps,
        'holidayFactorBps': holidayFactorBps,
        'roundingMode': roundingMode.name,
        'taxTableBasis': taxTableBasis.name,
        'hourlyBaseIncludesBase': hourlyBaseIncludesBase,
        'hourlyBaseIncludesSeniority': hourlyBaseIncludesSeniority,
        'hourlyBaseIncludesJobAllowance': hourlyBaseIncludesJobAllowance,
        'taxBrackets': [
          for (final b in taxBrackets)
            {
              'fromAmount': b.fromAmount,
              'toAmount': b.toAmount,
              'ratePercent': b.ratePercent,
            },
        ],
      };

  factory FiscalSettings.fromJson(Map<String, dynamic> json) {
    return FiscalSettings(
      year: json['year'] as int,
      minDailyWage: json['minDailyWage'] as int,
      minMonthlyWage: json['minMonthlyWage'] as int,
      housingAllowance: json['housingAllowance'] as int,
      foodAllowance: json['foodAllowance'] as int,
      marriageAllowance: json['marriageAllowance'] as int,
      childAllowancePerChild: json['childAllowancePerChild'] as int,
      seniorityDaily: json['seniorityDaily'] as int,
      employeeInsurancePercent: json['employeeInsurancePercent'] as int,
      employerInsurancePercent: json['employerInsurancePercent'] as int,
      unemploymentInsurancePercent:
          json['unemploymentInsurancePercent'] as int,
      hardJobExtraPercent: json['hardJobExtraPercent'] as int,
      insuranceCeilingFactor: json['insuranceCeilingFactor'] as int,
      dayBasis: DayBasisMode.values.byName(json['dayBasis'] as String),
      hourlyDivisorMode:
          HourlyDivisorMode.values.byName(json['hourlyDivisorMode'] as String),
      overtimeFactorBps: json['overtimeFactorBps'] as int,
      nightFactorBps: json['nightFactorBps'] as int,
      holidayFactorBps: json['holidayFactorBps'] as int,
      roundingMode: RoundingMode.values.byName(json['roundingMode'] as String),
      taxTableBasis:
          TaxTableBasis.values.byName(json['taxTableBasis'] as String),
      hourlyBaseIncludesBase: json['hourlyBaseIncludesBase'] as bool? ?? true,
      hourlyBaseIncludesSeniority:
          json['hourlyBaseIncludesSeniority'] as bool? ?? true,
      hourlyBaseIncludesJobAllowance:
          json['hourlyBaseIncludesJobAllowance'] as bool? ?? true,
      taxBrackets: [
        for (final b in (json['taxBrackets'] as List<dynamic>))
          TaxBracket(
            fromAmount: b['fromAmount'] as int,
            toAmount: b['toAmount'] as int?,
            ratePercent: b['ratePercent'] as int,
          ),
      ],
    );
  }
}
