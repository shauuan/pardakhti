import 'package:flutter_test/flutter_test.dart';
import 'package:pardakhti/features/payroll/domain/fiscal_settings.dart';
import 'package:pardakhti/features/payroll/domain/payroll_engine.dart';
import 'package:pardakhti/features/payroll/domain/payroll_models.dart';
import 'package:pardakhti/features/payroll/domain/rounding.dart';
import 'package:pardakhti/features/payroll/domain/tax_bracket.dart';

void main() {
  const engine = PayrollEngine();
  final settings = FiscalSettings.defaults1405();

  PayrollEngineInput baseInput({
    FiscalSettings? s,
    int dailyWage = 5541850,
    int workedDays = 30,
    int seniorityBases = 1,
    int childrenCount = 0,
    bool childEligible = true,
    bool married = true,
    bool isHardJob = false,
    int jobAllowance = 0,
    double overtimeHours = 0,
    double nightHours = 0,
    double holidayHours = 0,
    int bonus = 0,
    int advance = 0,
    int loan = 0,
    int penalty = 0,
    int year = 1405,
    int month = 1,
  }) {
    return PayrollEngineInput(
      settings: s ?? settings,
      year: year,
      month: month,
      dailyWage: dailyWage,
      workedDays: workedDays,
      seniorityBases: seniorityBases,
      childrenCount: childrenCount,
      childAllowanceEligible: childEligible,
      married: married,
      isHardJob: isHardJob,
      jobAllowanceMonthly: jobAllowance,
      overtimeHours: overtimeHours,
      nightHours: nightHours,
      holidayHours: holidayHours,
      manualEarnings: const [],
      manualDeductions: const [],
      bonusAmount: bonus,
      advanceAmount: advance,
      loanAmount: loan,
      penaltyAmount: penalty,
    );
  }

  group('Rounding', () {
    test('nearest rial unchanged', () {
      expect(MoneyRounding.apply(1234, RoundingMode.nearestRial), 1234);
    });

    test('nearest ten', () {
      // ۱۲۳۴ → ۱۲۳۰ ؛ ۱۲۳۵ → ۱۲۴۰
      expect(MoneyRounding.apply(1234, RoundingMode.nearestTen), 1230);
      expect(MoneyRounding.apply(1235, RoundingMode.nearestTen), 1240);
    });

    test('nearest hundred', () {
      expect(MoneyRounding.apply(1249, RoundingMode.nearestHundred), 1200);
      expect(MoneyRounding.apply(1250, RoundingMode.nearestHundred), 1300);
    });
  });

  group('Normal full month', () {
    test('حداقل‌بگیر متاهل بدون فرزند — ناخالص و بیمه مثبت', () {
      // مزد ماهانه حداقل + مسکن + بن + تاهل + یک پایه سنوات
      final r = engine.calculate(baseInput());
      expect(r.gross, greaterThan(settings.minMonthlyWage));
      expect(r.employeeInsurance, greaterThan(0));
      expect(r.employerInsurance + r.unemploymentInsurance,
          equals(r.employerInsuranceTotal));
      // سهم کارفرما ۲۳٪ روی همان پایه
      expect(
        r.employerInsurance * 100 ~/ r.insuranceBase,
        settings.employerInsurancePercent,
      );
      expect(r.netNegative, isFalse);
      expect(r.lines.where((l) => l.code == 'housing'), isNotEmpty);
    });

    test('مجرد — حق تاهل صفر', () {
      final r = engine.calculate(baseInput(married: false));
      expect(r.lines.where((l) => l.code == 'marriage'), isEmpty);
    });
  });

  group('Insurance ceiling', () {
    test('حقوق خیلی بالا — سقف ۷ برابر حداقل ماهانه', () {
      // مزد روزانه خیلی بالا تا مشمول از سقف بگذرد
      final r = engine.calculate(
        baseInput(dailyWage: 100000000, seniorityBases: 0, married: false),
      );
      expect(r.insuranceBase, settings.insuranceCeiling);
      expect(
        r.warnings.any((w) => w.contains('سقف')),
        isTrue,
      );
    });
  });

  group('Partial attendance', () {
    test('کارکرد ۱۵ روز — نصف تقریبی مزایا نسبت به ۳۰', () {
      final full = engine.calculate(baseInput(workedDays: 30));
      final half = engine.calculate(baseInput(workedDays: 15));
      // پایه دقیقاً نصف
      final fullBase =
          full.lines.firstWhere((l) => l.code == 'base').amount;
      final halfBase =
          half.lines.firstWhere((l) => l.code == 'base').amount;
      expect(halfBase * 2, fullBase);
      expect(half.gross, lessThan(full.gross));
    });

    test('کارکرد صفر — هشدار و خالص نزدیک صفر/منفی نباشد بدون کسور', () {
      final r = engine.calculate(baseInput(workedDays: 0, seniorityBases: 0));
      expect(r.warnings.any((w) => w.contains('صفر')), isTrue);
      expect(r.gross, 0);
    });
  });

  group('Month lengths', () {
    test('فروردین ۳۱ روز واقعی در حالت actual', () {
      final s = FiscalSettings(
        year: 1405,
        minDailyWage: settings.minDailyWage,
        minMonthlyWage: settings.minMonthlyWage,
        housingAllowance: settings.housingAllowance,
        foodAllowance: settings.foodAllowance,
        marriageAllowance: settings.marriageAllowance,
        childAllowancePerChild: settings.childAllowancePerChild,
        seniorityDaily: settings.seniorityDaily,
        employeeInsurancePercent: 7,
        employerInsurancePercent: 20,
        unemploymentInsurancePercent: 3,
        hardJobExtraPercent: 0,
        insuranceCeilingFactor: 7,
        dayBasis: DayBasisMode.actualMonthDays,
        hourlyDivisorMode: HourlyDivisorMode.sevenPoint33,
        overtimeFactorBps: 1400,
        nightFactorBps: 350,
        holidayFactorBps: 1400,
        roundingMode: RoundingMode.nearestRial,
        taxTableBasis: TaxTableBasis.monthly,
        taxBrackets: settings.taxBrackets,
      );
      final r = engine.calculate(
        baseInput(s: s, month: 1, workedDays: 31, married: false, seniorityBases: 0),
      );
      expect(
        r.lines.firstWhere((l) => l.code == 'base').amount,
        settings.minDailyWage * 31,
      );
    });

    test('مهر ۳۰ روز واقعی', () {
      final s = FiscalSettings.defaults1405();
      // با fixed30 همیشه ۳۰ — برای actual مهر
      final actual = FiscalSettings(
        year: s.year,
        minDailyWage: s.minDailyWage,
        minMonthlyWage: s.minMonthlyWage,
        housingAllowance: 0,
        foodAllowance: 0,
        marriageAllowance: 0,
        childAllowancePerChild: s.childAllowancePerChild,
        seniorityDaily: 0,
        employeeInsurancePercent: 7,
        employerInsurancePercent: 20,
        unemploymentInsurancePercent: 3,
        hardJobExtraPercent: 0,
        insuranceCeilingFactor: 7,
        dayBasis: DayBasisMode.actualMonthDays,
        hourlyDivisorMode: s.hourlyDivisorMode,
        overtimeFactorBps: s.overtimeFactorBps,
        nightFactorBps: s.nightFactorBps,
        holidayFactorBps: s.holidayFactorBps,
        roundingMode: s.roundingMode,
        taxTableBasis: s.taxTableBasis,
        taxBrackets: s.taxBrackets,
      );
      final r = engine.calculate(
        baseInput(
          s: actual,
          month: 7,
          workedDays: 30,
          married: false,
          seniorityBases: 0,
        ),
      );
      expect(r.lines.firstWhere((l) => l.code == 'base').amount,
          settings.minDailyWage * 30);
    });

    test('اسفند کبیسه/غیرکبیسه از Jalali', () {
      // ۱۴۰۳ کبیسه بود؛ ۱۴۰۴/۱۴۰۵ را موتور از shamsi می‌گیرد
      const s = FiscalSettings(
        year: 1403,
        minDailyWage: 1000,
        minMonthlyWage: 30000,
        housingAllowance: 0,
        foodAllowance: 0,
        marriageAllowance: 0,
        childAllowancePerChild: 0,
        seniorityDaily: 0,
        employeeInsurancePercent: 7,
        employerInsurancePercent: 20,
        unemploymentInsurancePercent: 3,
        hardJobExtraPercent: 0,
        insuranceCeilingFactor: 7,
        dayBasis: DayBasisMode.actualMonthDays,
        hourlyDivisorMode: HourlyDivisorMode.sevenPoint33,
        overtimeFactorBps: 1400,
        nightFactorBps: 350,
        holidayFactorBps: 1400,
        roundingMode: RoundingMode.nearestRial,
        taxTableBasis: TaxTableBasis.monthly,
        taxBrackets: [
          TaxBracket(fromAmount: 0, toAmount: null, ratePercent: 0),
        ],
      );
      final r = engine.calculate(
        baseInput(
          s: s,
          year: 1403,
          month: 12,
          dailyWage: 1000,
          workedDays: 30,
          married: false,
          seniorityBases: 0,
        ),
      );
      // اسفند ۱۴۰۳ کبیسه = ۳۰ روز
      expect(r.lines.firstWhere((l) => l.code == 'base').amount, 30000);
    });
  });

  group('Tax brackets', () {
    test('زیر معافیت — مالیات صفر', () {
      // فقط مشمول کم
      final r = engine.calculate(
        baseInput(
          dailyWage: 1000000,
          seniorityBases: 0,
          married: false,
        ),
      );
      expect(r.tax, 0);
    });

    test('مرز پله اول به دوم — مثال بودجه: ۱۰۰ م تومان مشمول → ۷ م تومان مالیات', () {
      // مستقیماً منطق مالیات را با تنظیمات خالی مزایا شبیه‌سازی نمی‌کنیم؛
      // ورودی ساختگی با پاداش بزرگ مشمول مالیات
      // برای کنترل دقیق: مشمول مالیات پس از بیمه را هدف می‌گیریم
      // اینجا یک FiscalSettings با بیمه ۰٪ و فقط پاداش
      final s = FiscalSettings(
        year: 1405,
        minDailyWage: 1,
        minMonthlyWage: 30,
        housingAllowance: 0,
        foodAllowance: 0,
        marriageAllowance: 0,
        childAllowancePerChild: 0,
        seniorityDaily: 0,
        employeeInsurancePercent: 0,
        employerInsurancePercent: 0,
        unemploymentInsurancePercent: 0,
        hardJobExtraPercent: 0,
        insuranceCeilingFactor: 7,
        dayBasis: DayBasisMode.fixed30,
        hourlyDivisorMode: HourlyDivisorMode.sevenPoint33,
        overtimeFactorBps: 1400,
        nightFactorBps: 350,
        holidayFactorBps: 1400,
        roundingMode: RoundingMode.nearestRial,
        taxTableBasis: TaxTableBasis.monthly,
        taxBrackets: settings.taxBrackets,
      );
      final r = engine.calculate(
        baseInput(
          s: s,
          dailyWage: 0,
          workedDays: 0,
          seniorityBases: 0,
          married: false,
          bonus: 1000000000, // ۱۰۰ میلیون تومان به ریال
        ),
      );
      // ۴۰۰م معاف + ۴۰۰م×۱۰٪ + ۲۰۰م×۱۵٪ = ۷۰٬۰۰۰٬۰۰۰ ریال = ۷ میلیون تومان
      expect(r.tax, 70000000);
    });

    test('پله بالای ۱۴۰ م تومان — نرخ ۳۰٪ روی مازاد', () {
      final s = FiscalSettings(
        year: 1405,
        minDailyWage: 1,
        minMonthlyWage: 30,
        housingAllowance: 0,
        foodAllowance: 0,
        marriageAllowance: 0,
        childAllowancePerChild: 0,
        seniorityDaily: 0,
        employeeInsurancePercent: 0,
        employerInsurancePercent: 0,
        unemploymentInsurancePercent: 0,
        hardJobExtraPercent: 0,
        insuranceCeilingFactor: 7,
        dayBasis: DayBasisMode.fixed30,
        hourlyDivisorMode: HourlyDivisorMode.sevenPoint33,
        overtimeFactorBps: 1400,
        nightFactorBps: 350,
        holidayFactorBps: 1400,
        roundingMode: RoundingMode.nearestRial,
        taxTableBasis: TaxTableBasis.monthly,
        taxBrackets: settings.taxBrackets,
      );
      // ۱۵۰۰ میلیون ریال مشمول
      final r = engine.calculate(
        baseInput(
          s: s,
          dailyWage: 0,
          workedDays: 0,
          seniorityBases: 0,
          married: false,
          bonus: 1500000000,
        ),
      );
      // ۰ تا ۴۰۰:۰ ؛ ۴۰۰–۸۰۰:۴۰م ؛ ۸۰۰–۱۰۰۰:۳۰م ؛ ۱۰۰۰–۱۲۰۰:۴۰م ؛ ۱۲۰۰–۱۴۰۰:۵۰م ؛ ۱۴۰۰–۱۵۰۰:۳۰م
      // = ۰+۴۰+۳۰+۴۰+۵۰+۳۰ = ۱۹۰ میلیون ریال
      expect(r.tax, 190000000);
    });
  });

  group('Overtime and night', () {
    test('اضافه‌کاری ۱۰ ساعت — مبلغ مثبت و مشمول بیمه', () {
      final r = engine.calculate(baseInput(overtimeHours: 10));
      final ot = r.lines.firstWhere((l) => l.code == 'overtime');
      expect(ot.amount, greaterThan(0));
      expect(ot.subjectToInsurance, isTrue);
    });

    test('شب‌کاری جدا از اضافه‌کاری جمع می‌شود نه ضرب ضرایب', () {
      final onlyOt = engine.calculate(baseInput(overtimeHours: 5));
      final onlyNight = engine.calculate(baseInput(nightHours: 5));
      final both = engine.calculate(
        baseInput(overtimeHours: 5, nightHours: 5),
      );
      final otA = onlyOt.lines.firstWhere((l) => l.code == 'overtime').amount;
      final nA = onlyNight.lines.firstWhere((l) => l.code == 'night').amount;
      final otB = both.lines.firstWhere((l) => l.code == 'overtime').amount;
      final nB = both.lines.firstWhere((l) => l.code == 'night').amount;
      expect(otB, otA);
      expect(nB, nA);
    });
  });

  group('Children', () {
    test('دو فرزند واجد شرایط', () {
      final r = engine.calculate(
        baseInput(childrenCount: 2, childEligible: true),
      );
      final child = r.lines.firstWhere((l) => l.code == 'child');
      // ۲ × ۱۶٬۶۲۵٬۵۵۰ به نسبت ۳۰/۳۰
      expect(child.amount, settings.childAllowancePerChild * 2);
      expect(child.subjectToInsurance, isFalse);
      expect(child.subjectToTax, isTrue);
    });

    test('غیرواجد شرایط — بدون حق اولاد', () {
      final r = engine.calculate(
        baseInput(childrenCount: 3, childEligible: false),
      );
      expect(r.lines.where((l) => l.code == 'child'), isEmpty);
    });
  });

  group('Deductions and net', () {
    test('مساعده و وام از خالص کم می‌شود بدون اثر بیمه', () {
      final plain = engine.calculate(baseInput());
      final withDed = engine.calculate(
        baseInput(advance: 5000000, loan: 3000000),
      );
      expect(withDed.insuranceBase, plain.insuranceBase);
      expect(withDed.net, plain.net - 8000000);
    });

    test('خالص منفی — فلگ و هشدار', () {
      final r = engine.calculate(
        baseInput(
          dailyWage: 1000,
          seniorityBases: 0,
          married: false,
          advance: 100000000,
        ),
      );
      expect(r.netNegative, isTrue);
      expect(r.warnings.any((w) => w.contains('منفی')), isTrue);
    });
  });

  group('Employer cost', () {
    test('هزینه کل = ناخالص + ۲۳٪ مشمول (بدون سخت‌کاری)', () {
      final r = engine.calculate(baseInput());
      expect(
        r.employerTotalCost,
        r.gross + r.employerInsurance + r.unemploymentInsurance,
      );
    });
  });

  group('Breakdown', () {
    test('خروجی دارای ریز محاسبه است', () {
      final r = engine.calculate(baseInput());
      expect(r.lines.length, greaterThan(5));
      expect(r.toJson()['lines'], isA<List<dynamic>>());
    });
  });

  group('Bonus', () {
    test('پاداش مشمول مالیات است نه بیمه', () {
      final r = engine.calculate(baseInput(bonus: 10000000));
      final b = r.lines.firstWhere((l) => l.code == 'bonus');
      expect(b.subjectToInsurance, isFalse);
      expect(b.subjectToTax, isTrue);
    });
  });

  group('Job allowance', () {
    test('فوق‌العاده شغل به نسبت کارکرد', () {
      final r = engine.calculate(
        baseInput(jobAllowance: 30000000, workedDays: 15),
      );
      final j = r.lines.firstWhere((l) => l.code == 'job');
      expect(j.amount, 15000000);
    });
  });

  group('Holiday work', () {
    test('تعطیل‌کاری با ضریب ۱.۴', () {
      final r = engine.calculate(baseInput(holidayHours: 8));
      final h = r.lines.firstWhere((l) => l.code == 'holiday');
      expect(h.amount, greaterThan(0));
      expect(h.subjectToTax, isTrue);
    });
  });
}
