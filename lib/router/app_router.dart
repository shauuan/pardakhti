import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/shell/presentation/app_shell.dart';
import '../features/showcase/presentation/pages/components_showcase_page.dart';
import '../features/showcase/presentation/pages/dashboard_preview_page.dart';

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
            child: const DashboardPreviewPage(),
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
        begin: const Offset(0, 0.02),
        end: Offset.zero,
      ).animate(curved),
      child: child,
    ),
  );
}
