import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../../core/database/database_provider.dart';
import '../data/payroll_service.dart';

final payrollServiceProvider = Provider<PayrollService>((ref) {
  return PayrollService(ref.watch(databaseProvider));
});

final selectedYearProvider = StateProvider<int>((ref) => Jalali.now().year);
final selectedMonthProvider = StateProvider<int>((ref) => Jalali.now().month);
