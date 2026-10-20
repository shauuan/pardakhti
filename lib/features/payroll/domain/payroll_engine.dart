import 'package:shamsi_date/shamsi_date.dart';

import 'fiscal_settings.dart';
import 'payroll_models.dart';
import 'rounding.dart';
import 'tax_bracket.dart';

/// موتور محاسبه خالص — مستقل از UI و دیتابیس.
class PayrollEngine {
  const PayrollEngine();

  PayrollEngineResult calculate(PayrollEngineInput input) {
    final s = input.settings;
    int round(int v) => MoneyRounding.apply(v, s.roundingMode);
    final lines = <BreakdownLine>[];
    final warnings = <String>[];

    final monthDays = _monthDays(input.year, input.month, s.dayBasis);
    final worked = input.workedDays.clamp(0, monthDays);
    if (worked == 0) {
      warnings.add('روز کارکرد صفر است.');
    }

    // نسبت کارکرد برای مزایای ثابت ماهانه
    final ratioNum = worked;
    final ratioDen = monthDays == 0 ? 1 : monthDays;

    int prorate(int monthly) =>
        round((monthly * ratioNum) ~/ ratioDen);

    // ۱) حقوق پایه
    final basePay = round(input.dailyWage * worked);
    lines.add(
      BreakdownLine(
        code: 'base',
        label: 'حقوق پایه',
        amount: basePay,
        detail: 'مزد روزانه ${input.dailyWage} × $worked روز',
        subjectToInsurance: true,
        subjectToTax: true,
      ),
    );

    // ۲) پایه سنوات
    final seniority = round(s.seniorityDaily * input.seniorityBases * worked);
    if (seniority > 0) {
      lines.add(
        BreakdownLine(
          code: 'seniority',
          label: 'پایه سنوات',
          amount: seniority,
          detail:
              '${s.seniorityDaily} × ${input.seniorityBases} پایه × $worked روز',
          subjectToInsurance: true,
          subjectToTax: true,
        ),
      );
    }

    // ۳) فوق‌العاده شغل (به نسبت)
    final job = prorate(input.jobAllowanceMonthly);
    if (job > 0) {
      lines.add(
        BreakdownLine(
          code: 'job',
          label: 'فوق‌العاده شغل',
          amount: job,
          detail: 'ماهانه ${input.jobAllowanceMonthly} به نسبت $worked/$monthDays',
          subjectToInsurance: true,
          subjectToTax: true,
        ),
      );
    }

    // ۴) مسکن، بن، تاهل
    final housing = prorate(s.housingAllowance);
    lines.add(
      BreakdownLine(
        code: 'housing',
        label: 'حق مسکن',
        amount: housing,
        detail: 'ماهانه ${s.housingAllowance} به نسبت $worked/$monthDays',
        subjectToInsurance: true,
        subjectToTax: true,
      ),
    );

    final food = prorate(s.foodAllowance);
    lines.add(
      BreakdownLine(
        code: 'food',
        label: 'بن خواروبار',
        amount: food,
        detail: 'ماهانه ${s.foodAllowance} به نسبت $worked/$monthDays',
        subjectToInsurance: true,
        subjectToTax: true,
      ),
    );

    var marriage = 0;
    if (input.married) {
      marriage = prorate(s.marriageAllowance);
      lines.add(
        BreakdownLine(
          code: 'marriage',
          label: 'حق تاهل',
          amount: marriage,
          detail: 'ماهانه ${s.marriageAllowance} به نسبت $worked/$monthDays',
          subjectToInsurance: true,
          subjectToTax: true,
        ),
      );
    }

    // ۵) حق اولاد
    var child = 0;
    if (input.childAllowanceEligible && input.childrenCount > 0) {
      child = round(s.childAllowancePerChild * input.childrenCount);
      // به نسبت کارکرد
      child = round((child * ratioNum) ~/ ratioDen);
      lines.add(
        BreakdownLine(
          code: 'child',
          label: 'حق اولاد',
          amount: child,
          detail:
              '${input.childrenCount} فرزند × ${s.childAllowancePerChild} به نسبت',
          subjectToInsurance: false,
          subjectToTax: true,
        ),
      );
    }

    // دستمزد ساعتی
    final hourlyBaseDaily = _hourlyDailyBase(
      s: s,
      dailyWage: input.dailyWage,
      seniorityDaily: s.seniorityDaily * input.seniorityBases,
      jobDaily: monthDays == 0
          ? 0
          : (input.jobAllowanceMonthly ~/ monthDays),
    );
    final hourlyWage = _hourlyWage(s, hourlyBaseDaily);

    // ۶) اضافه‌کاری / شب / تعطیل
    final ot = round(
      _mulHours(input.overtimeHours, hourlyWage, s.overtimeFactorBps),
    );
    if (ot > 0 || input.overtimeHours > 0) {
      lines.add(
        BreakdownLine(
          code: 'overtime',
          label: 'اضافه‌کاری',
          amount: ot,
          detail:
              '${input.overtimeHours} ساعت × $hourlyWage × ${s.overtimeFactorBps / 1000}',
          subjectToInsurance: true,
          subjectToTax: true,
        ),
      );
    }

    final night = round(
      _mulHours(input.nightHours, hourlyWage, s.nightFactorBps),
    );
    if (night > 0 || input.nightHours > 0) {
      lines.add(
        BreakdownLine(
          code: 'night',
          label: 'شب‌کاری',
          amount: night,
          detail:
              '${input.nightHours} ساعت × $hourlyWage × ${s.nightFactorBps / 1000}',
          subjectToInsurance: true,
          subjectToTax: true,
        ),
      );
    }

    final holiday = round(
      _mulHours(input.holidayHours, hourlyWage, s.holidayFactorBps),
    );
    if (holiday > 0 || input.holidayHours > 0) {
      lines.add(
        BreakdownLine(
          code: 'holiday',
          label: 'تعطیل‌کاری',
          amount: holiday,
          detail:
              '${input.holidayHours} ساعت × $hourlyWage × ${s.holidayFactorBps / 1000}',
          subjectToInsurance: true,
          subjectToTax: true,
        ),
      );
    }

    // ۷) پاداش غیرمستمر
    final bonus = round(input.bonusAmount);
    if (bonus > 0) {
      lines.add(
        BreakdownLine(
          code: 'bonus',
          label: 'پاداش',
          amount: bonus,
          detail: 'دستی',
          subjectToInsurance: false,
          subjectToTax: true,
        ),
      );
    }

    for (final m in input.manualEarnings) {
      final amt = round(m.amount);
      if (amt == 0) continue;
      lines.add(
        BreakdownLine(
          code: m.code,
          label: m.name,
          amount: amt,
          detail: 'دستی',
          subjectToInsurance: m.subjectToInsurance,
          subjectToTax: m.subjectToTax,
        ),
      );
    }

    // ناخالص = مجموع مزایای مثبت
    final gross = round(
      lines.fold<int>(0, (a, l) => a + (l.amount > 0 ? l.amount : 0)),
    );

    // مشمول بیمه
    var insuranceBase = round(
      lines
          .where((l) => l.subjectToInsurance)
          .fold<int>(0, (a, l) => a + l.amount),
    );
    if (insuranceBase > s.insuranceCeiling) {
      warnings.add(
        'مشمول بیمه از سقف (${s.insuranceCeiling}) بیشتر بود و سقف اعمال شد.',
      );
      insuranceBase = s.insuranceCeiling;
    }
    // حداقل مبنای بیمه روزانه × کارکرد (اگر کمتر)
    final minIns = round(s.minDailyWage * worked);
    if (insuranceBase > 0 && insuranceBase < minIns) {
      // معمولاً حداقل اعمال می‌شود وقتی مشمول وجود دارد
      insuranceBase = minIns;
      warnings.add('حداقل مبنای بیمه اعمال شد.');
    }

    final empIns = round((insuranceBase * s.employeeInsurancePercent) ~/ 100);
    final erIns = round((insuranceBase * s.employerInsurancePercent) ~/ 100);
    final unemp = round(
      (insuranceBase * s.unemploymentInsurancePercent) ~/ 100,
    );
    final hardExtra = input.isHardJob
        ? round((insuranceBase * s.hardJobExtraPercent) ~/ 100)
        : 0;

    lines.add(
      BreakdownLine(
        code: 'ins_employee',
        label: 'بیمه سهم کارگر',
        amount: -empIns,
        detail: '$insuranceBase × ${s.employeeInsurancePercent}٪',
      ),
    );
    lines.add(
      BreakdownLine(
        code: 'ins_employer',
        label: 'بیمه سهم کارفرما',
        amount: erIns,
        detail: '$insuranceBase × ${s.employerInsurancePercent}٪ (هزینه کارفرما)',
      ),
    );
    lines.add(
      BreakdownLine(
        code: 'ins_unemployment',
        label: 'بیمه بیکاری',
        amount: unemp,
        detail:
            '$insuranceBase × ${s.unemploymentInsurancePercent}٪ (سهم کارفرما)',
      ),
    );

    // مشمول مالیات
    final taxSubject = round(
      lines
          .where((l) => l.subjectToTax && l.amount > 0)
          .fold<int>(0, (a, l) => a + l.amount),
    );
    var taxBase = taxSubject - empIns;
    if (taxBase < 0) taxBase = 0;

    final tax = round(_computeTax(taxBase, s));

    lines.add(
      BreakdownLine(
        code: 'tax',
        label: 'مالیات',
        amount: -tax,
        detail: 'مشمول $taxBase طبق جدول پلکانی',
      ),
    );

    // کسورات دیگر
    final advance = round(input.advanceAmount);
    final loan = round(input.loanAmount);
    final penalty = round(input.penaltyAmount);
    var otherDed = advance + loan + penalty;
    for (final m in input.manualDeductions) {
      otherDed += round(m.amount);
    }
    otherDed = round(otherDed);

    if (advance > 0) {
      lines.add(
        BreakdownLine(
          code: 'advance',
          label: 'مساعده',
          amount: -advance,
          detail: 'کسر از خالص',
        ),
      );
    }
    if (loan > 0) {
      lines.add(
        BreakdownLine(
          code: 'loan',
          label: 'وام',
          amount: -loan,
          detail: 'کسر از خالص',
        ),
      );
    }
    if (penalty > 0) {
      lines.add(
        BreakdownLine(
          code: 'penalty',
          label: 'جریمه',
          amount: -penalty,
          detail: 'کسر از خالص',
        ),
      );
    }
    for (final m in input.manualDeductions) {
      final amt = round(m.amount);
      if (amt == 0) continue;
      lines.add(
        BreakdownLine(
          code: m.code,
          label: m.name,
          amount: -amt,
          detail: 'کسر دستی',
        ),
      );
    }

    final net = round(gross - empIns - tax - otherDed);
    final netNegative = net < 0;
    if (netNegative) {
      warnings.add('خالص پرداختی منفی است؛ ادامه نیاز به تأیید دارد.');
    }

    final employerCost =
        round(gross + erIns + unemp + hardExtra);

    return PayrollEngineResult(
      gross: gross,
      insuranceBase: insuranceBase,
      employeeInsurance: empIns,
      employerInsurance: erIns,
      unemploymentInsurance: unemp,
      taxBase: taxBase,
      tax: tax,
      otherDeductions: otherDed,
      net: net,
      employerTotalCost: employerCost,
      lines: List.unmodifiable(lines),
      warnings: List.unmodifiable(warnings),
      netNegative: netNegative,
    );
  }

