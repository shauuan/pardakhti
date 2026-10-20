import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/app_strings.dart';
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
      id: 'showcase',
      label: AppStrings.navShowcase,
      icon: Icons.widgets_outlined,
      route: '/showcase',
    ),
    SidebarItem(
      id: 'employees',
      label: AppStrings.navEmployees,
      icon: Icons.people_outline,
      enabled: false,
    ),
    SidebarItem(
      id: 'inputs',
      label: AppStrings.navMonthlyInputs,
      icon: Icons.table_chart_outlined,
      enabled: false,
    ),
    SidebarItem(
      id: 'payroll',
      label: AppStrings.navPayroll,
      icon: Icons.calculate_outlined,
      enabled: false,
    ),
    SidebarItem(
      id: 'reports',
      label: AppStrings.navReports,
      icon: Icons.description_outlined,
      enabled: false,
    ),
    SidebarItem(
      id: 'settings',
      label: AppStrings.navSettings,
      icon: Icons.settings_outlined,
      enabled: false,
    ),
  ];

  String get _selectedId {
    if (widget.location.startsWith('/showcase')) return 'showcase';
    return 'dashboard';
  }

  String get _title {
    return switch (_selectedId) {
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
          AppToast.show(
            context,
            message: 'جستجوی سراسری در مراحل بعد فعال می‌شود',
          );
        },
        const SingleActivator(LogicalKeyboardKey.keyS, control: true): () {
          AppToast.show(
            context,
            message: 'ذخیره — در این مرحله نمونه است',
            tone: AppToastTone.success,
          );
        },
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          // در RTL اولین فرزند سمت راست قرار می‌گیرد → سایدبار راست
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
                    Expanded(child: widget.child),
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
