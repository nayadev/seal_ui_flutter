import 'package:flutter/material.dart';

import '../../theme/seal_theme.dart';
import '../../tokens/base/seal_radius.dart';
import '../../tokens/base/seal_dimension.dart';

/// A styled container for the Seal UI design system.
///
/// Renders a surface-colored box with consistent padding, border radius,
/// and optional border — all driven by design tokens.
///
/// ```dart
/// SealContainer(
///   child: Text('Hello, Seal!'),
/// )
/// ```
class SealContainer extends StatelessWidget {
  const SealContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.color,
    this.showBorder = true,
    this.width,
    this.height,
    this.gradient,
  });

  /// The content of the container.
  final Widget child;

  /// Custom padding — defaults to [SealDimension.md] on all sides.
  final EdgeInsetsGeometry? padding;

  /// Custom margin.
  final EdgeInsetsGeometry? margin;

  /// Custom border radius — defaults to [SealRadius.borderRadiusMd].
  final BorderRadiusGeometry? borderRadius;

  /// Custom background color. If `null`, uses `colors.surface`.
  final Color? color;

  /// Whether to render a subtle border. Defaults to `true`.
  final bool showBorder;

  /// Optional fixed width.
  final double? width;

  /// Optional fixed height.
  final double? height;

  /// Optional gradient. When set, overrides the solid [color].
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;

    final effectiveRadius = borderRadius ?? SealRadius.borderRadiusMd;

    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ?? EdgeInsets.all(context.dimension.md),
      decoration: BoxDecoration(
        color: gradient == null ? (color ?? colors.surface) : null,
        gradient: gradient,
        borderRadius: effectiveRadius,
        border: showBorder ? Border.all(color: colors.border) : null,
      ),
      child: child,
    );
  }
}
