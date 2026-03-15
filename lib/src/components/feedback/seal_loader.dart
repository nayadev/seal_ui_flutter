import 'package:flutter/material.dart';

import '../../theme/seal_theme.dart';
import '../../tokens/base/seal_dimension.dart';

/// The visual size of a [SealLoader].
enum SealLoaderSize {
  /// 16 × 16
  small(16),

  /// 24 × 24
  medium(24),

  /// 40 × 40
  large(40);

  const SealLoaderSize(this._dimension);

  /// The width and height of the indicator.
  final double _dimension;

  /// Resolves the actual dimension by applying the current [SealDimension] scale
  double dimension(BuildContext context) =>
      context.dimension.scaled(_dimension);
}

/// A loading indicator styled with Seal UI tokens.
///
/// Wraps [CircularProgressIndicator] with token-driven colors and
/// consistent sizing.
///
/// ```dart
/// const SealLoader()
/// const SealLoader(size: SealLoaderSize.large)
/// ```
class SealLoader extends StatelessWidget {
  const SealLoader({
    super.key,
    this.size = SealLoaderSize.medium,
    this.color,
    this.strokeWidth,
    this.label,
  });

  /// The size preset for the indicator.
  final SealLoaderSize size;

  /// Custom color — defaults to `colors.primary`.
  final Color? color;

  /// Stroke width used for the large size preset.
  static const double _kStrokeWidthLarge = 3.0;

  /// Stroke width used for small and medium size presets.
  static const double _kStrokeWidthDefault = 2.5;

  /// Custom stroke width — defaults to `2.5` for small/medium, `3.0` for
  /// large.
  final double? strokeWidth;

  /// Optional text label shown below the spinner.
  final String? label;

  double get _strokeWidth {
    if (strokeWidth != null) return strokeWidth!;
    return size == SealLoaderSize.large
        ? _kStrokeWidthLarge
        : _kStrokeWidthDefault;
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final effectiveColor = color ?? tokens.colors.primary;

    final indicator = SizedBox(
      width: size.dimension(context),
      height: size.dimension(context),
      child: CircularProgressIndicator(
        strokeWidth: context.dimension.scaled(_strokeWidth),
        color: effectiveColor,
      ),
    );

    if (label == null) return indicator;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        indicator,
        context.dimension.sm.verticalGap,
        Text(
          label!,
          style: tokens.typography.caption.copyWith(
            color: tokens.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
