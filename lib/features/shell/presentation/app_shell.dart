import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/theme/app_motion.dart';
import '../../../core/ui/feedback/app_toast.dart';
import '../../../core/ui/navigation/app_sidebar.dart';
import '../../../core/ui/navigation/app_top_bar.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    super.key,
    required this.child,
    required this.location,
  });

  final Widget child;
  final String location;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  bool _collapsed = false;

  static const _items = [
    SidebarItem(
      id: 'dashboard',
      label: AppStrings.navDashboard,
      icon: Icons.dashboard_outlined,
      route: '/',
    ),
    SidebarItem(
      id: 'employees',
      label: AppStrings.navEmployees,
      icon: Icons.people_outline,
      route: '/employees',
    ),
    SidebarItem(
      id: 'inputs',
      label: AppStrings.navMonthlyInputs,
      icon: Icons.table_chart_outlined,
      route: '/inputs',
    ),
    SidebarItem(
      id: 'payroll',
      label: AppStrings.navPayroll,
      icon: Icons.calculate_outlined,
      route: '/payroll',
    ),
    SidebarItem(
      id: 'reports',
      label: AppStrings.navReports,
      icon: Icons.description_outlined,
      route: '/reports',
    ),
    SidebarItem(
      id: 'settings',
      label: AppStrings.navSettings,
      icon: Icons.settings_outlined,
      route: '/settings',
    ),
    SidebarItem(
      id: 'showcase',
      label: AppStrings.navShowcase,
      icon: Icons.widgets_outlined,
      route: '/showcase',
    ),
  ];

  String get _selectedId {
    final path = widget.location;
    if (path.startsWith('/employees')) return 'employees';
    if (path.startsWith('/inputs')) return 'inputs';
    if (path.startsWith('/payroll')) return 'payroll';
    if (path.startsWith('/reports')) return 'reports';
    if (path.startsWith('/settings')) return 'settings';
    if (path.startsWith('/showcase')) return 'showcase';
    return 'dashboard';
  }

  String get _title {
    return switch (_selectedId) {
      'employees' => AppStrings.navEmployees,
      'inputs' => AppStrings.navMonthlyInputs,
      'payroll' => AppStrings.navPayroll,
      'reports' => AppStrings.navReports,
      'settings' => AppStrings.navSettings,
      'showcase' => AppStrings.navShowcase,
      _ => AppStrings.dashboardTitle,
    };
  }

  void _onSelect(String id) {
    final item = _items.firstWhere((e) => e.id == id);
    if (item.route != null) context.go(item.route!);
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyK, control: true): () {
          AppToast.show(context, message: AppStrings.searchHint);
        },
        const SingleActivator(LogicalKeyboardKey.keyS, control: true): () {
          AppToast.show(
            context,
            message: 'از دکمه ذخیره در صفحه استفاده کنید',
            tone: AppToastTone.info,
          );
        },
        const SingleActivator(LogicalKeyboardKey.keyN, control: true): () {
          context.go('/employees');
        },
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          body: Row(
            children: [
              AppSidebar(
                collapsed: _collapsed,
                onToggle: () => setState(() => _collapsed = !_collapsed),
                selectedId: _selectedId,
                onSelect: _onSelect,
                items: _items,
              ),
              Expanded(
                child: Column(
                  children: [
                    AppTopBar(
                      title: _title,
                      onSearch: () => AppToast.show(
                        context,
                        message: AppStrings.searchHint,
                      ),
                    ),
                    Expanded(
                      child: KeyedSubtree(
                        key: ValueKey(widget.location),
                        child: widget.child,
                      )
                          .animate()
                          .fadeIn(duration: AppMotion.normal)
                          .slideX(
                            begin: 0.01,
                            end: 0,
                            duration: AppMotion.normal,
                            curve: AppMotion.curve,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
