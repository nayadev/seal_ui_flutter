import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';

/// A token-driven separator line built on [ShadSeparator].
///
/// Two variants are available via named constructors:
///
/// - Default [SealSeparator] — horizontal rule.
/// - [SealSeparator.vertical] — vertical rule.
///
/// ```dart
/// // Horizontal (default)
/// const SealSeparator()
///
/// // Horizontal with custom margin
/// SealSeparator(margin: EdgeInsets.symmetric(vertical: 8))
///
/// // Vertical
/// const SealSeparator.vertical()
/// ```
class SealSeparator extends StatelessWidget {
  /// Creates a horizontal separator.
  const SealSeparator({super.key, this.margin})
      : _vertical = false;

  /// Creates a vertical separator.
  const SealSeparator.vertical({super.key, this.margin})
      : _vertical = true;

  /// Space around the separator line. When `null`, uses the shadcn_ui theme
  /// default margin.
  final EdgeInsetsGeometry? margin;

  final bool _vertical;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;

    if (_vertical) {
      return ShadSeparator.vertical(color: colors.border, margin: margin);
    }
    return ShadSeparator.horizontal(color: colors.border, margin: margin);
  }
}
