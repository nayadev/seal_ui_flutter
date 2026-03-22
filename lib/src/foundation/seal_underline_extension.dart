import 'package:flutter/widgets.dart';

import '../tokens/base/seal_dimension.dart';

/// Adds an underline decoration below any widget.
///
/// ```dart
/// Text('Learn more').withUnderline(
///   context: context,
///   color: colors.primary,
/// );
/// ```
extension SealUnderlineExtension on Widget {
  /// Default stroke width of the underline.
  static const double kDefaultThickness = 1.5;

  /// Default gap between the widget and the underline.
  static const double kDefaultOffset = 2.0;

  /// Wraps this widget with a bottom border acting as an underline.
  ///
  /// [context] is used to resolve responsive scaling.
  /// [color] sets the underline color.
  /// [thickness] controls the stroke width (default `1.5`).
  /// [offset] controls the gap between the widget and the line (default `2.0`).
  Widget withUnderline({
    required BuildContext context,
    required Color color,
    double thickness = kDefaultThickness,
    double offset = kDefaultOffset,
  }) {
    final dimension = context.dimension;
    return Container(
      padding: EdgeInsets.only(bottom: dimension.scaled(offset)),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: color, width: dimension.scaled(thickness)),
        ),
      ),
      child: this,
    );
  }
}
