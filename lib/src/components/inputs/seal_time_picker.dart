import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

// Default field width matching shadcn_ui's default (48 × input).
const double _kTimePickerFieldWidth = 48.0;

/// A time-of-day value used by [SealTimePicker].
///
/// Alias for [ShadTimeOfDay] to keep consuming apps free of raw `Shad*` types.
typedef SealTimeOfDay = ShadTimeOfDay;

/// Whether the time is AM or PM, used by [SealTimePicker.period].
///
/// Alias for [ShadDayPeriod].
typedef SealDayPeriod = ShadDayPeriod;

/// A controller for [SealTimePicker].
///
/// Alias for [ShadTimePickerController].
typedef SealTimePickerController = ShadTimePickerController;

/// A token-driven time picker built on [ShadTimePicker].
///
/// Two variants are available via named constructors:
///
/// - Default [SealTimePicker] — 24-hour format.
/// - [SealTimePicker.period] — 12-hour format with AM/PM selector.
///
/// ## 24-hour
///
/// ```dart
/// SealTimePicker(
///   onChanged: (time) => print(time),
/// )
/// ```
///
/// ## 12-hour with AM/PM
///
/// ```dart
/// SealTimePicker.period(
///   initialDayPeriod: SealDayPeriod.am,
///   onChanged: (time) => print(time),
/// )
/// ```
class SealTimePicker extends StatelessWidget {
  /// Creates a 24-hour time picker.
  const SealTimePicker({
    super.key,
    this.onChanged,
    this.initialValue,
    this.controller,
    this.showHours,
    this.showMinutes,
    this.showSeconds,
    this.enabled = true,
  }) : _variant = ShadTimePickerVariant.primary,
       initialDayPeriod = null;

  /// Creates a 12-hour time picker with AM/PM selector.
  const SealTimePicker.period({
    super.key,
    this.onChanged,
    this.initialValue,
    this.controller,
    this.initialDayPeriod,
    this.showHours,
    this.showMinutes,
    this.showSeconds,
    this.enabled = true,
  }) : _variant = ShadTimePickerVariant.period;

  // ── Internal variant marker ─────────────────────────────────────────
  final ShadTimePickerVariant _variant;

  /// Called when the selected time changes.
  final ValueChanged<SealTimeOfDay>? onChanged;

  /// Initial time value shown in the fields.
  final SealTimeOfDay? initialValue;

  /// Optional external controller for programmatic time management.
  final SealTimePickerController? controller;

  /// Initial AM/PM period (period variant only).
  final SealDayPeriod? initialDayPeriod;

  /// Whether to show the hours field. Defaults to `true`.
  final bool? showHours;

  /// Whether to show the minutes field. Defaults to `true`.
  final bool? showMinutes;

  /// Whether to show the seconds field. Defaults to `true`.
  final bool? showSeconds;

  /// Whether the picker is interactive. Defaults to `true`.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    final fieldDecoration = ShadDecoration(
      border: ShadBorder.all(
        color: colors.border,
        radius: SealRadius.borderRadiusMd,
      ),
    );

    final valueStyle = typo.body.copyWith(color: colors.textPrimary);
    final labelStyle = typo.small.copyWith(color: colors.textSecondary);

    if (_variant == ShadTimePickerVariant.period) {
      return ShadTimePicker.period(
        onChanged: onChanged,
        initialValue: initialValue,
        controller: controller,
        initialDayPeriod: initialDayPeriod,
        showHours: showHours,
        showMinutes: showMinutes,
        showSeconds: showSeconds,
        enabled: enabled,
        fieldDecoration: fieldDecoration,
        style: valueStyle,
        labelStyle: labelStyle,
        fieldWidth: dimension.scaled(_kTimePickerFieldWidth),
        spacing: dimension.sm,
        gap: dimension.xxs,
      );
    }

    return ShadTimePicker(
      onChanged: onChanged,
      initialValue: initialValue,
      controller: controller,
      showHours: showHours,
      showMinutes: showMinutes,
      showSeconds: showSeconds,
      enabled: enabled,
      fieldDecoration: fieldDecoration,
      style: valueStyle,
      labelStyle: labelStyle,
      fieldWidth: dimension.scaled(_kTimePickerFieldWidth),
      spacing: dimension.sm,
      gap: dimension.xxs,
    );
  }
}