  static int _monthDays(int year, int month, DayBasisMode mode) {
    if (mode == DayBasisMode.fixed30) return 30;
    return Jalali(year, month, 1).monthLength;
  }

  static int _hourlyDailyBase({
    required FiscalSettings s,
    required int dailyWage,
    required int seniorityDaily,
    required int jobDaily,
  }) {
    var sum = 0;
    if (s.hourlyBaseIncludesBase) sum += dailyWage;
    if (s.hourlyBaseIncludesSeniority) sum += seniorityDaily;
    if (s.hourlyBaseIncludesJobAllowance) sum += jobDaily;
    return sum;
  }

  /// دستمزد ساعتی صحیح به ریال (بدون اعشار پول — تقسیمات با باقی‌مانده به نزدیک‌ترین).
  static int _hourlyWage(FiscalSettings s, int dailyBase) {
    if (s.hourlyDivisorMode == HourlyDivisorMode.monthly220) {
      // ماهانه تقریبی: dailyBase * 30 / 220
      return ((dailyBase * 30) + 110) ~/ 220;
    }
    // ÷ ۷.۳۳ ≈ × ۱۰۰ / ۷۳۳
    return ((dailyBase * 100) + 366) ~/ 733;
  }

  static int _mulHours(double hours, int hourlyWage, int factorBps) {
    if (hours <= 0 || hourlyWage <= 0) return 0;
    // hours * wage * factorBps / 1000 — با دقت صحیح
    final milliHours = (hours * 1000).round();
    return (milliHours * hourlyWage * factorBps) ~/ (1000 * 1000);
  }

  static int _computeTax(int taxBase, FiscalSettings s) {
    if (taxBase <= 0) return 0;
    // اگر annual: مشمول ماهانه × ۱۲ با جدول سالانه، سپس ÷ ۱۲
    if (s.taxTableBasis == TaxTableBasis.annual) {
      final annualIncome = taxBase * 12;
      final annualTax = _progressive(annualIncome, s.taxBrackets);
      return (annualTax + 6) ~/ 12;
    }
    return _progressive(taxBase, s.taxBrackets);
  }

  static int _progressive(int income, List<TaxBracket> brackets) {
    var tax = 0;
    final sorted = [...brackets]
      ..sort((a, b) => a.fromAmount.compareTo(b.fromAmount));
    for (final b in sorted) {
      if (income <= b.fromAmount) continue;
      final upper = b.toAmount ?? income;
      final sliceStart = b.fromAmount;
      final sliceEnd = upper < income ? upper : income;
      if (sliceEnd <= sliceStart) continue;
      final taxable = sliceEnd - sliceStart;
      tax += (taxable * b.ratePercent) ~/ 100;
    }
    return tax;
  }
}
