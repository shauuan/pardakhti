import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_providers.dart';
import 'pages/login_page.dart';
import 'pages/onboarding_page.dart';

/// قبل از دسترسی به شل اصلی، onboarding یا login را نشان می‌دهد.
class AuthGate extends ConsumerWidget {
  const AuthGate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unlocked = ref.watch(sessionUnlockedProvider);
    final onboardedAsync = ref.watch(onboardedFutureProvider);

    return onboardedAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(body: Center(child: Text('$e'))),
      data: (onboarded) {
        if (!onboarded) return const OnboardingPage();
        if (!unlocked) return const LoginPage();
        return child;
      },
    );
  }
}
