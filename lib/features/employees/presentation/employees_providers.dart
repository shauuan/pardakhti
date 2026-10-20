import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../data/employee_repository.dart';

final employeeRepositoryProvider = Provider<EmployeeRepository>((ref) {
  return EmployeeRepository(ref.watch(databaseProvider));
});

final employeeSearchProvider = StateProvider<String>((ref) => '');

final employeesStreamProvider = StreamProvider<List<Employee>>((ref) {
  final repo = ref.watch(employeeRepositoryProvider);
  final q = ref.watch(employeeSearchProvider);
  return repo.watchAll(query: q);
});
