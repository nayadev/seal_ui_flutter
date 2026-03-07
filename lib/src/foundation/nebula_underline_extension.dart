import 'package:flutter/material.dart';

/// Adds an underline decoration below any widget.
///
/// ```dart
/// Text('Learn more').withUnderline(color: colors.primary);
/// ```
extension NebulaUnderlineExtension on Widget {
  /// Default stroke width of the underline.
  static const double kDefaultThickness = 1.5;

  /// Default gap between the widget and the underline.
  static const double kDefaultOffset = 2.0;

  /// Wraps this widget with a bottom border acting as an underline.
  ///
  /// [color] sets the underline color.
  /// [thickness] controls the stroke width (default `1.5`).
  /// [offset] controls the gap between the widget and the line (default `2.0`).
  Widget withUnderline({
    required Color color,
    double thickness = kDefaultThickness,
    double offset = kDefaultOffset,
  }) {
    return Container(
      padding: EdgeInsets.only(bottom: offset),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: color, width: thickness),
        ),
      ),
      child: this,
    );
  }
}
