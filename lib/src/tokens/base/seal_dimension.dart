import 'package:flutter/widgets.dart';

import '../../foundation/seal_responsive.dart';

/// A responsive wrapper around [_Dimension] that scales every value by
/// a [factor].
///
/// Resolve automatically from the current screen width:
///
/// ```dart
/// final dimension = context.dimension;
/// padding: EdgeInsets.all(dimension.md),
/// ```
///
/// Or construct directly with a known factor:
///
/// ```dart
/// final dimension = SealDimension(1.125); // desktop scale
/// ```
///
/// When [factor] is `1.0` (default), values match [_Dimension] exactly.
class SealDimension {
  /// Creates a scaled dimension set by applying [factor] to every base token.
  ///
  /// Defaults to `1.0` (base / tablet scale) when omitted.
  const SealDimension([this.factor = 1.0]);

  /// Resolves the scale factor from [context] via [SealResponsive].
  factory SealDimension.of(BuildContext context) {
    return SealDimension(SealResponsive.scaleOf(context));
  }

  /// The multiplier applied to the base [_Dimension] values.
  final double factor;

  double _scaledDimension(double base) => (base * factor).roundToDouble();

  /// Scaled 2 px.
  double get xxxs => _scaledDimension(_Dimension.xxxs);

  /// Scaled 4 px.
  double get xxs => _scaledDimension(_Dimension.xxs);

  /// Scaled 8 px.
  double get xs => _scaledDimension(_Dimension.xs);

  /// Scaled 12 px.
  double get sm => _scaledDimension(_Dimension.sm);

  /// Scaled 16 px.
  double get md => _scaledDimension(_Dimension.md);

  /// Scaled 24 px.
  double get lg => _scaledDimension(_Dimension.lg);

  /// Scaled 32 px.
  double get xl => _scaledDimension(_Dimension.xl);

  /// Scaled 48 px.
  double get xxl => _scaledDimension(_Dimension.xxl);

  /// Scaled 64 px.
  double get xxxl => _scaledDimension(_Dimension.xxxl);

  /// Applies [factor] to an arbitrary [dimension] value.
  double scaled(double dimension) => _scaledDimension(dimension);
}

/// Convenience extension to access [SealDimension] directly from a
/// [BuildContext].
///
/// ```dart
/// final dimension = context.dimension;
/// padding: EdgeInsets.all(dimension.md),
/// ```
extension SealDimensionContext on BuildContext {
  /// Returns a [SealDimension] scaled to the current breakpoint.
  SealDimension get dimension => SealDimension.of(this);
}

/// Convenience extension to create [SizedBox] gaps directly from dimension values.
///
/// ```dart
/// final dimension = context.dimension;
/// ...
/// SizedBox verticalGap: dimension.md.verticalGap,
/// SizedBox horizontalGap: dimension.lg.horizontalGap,
/// SizedBox squareGap: dimension.sm.squareGap,
/// ...
/// ```
extension SealDimensionDouble on double {
  SizedBox get verticalGap => SizedBox(height: this);
  SizedBox get horizontalGap => SizedBox(width: this);
  SizedBox get squareGap => SizedBox.square(dimension: this);
}

/// Seal UI dimension scale.
///
/// A consistent set of dimension values used for paddings, margins, and gaps.
/// Based on a 4-px base unit.
abstract final class _Dimension {
  /// 2 px
  static const double xxxs = 2;

  /// 4 px
  static const double xxs = 4;

  /// 8 px
  static const double xs = 8;

  /// 12 px
  static const double sm = 12;

  /// 16 px
  static const double md = 16;

  /// 24 px
  static const double lg = 24;

  /// 32 px
  static const double xl = 32;

  /// 48 px
  static const double xxl = 48;

  /// 64 px
  static const double xxxl = 64;
}
