import 'dart:ui';

/// Holds [active] and [disabled] variants of a semantic color.
///
/// Eliminates manual `.withValues(alpha:)` calls across components by
/// providing pre-computed state-aware color pairs.
///
/// ```dart
/// final colors = context.themeTokens.colors;
/// final fg = colors.foreground.active;
/// final fgDisabled = colors.foreground.disabled;
/// ```
class SealStateColor {
  /// Default opacity applied to the disabled color variant.
  static const double kDefaultDisabledOpacity = 0.4;

  /// Creates a state color pair from a [base] color.
  ///
  /// The [disabled] variant defaults to the [base] with 40% opacity.
  SealStateColor(
    Color base, {
    double disabledOpacity = kDefaultDisabledOpacity,
  }) : active = base,
       disabled = base.withValues(alpha: disabledOpacity);

  /// The color for the active/enabled state.
  final Color active;

  /// The color for the disabled state.
  final Color disabled;
}
