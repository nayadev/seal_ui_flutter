import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

// Default day-button size matching shadcn_ui's default (36 × 36).
const double _kDayButtonSize = 36.0;

/// A date range used by [SealCalendar.range] and [SealDatePicker].
///
/// Wraps [ShadDateTimeRange] to keep the Seal public API free of raw `Shad*`
/// types.
typedef SealDateTimeRange = ShadDateTimeRange;

/// A token-driven calendar built on [ShadCalendar].
///
/// Three variants are available via named constructors:
///
/// - Default [SealCalendar] — single-date selection.
/// - [SealCalendar.multiple] — multiple independent dates.
/// - [SealCalendar.range] — continuous date range.
///
/// ## Single-date
///
/// ```dart
/// SealCalendar(
///   selected: _date,
///   onChanged: (date) => setState(() => _date = date),
/// )
/// ```
///
/// ## Range
///
/// ```dart
/// SealCalendar.range(
///   selected: _range,
///   onChanged: (range) => setState(() => _range = range),
/// )
/// ```
class SealCalendar extends StatelessWidget {
  /// Creates a single-date selection calendar.
  const SealCalendar({
    super.key,
    this.selected,
    this.onChanged,
    this.initialMonth,
    this.numberOfMonths = 1,
    this.showOutsideDays,
    this.fromMonth,
    this.toMonth,
    this.selectableDayPredicate,
    this.allowDeselection,
    this.captionLayout,
  }) : _variant = ShadCalendarVariant.single,
       _multipleSelected = null,
       _onMultipleChanged = null,
       _selectedRange = null,
       _onRangeChanged = null,
       _min = null,
       _max = null;

  /// Creates a multiple-date selection calendar.
  const SealCalendar.multiple({
    super.key,
    List<DateTime>? selected,
    ValueChanged<List<DateTime>>? onChanged,
    this.initialMonth,
    this.numberOfMonths = 1,
    this.showOutsideDays,
    this.fromMonth,
    this.toMonth,
    this.selectableDayPredicate,
    this.captionLayout,
    int? min,
    int? max,
  }) : _variant = ShadCalendarVariant.multiple,
       selected = null,
       onChanged = null,
       _multipleSelected = selected,
       _onMultipleChanged = onChanged,
       _selectedRange = null,
       _onRangeChanged = null,
       allowDeselection = null,
       _min = min,
       _max = max;

  /// Creates a date-range selection calendar.
  const SealCalendar.range({
    super.key,
    SealDateTimeRange? selected,
    ValueChanged<SealDateTimeRange?>? onChanged,
    this.initialMonth,
    this.numberOfMonths = 1,
    this.showOutsideDays,
    this.fromMonth,
    this.toMonth,
    this.selectableDayPredicate,
    this.captionLayout,
    int? min,
    int? max,
  }) : _variant = ShadCalendarVariant.range,
       selected = null,
       onChanged = null,
       _multipleSelected = null,
       _onMultipleChanged = null,
       _selectedRange = selected,
       _onRangeChanged = onChanged,
       allowDeselection = null,
       _min = min,
       _max = max;

  // ── Internal variant marker ─────────────────────────────────────────
  final ShadCalendarVariant _variant;

  // ── Single ──────────────────────────────────────────────────────────

  /// The currently selected date (single variant only).
  final DateTime? selected;

  /// Called when the selected date changes (single variant only).
  final ValueChanged<DateTime?>? onChanged;

  /// Whether the user can tap a selected day to deselect it (single only).
  final bool? allowDeselection;

  // ── Multiple ────────────────────────────────────────────────────────
  final List<DateTime>? _multipleSelected;
  final ValueChanged<List<DateTime>>? _onMultipleChanged;

  // ── Range ───────────────────────────────────────────────────────────
  final SealDateTimeRange? _selectedRange;
  final ValueChanged<SealDateTimeRange?>? _onRangeChanged;

