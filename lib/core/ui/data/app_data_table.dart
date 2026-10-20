import 'package:flutter/material.dart';

import '../../l10n/app_strings.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radii.dart';
import '../../theme/app_spacing.dart';
import '../feedback/empty_state.dart';
import '../skeleton/skeleton.dart';

class AppTableColumn<T> {
  const AppTableColumn({
    required this.id,
    required this.title,
    required this.cellBuilder,
    this.width,
    this.sortable = false,
    this.numeric = false,
  });

  final String id;
  final String title;
  final Widget Function(BuildContext context, T row) cellBuilder;
  final double? width;
  final bool sortable;
  final bool numeric;
}

class AppDataTable<T> extends StatelessWidget {
  const AppDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.loading = false,
    this.rowKey,
    this.selectedKeys = const {},
    this.onSelectionChanged,
    this.onRowTap,
    this.sortColumnId,
    this.sortAscending = true,
    this.onSort,
    this.emptyTitle = AppStrings.emptyTitle,
    this.emptySubtitle = AppStrings.emptySubtitle,
    this.onEmptyAction,
    this.emptyActionLabel,
  });

  final List<AppTableColumn<T>> columns;
  final List<T> rows;
  final bool loading;
  final String Function(T row)? rowKey;
  final Set<String> selectedKeys;
  final ValueChanged<Set<String>>? onSelectionChanged;
  final ValueChanged<T>? onRowTap;
  final String? sortColumnId;
  final bool sortAscending;
  final void Function(String columnId, bool ascending)? onSort;
  final String emptyTitle;
  final String emptySubtitle;
  final VoidCallback? onEmptyAction;
  final String? emptyActionLabel;

  bool get _selectable => onSelectionChanged != null && rowKey != null;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (loading) {
      return Column(
        children: [
          for (var i = 0; i < 5; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SkeletonBox(height: 40, borderRadius: AppRadii.mdAll),
            ),
        ],
      );
    }

    if (rows.isEmpty) {
      return EmptyState(
        title: emptyTitle,
        subtitle: emptySubtitle,
        actionLabel: emptyActionLabel,
        onAction: onEmptyAction,
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colors.border),
        borderRadius: AppRadii.mdAll,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _Header(
            columns: columns,
            selectable: _selectable,
            allSelected:
                _selectable && selectedKeys.length == rows.length && rows.isNotEmpty,
            onToggleAll: _selectable
                ? (select) {
                    if (select) {
                      onSelectionChanged!(
                        rows.map(rowKey!).toSet(),
                      );
                    } else {
                      onSelectionChanged!(<String>{});
                    }
                  }
                : null,
            sortColumnId: sortColumnId,
            sortAscending: sortAscending,
            onSort: onSort,
          ),
          Flexible(
            child: ListView.separated(
              itemCount: rows.length,
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: colors.border),
              itemBuilder: (context, index) {
                final row = rows[index];
                final key = rowKey?.call(row);
                final selected = key != null && selectedKeys.contains(key);
                return _DataRow(
                  columns: columns,
                  row: row,
                  selectable: _selectable,
                  selected: selected,
                  onSelected: _selectable
                      ? (v) {
                          final next = Set<String>.from(selectedKeys);
                          if (v) {
                            next.add(key!);
                          } else {
                            next.remove(key);
                          }
                          onSelectionChanged!(next);
                        }
                      : null,
                  onTap: onRowTap == null ? null : () => onRowTap!(row),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Header<T> extends StatelessWidget {
  const _Header({
    required this.columns,
    required this.selectable,
    required this.allSelected,
    required this.onToggleAll,
    required this.sortColumnId,
    required this.sortAscending,
    required this.onSort,
  });

  final List<AppTableColumn<T>> columns;
  final bool selectable;
  final bool allSelected;
  final ValueChanged<bool>? onToggleAll;
  final String? sortColumnId;
  final bool sortAscending;
  final void Function(String columnId, bool ascending)? onSort;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      color: colors.background,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          if (selectable)
            SizedBox(
              width: 40,
              child: Checkbox(
                value: allSelected,
                onChanged: (v) => onToggleAll?.call(v ?? false),
              ),
            ),
          for (final col in columns)
            Expanded(
              flex: col.width != null ? (col.width! / 40).round().clamp(1, 8) : 2,
              child: InkWell(
                onTap: col.sortable && onSort != null
                    ? () {
                        final asc = sortColumnId == col.id ? !sortAscending : true;
                        onSort!(col.id, asc);
                      }
                    : null,
                child: Row(
                  mainAxisAlignment: col.numeric
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Text(
                      col.title,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: colors.textSecondary,
                          ),
                    ),
                    if (col.sortable && sortColumnId == col.id) ...[
                      const SizedBox(width: 4),
                      Icon(
                        sortAscending
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        size: 14,
                        color: colors.primary,
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DataRow<T> extends StatefulWidget {
  const _DataRow({
    required this.columns,
    required this.row,
    required this.selectable,
    required this.selected,
    required this.onSelected,
    required this.onTap,
  });

  final List<AppTableColumn<T>> columns;
  final T row;
  final bool selectable;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final VoidCallback? onTap;

  @override
  State<_DataRow<T>> createState() => _DataRowState<T>();
}

class _DataRowState<T> extends State<_DataRow<T>> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bg = widget.selected
        ? colors.primaryMuted.withValues(alpha: 0.5)
        : (_hovered ? colors.tableHover : colors.surface);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          color: bg,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              if (widget.selectable)
                SizedBox(
                  width: 40,
                  child: Checkbox(
                    value: widget.selected,
                    onChanged: (v) => widget.onSelected?.call(v ?? false),
                  ),
                ),
              for (final col in widget.columns)
                Expanded(
                  flex: col.width != null
                      ? (col.width! / 40).round().clamp(1, 8)
                      : 2,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: col.cellBuilder(context, widget.row),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
