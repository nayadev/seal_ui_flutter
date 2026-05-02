import 'package:flutter/painting.dart';

import '../../tokens/abstractions/gradient_tokens.dart';

/// Internal variant shared by all Seal button implementations.
///
/// Not part of the public API — not exported from the barrel.
enum SealButtonVariant {
  /// Primary brand color fill or border.
  primary,

  /// Accent color fill or border.
  accent,

  /// Secondary accent color fill or border.
  accentSecondary,

  /// Primary gradient fill, border, or text.
  gradient,

  /// Accent gradient fill, border, or text.
  accentGradient,

  /// Arbitrary solid color or gradient supplied by the caller.
  custom,
}

/// Internal helpers for [SealButtonVariant].
extension SealButtonVariantX on SealButtonVariant {
  /// Returns `true` when this variant should render with a gradient.
  bool isGradientVariant(LinearGradient? customGradient) =>
      this == SealButtonVariant.gradient ||
      this == SealButtonVariant.accentGradient ||
      (this == SealButtonVariant.custom && customGradient != null);

  /// Resolves the active gradient from design tokens or falls back to
  /// [customGradient] for [SealButtonVariant.custom].
  LinearGradient resolveGradient(
    GradientTokens gradients,
    LinearGradient? customGradient,
  ) => switch (this) {
    SealButtonVariant.gradient => gradients.primaryGradient,
    SealButtonVariant.accentGradient => gradients.accentGradient,
    _ => customGradient!,
  };
}
