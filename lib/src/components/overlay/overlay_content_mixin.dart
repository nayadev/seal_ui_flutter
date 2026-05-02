import 'package:flutter/widgets.dart';

import '../../tokens/abstractions/color_palette.dart';
import '../../tokens/abstractions/typography_tokens.dart';

/// Provides styled title and description widget builders for overlay components.
///
/// Mix into [StatelessWidget] subclasses such as dialogs and sheets to share
/// identical title/description styling without duplication.
mixin OverlayContentMixin {
  /// Builds a styled title widget, or returns `null` when [title] is `null`.
  Widget? buildOverlayTitle(
    Widget? title,
    TypographyTokens typo,
    ColorPalette colors,
  ) {
    if (title == null) return null;
    return DefaultTextStyle.merge(
      style: typo.large.copyWith(
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      child: title,
    );
  }

  /// Builds a styled description widget, or returns `null` when [description]
  /// is `null`.
  Widget? buildOverlayDescription(
    Widget? description,
    TypographyTokens typo,
    ColorPalette colors,
  ) {
    if (description == null) return null;
    return DefaultTextStyle.merge(
      style: typo.small.copyWith(color: colors.textSecondary),
      child: description,
    );
  }
}
