import 'package:flutter/material.dart';

/// Adds an underline decoration below any widget.
///
/// ```dart
/// Text('Learn more').withUnderline(color: colors.primary);
/// ```
extension NebulaUnderlineExtension on Widget {
  /// Wraps this widget with a bottom border acting as an underline.
  ///
  /// [color] sets the underline color.
  /// [thickness] controls the stroke width (default `1.5`).
  /// [offset] controls the gap between the widget and the line (default `2.0`).
  Widget withUnderline({
    required Color color,
    double thickness = 1.5,
    double offset = 2.0,
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
