import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../tokens/base/nebula_dimension.dart';

/// The visual size of a [NebulaLoader].
enum NebulaLoaderSize {
  /// 16 × 16
  small(16),

  /// 24 × 24
  medium(24),

  /// 40 × 40
  large(40);

  const NebulaLoaderSize(this.dimension);

  /// The width and height of the indicator.
  final double dimension;
}

/// A loading indicator styled with Nebula UI tokens.
///
/// Wraps [CircularProgressIndicator] with token-driven colors and
/// consistent sizing.
///
/// ```dart
/// const NebulaLoader()
/// const NebulaLoader(size: NebulaLoaderSize.large)
/// ```
class NebulaLoader extends StatelessWidget {
  const NebulaLoader({
    super.key,
    this.size = NebulaLoaderSize.medium,
    this.color,
    this.strokeWidth,
    this.label,
  });

  /// The size preset for the indicator.
  final NebulaLoaderSize size;

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
    return size == NebulaLoaderSize.large
        ? _kStrokeWidthLarge
        : _kStrokeWidthDefault;
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final effectiveColor = color ?? tokens.colors.primary;

    final indicator = SizedBox(
      width: size.dimension,
      height: size.dimension,
      child: CircularProgressIndicator(
        strokeWidth: _strokeWidth,
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
