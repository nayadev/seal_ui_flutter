import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_radius.dart';

/// Provides shared calendar text-style and decoration helpers.
///
/// Mix into widgets that render a [ShadCalendar] or [ShadDatePicker] to avoid
/// repeating the same token-driven style derivations.
mixin CalendarStylesMixin {
  /// Resolves the four calendar text styles and the standard border decoration
  /// from the current theme tokens.
  ({
    TextStyle header,
    TextStyle weekdays,
    TextStyle day,
    TextStyle selectedDay,
    ShadDecoration decoration,
  })
  resolveCalendarStyles(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    return (
      header: typo.small.copyWith(
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      weekdays: typo.small.copyWith(color: colors.textSecondary),
      day: typo.small.copyWith(color: colors.textPrimary),
      selectedDay: typo.small.copyWith(color: colors.surface),
      decoration: ShadDecoration(
        border: ShadBorder.all(
          color: colors.border,
          radius: SealRadius.borderRadiusMd,
        ),
      ),
    );
  }
}
