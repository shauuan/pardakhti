import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../data/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(databaseProvider));
});

/// وضعیت نشست — بعد از لاگین موفق true می‌شود.
final sessionUnlockedProvider = StateProvider<bool>((ref) => false);

final onboardedFutureProvider = FutureProvider<bool>((ref) async {
  return ref.watch(authRepositoryProvider).isOnboarded();
});
