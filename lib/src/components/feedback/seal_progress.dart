import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// A styled linear progress indicator for the Seal UI design system,
/// built on [ShadProgress].
///
/// When [value] is `null` the bar plays an indeterminate animation. Pass a
/// value between `0.0` and `1.0` for a determinate bar.
///
/// ```dart
/// // Indeterminate
/// const SealProgress()
///
/// // Determinate — 60 %
/// const SealProgress(value: 0.6)
///
/// // Accent color
/// SealProgress(value: 0.4, useAccent: true)
/// ```
class SealProgress extends StatelessWidget {
  /// Default track height in logical pixels.
  static const double _kHeight = 8;

  /// Creates a Seal-styled progress bar.
  const SealProgress({
    super.key,
    this.value,
    this.useAccent = false,
    this.semanticsLabel,
  });

  /// Progress value between `0.0` (empty) and `1.0` (full).
  ///
  /// `null` shows an indeterminate animation.
  final double? value;

  /// When `true` the filled track uses the accent color instead of primary.
  final bool useAccent;

  /// Accessibility label for screen readers.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;

    return ShadProgress(
      value: value,
      color: useAccent ? colors.accent : colors.primary,
      backgroundColor: colors.border,
      minHeight: dimension.scaled(_kHeight),
      borderRadius: SealRadius.borderRadiusFull,
      innerBorderRadius: SealRadius.borderRadiusFull,
      semanticsLabel: semanticsLabel,
    );
  }
}