  // ── Shared ──────────────────────────────────────────────────────────

  /// Month shown when the calendar first renders.
  final DateTime? initialMonth;

  /// Number of months displayed side-by-side. Defaults to `1`.
  final int numberOfMonths;

  /// Whether days outside the current month are visible.
  final bool? showOutsideDays;

  /// Earliest month the user can navigate to.
  final DateTime? fromMonth;

  /// Latest month the user can navigate to.
  final DateTime? toMonth;

  /// Predicate that controls which days the user can select.
  final SelectableDayPredicate? selectableDayPredicate;

  /// Header layout style (label, dropdown, dropdownMonths, dropdownYears).
  final ShadCalendarCaptionLayout? captionLayout;

  final int? _min;
  final int? _max;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;
    final daySize = dimension.scaled(_kDayButtonSize);

    final headerTextStyle = typo.small.copyWith(
      color: colors.textPrimary,
      fontWeight: FontWeight.w600,
    );
    final weekdaysTextStyle = typo.small.copyWith(color: colors.textSecondary);
    final dayTextStyle = typo.small.copyWith(color: colors.textPrimary);
    final selectedDayTextStyle = typo.small.copyWith(color: colors.surface);

    switch (_variant) {
      case ShadCalendarVariant.multiple:
        return ShadCalendar.multiple(
          selected: _multipleSelected,
          onChanged: _onMultipleChanged,
          initialMonth: initialMonth,
          numberOfMonths: numberOfMonths,
          showOutsideDays: showOutsideDays,
          fromMonth: fromMonth,
          toMonth: toMonth,
          selectableDayPredicate: selectableDayPredicate,
          captionLayout: captionLayout,
          min: _min,
          max: _max,
          headerTextStyle: headerTextStyle,
          weekdaysTextStyle: weekdaysTextStyle,
          dayButtonTextStyle: dayTextStyle,
          selectedDayButtonTextStyle: selectedDayTextStyle,
          dayButtonSize: daySize,
          decoration: ShadDecoration(
            border: ShadBorder.all(
              color: colors.border,
              radius: SealRadius.borderRadiusMd,
            ),
          ),
        );

      case ShadCalendarVariant.range:
        return ShadCalendar.range(
          selected: _selectedRange,
          onChanged: _onRangeChanged,
          initialMonth: initialMonth,
          numberOfMonths: numberOfMonths,
          showOutsideDays: showOutsideDays,
          fromMonth: fromMonth,
          toMonth: toMonth,
          selectableDayPredicate: selectableDayPredicate,
          captionLayout: captionLayout,
          min: _min,
          max: _max,
          headerTextStyle: headerTextStyle,
          weekdaysTextStyle: weekdaysTextStyle,
          dayButtonTextStyle: dayTextStyle,
          selectedDayButtonTextStyle: selectedDayTextStyle,
          dayButtonSize: daySize,
          decoration: ShadDecoration(
            border: ShadBorder.all(
              color: colors.border,
              radius: SealRadius.borderRadiusMd,
            ),
          ),
        );

      case ShadCalendarVariant.single:
        return ShadCalendar(
          selected: selected,
          onChanged: onChanged,
          initialMonth: initialMonth,
          numberOfMonths: numberOfMonths,
          showOutsideDays: showOutsideDays,
          fromMonth: fromMonth,
          toMonth: toMonth,
          selectableDayPredicate: selectableDayPredicate,
          allowDeselection: allowDeselection,
          captionLayout: captionLayout,
          headerTextStyle: headerTextStyle,
          weekdaysTextStyle: weekdaysTextStyle,
          dayButtonTextStyle: dayTextStyle,
          selectedDayButtonTextStyle: selectedDayTextStyle,
          dayButtonSize: daySize,
          decoration: ShadDecoration(
            border: ShadBorder.all(
              color: colors.border,
              radius: SealRadius.borderRadiusMd,
            ),
          ),
        );
    }
  }
}
