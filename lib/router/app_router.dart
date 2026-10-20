import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/dashboard/presentation/pages/dashboard_page.dart';
import '../features/employees/presentation/pages/employees_page.dart';
import '../features/monthly_inputs/presentation/pages/monthly_inputs_page.dart';
import '../features/payroll/presentation/pages/payroll_page.dart';
import '../features/reports/presentation/pages/reports_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/shell/presentation/app_shell.dart';
import '../features/showcase/presentation/pages/components_showcase_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(
        location: state.uri.path,
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/',
          name: 'dashboard',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const DashboardPage(),
            transitionsBuilder: _fadeSlide,
          ),
        ),
        GoRoute(
          path: '/employees',
          name: 'employees',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const EmployeesPage(),
            transitionsBuilder: _fadeSlide,
          ),
        ),
        GoRoute(
          path: '/inputs',
          name: 'inputs',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const MonthlyInputsPage(),
            transitionsBuilder: _fadeSlide,
          ),
        ),
        GoRoute(
          path: '/payroll',
          name: 'payroll',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const PayrollPage(),
            transitionsBuilder: _fadeSlide,
          ),
        ),
        GoRoute(
          path: '/reports',
          name: 'reports',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ReportsPage(),
            transitionsBuilder: _fadeSlide,
          ),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SettingsPage(),
            transitionsBuilder: _fadeSlide,
          ),
        ),
        GoRoute(
          path: '/showcase',
          name: 'showcase',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ComponentsShowcasePage(),
            transitionsBuilder: _fadeSlide,
          ),
        ),
      ],
    ),
  ],
);

Widget _fadeSlide(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final curved = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutCubic,
  );
  return FadeTransition(
    opacity: curved,
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.015, 0),
        end: Offset.zero,
      ).animate(curved),
      child: child,
    ),
  );
}
