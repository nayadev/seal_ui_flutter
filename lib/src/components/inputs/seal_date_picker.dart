import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';
import 'seal_calendar.dart' show SealDateTimeRange;

// Default day-button size matching SealCalendar.
const double _kDatePickerDayButtonSize = 36.0;

/// A token-driven date-picker built on [ShadDatePicker].
///
/// The picker renders a button that opens a popover calendar. Two variants are
/// available via named constructors:
///
/// - Default [SealDatePicker] — single-date selection.
/// - [SealDatePicker.range] — continuous date-range selection.
///
/// ## Single-date
///
/// ```dart
/// SealDatePicker(
///   selected: _date,
///   onChanged: (date) => setState(() => _date = date),
/// )
/// ```
///
/// ## Range
///
/// ```dart
/// SealDatePicker.range(
///   selected: _range,
///   onChanged: (range) => setState(() => _range = range),
/// )
/// ```
class SealDatePicker extends StatelessWidget {
  /// Creates a single-date date picker.
  const SealDatePicker({
    super.key,
    this.selected,
    this.onChanged,
    this.placeholder,
    this.formatDate,
    this.closeOnSelection,
    this.allowDeselection,
    this.initialMonth,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.selectableDayPredicate,
    this.enabled = true,
  }) : _variant = ShadDatePickerVariant.single,
       _selectedRange = null,
       _onRangeChanged = null,
       _formatDateRange = null;

  /// Creates a date-range date picker.
  const SealDatePicker.range({
    super.key,
    SealDateTimeRange? selected,
    ValueChanged<SealDateTimeRange?>? onChanged,
    this.placeholder,
    String Function(SealDateTimeRange)? formatDateRange,
    this.closeOnSelection,
    this.initialMonth,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.selectableDayPredicate,
    this.enabled = true,
  }) : _variant = ShadDatePickerVariant.range,
       _selectedRange = selected,
       _onRangeChanged = onChanged,
       _formatDateRange = formatDateRange,
       selected = null,
       onChanged = null,
       formatDate = null,
       allowDeselection = null;

  // ── Internal variant marker ─────────────────────────────────────────
  final ShadDatePickerVariant _variant;

  // ── Single ──────────────────────────────────────────────────────────

  /// The currently selected date (single variant only).
  final DateTime? selected;

  /// Called when the selected date changes (single variant only).
  final ValueChanged<DateTime?>? onChanged;

  /// Custom formatter for the selected date (single variant only).
  final String Function(DateTime)? formatDate;

  /// Whether tapping a selected day deselects it (single variant only).
  final bool? allowDeselection;

  // ── Range ───────────────────────────────────────────────────────────
  final SealDateTimeRange? _selectedRange;
  final ValueChanged<SealDateTimeRange?>? _onRangeChanged;
  final String Function(SealDateTimeRange)? _formatDateRange;

  // ── Shared ──────────────────────────────────────────────────────────

  /// Widget shown inside the button when no date is selected.
  final Widget? placeholder;

  /// Whether the popover closes after a date is selected. Defaults to `true`.
  final bool? closeOnSelection;

  /// Month shown when the calendar first renders.
  final DateTime? initialMonth;

  /// Number of months displayed side-by-side. Defaults to `1`.
  final int numberOfMonths;

  /// Earliest month the user can navigate to.
  final DateTime? fromMonth;

  /// Latest month the user can navigate to.
  final DateTime? toMonth;

  /// Predicate that controls which days are selectable.
  final SelectableDayPredicate? selectableDayPredicate;

  /// Whether the picker is interactive. Defaults to `true`.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;
    final daySize = dimension.scaled(_kDatePickerDayButtonSize);

    final headerTextStyle = typo.small.copyWith(
      color: colors.textPrimary,
      fontWeight: FontWeight.w600,
    );
    final weekdaysTextStyle = typo.small.copyWith(color: colors.textSecondary);
    final dayTextStyle = typo.small.copyWith(color: colors.textPrimary);
    final selectedDayTextStyle = typo.small.copyWith(color: colors.surface);

    final calendarDecoration = ShadDecoration(
      border: ShadBorder.all(
        color: colors.border,
        radius: SealRadius.borderRadiusMd,
      ),
    );

    if (_variant == ShadDatePickerVariant.range) {
      return ShadDatePicker.range(
        selected: _selectedRange,
        onRangeChanged: _onRangeChanged,
        placeholder: placeholder,
        formatDateRange: _formatDateRange,
        closeOnSelection: closeOnSelection,
        initialMonth: initialMonth,
        numberOfMonths: numberOfMonths,
        fromMonth: fromMonth,
        toMonth: toMonth,
        selectableDayPredicate: selectableDayPredicate,
        enabled: enabled,
        calendarHeaderTextStyle: headerTextStyle,
        weekdaysTextStyle: weekdaysTextStyle,
        dayButtonTextStyle: dayTextStyle,
        selectedDayButtonTextStyle: selectedDayTextStyle,
        dayButtonSize: daySize,
        calendarDecoration: calendarDecoration,
        backgroundColor: colors.surface,
        foregroundColor: colors.textPrimary,
        hoverBackgroundColor: colors.surfaceAlt,
        buttonDecoration: ShadDecoration(
          border: ShadBorder.all(
            color: colors.border,
            radius: SealRadius.borderRadiusMd,
          ),
        ),
      );
    }

    return ShadDatePicker(
      selected: selected,
      onChanged: onChanged,
      placeholder: placeholder,
      formatDate: formatDate,
      closeOnSelection: closeOnSelection,
      allowDeselection: allowDeselection,
      initialMonth: initialMonth,
      numberOfMonths: numberOfMonths,
      fromMonth: fromMonth,
      toMonth: toMonth,
      selectableDayPredicate: selectableDayPredicate,
      enabled: enabled,
      calendarHeaderTextStyle: headerTextStyle,
      weekdaysTextStyle: weekdaysTextStyle,
      dayButtonTextStyle: dayTextStyle,
      selectedDayButtonTextStyle: selectedDayTextStyle,
      dayButtonSize: daySize,
      calendarDecoration: calendarDecoration,
      backgroundColor: colors.surface,
      foregroundColor: colors.textPrimary,
      hoverBackgroundColor: colors.surfaceAlt,
      buttonDecoration: ShadDecoration(
        border: ShadBorder.all(
          color: colors.border,
          radius: SealRadius.borderRadiusMd,
        ),
      ),
    );
  }
}
