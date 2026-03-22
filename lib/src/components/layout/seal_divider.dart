import 'package:flutter/widgets.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// A thin horizontal or vertical rule styled with Seal UI tokens.
///
/// Mirrors the parameter surface of Flutter's [Divider] and [VerticalDivider],
/// replacing hard-coded values with Seal design tokens and adding an [opacity]
/// convenience parameter.
///
/// ```dart
/// // Horizontal (default)
/// SealDivider()
///
/// // With height, indent and endIndent
/// SealDivider(height: 32, indent: 16, endIndent: 16)
///
/// // Vertical
/// SealDivider.vertical(width: 16)
///
/// // Custom color and opacity
/// SealDivider(color: tokens.colors.primary, opacity: 0.3)
/// ```
class SealDivider extends StatelessWidget {
  /// Creates a horizontal [SealDivider].
  ///
  /// [height] is the total vertical space consumed by this widget; the line
  /// is centered within it. When `null`, the widget sizes to the line alone.
  const SealDivider({
    super.key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.opacity = _kDefaultOpacity,
  }) : _width = null,
       _vertical = false;

  /// Creates a vertical [SealDivider].
  ///
  /// [width] is the total horizontal space consumed by this widget; the line
  /// is centered within it. When `null`, the widget sizes to the line alone.
  const SealDivider.vertical({
    super.key,
    double? width,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.opacity = _kDefaultOpacity,
  }) : height = null,
       _width = width,
       _vertical = true;

  /// Total height consumed by the horizontal divider (line + surrounding space).
  ///
  /// The line is centered within this height. When `null`, the widget sizes to
  /// the line thickness only.
  final double? height;

  /// Thickness of the line in logical pixels before responsive scaling.
  ///
  /// Defaults to `1.0`.
  final double? thickness;

  /// Empty space leading the start of the line.
  final double? indent;

  /// Empty space trailing the end of the line.
  final double? endIndent;

  /// Custom line color. Defaults to `colors.border`.
  final Color? color;

  /// Opacity applied to the resolved line color. Defaults to `0.5`.
  final double opacity;

  final double? _width;
  final bool _vertical;

  static const double _kDefaultThickness = 1.0;
  static const double _kDefaultOpacity = 0.5;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final dimension = context.dimension;
    final effectiveColor = (color ?? tokens.colors.border).withValues(
      alpha: opacity,
    );
    final effectiveThickness = dimension.scaled(
      thickness ?? _kDefaultThickness,
    );

    final Widget line = DecoratedBox(
      decoration: BoxDecoration(color: effectiveColor),
      child: _vertical
          ? SizedBox(width: effectiveThickness, height: double.infinity)
          : SizedBox(height: effectiveThickness, width: double.infinity),
    );

    final Widget indented = (indent != null || endIndent != null)
        ? Padding(
            padding: _vertical
                ? EdgeInsets.only(
                    top: indent ?? 0,
                    bottom: endIndent ?? 0,
                  )
                : EdgeInsets.only(
                    left: indent ?? 0,
                    right: endIndent ?? 0,
                  ),
            child: line,
          )
        : line;

    if (_vertical) {
      if (_width == null) return indented;
      return SizedBox(
        width: _width,
        child: Center(child: indented),
      );
    }

    if (height == null) return indented;
    return SizedBox(
      height: height,
      child: Center(child: indented),
    );
  }
}
