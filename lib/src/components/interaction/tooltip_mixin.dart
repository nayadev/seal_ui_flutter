import 'package:flutter/widgets.dart';

import 'seal_tooltip.dart';

/// Provides a [wrapWithTooltip] helper for widgets that support an optional tooltip.
mixin TooltipMixin {
  /// Duration a tooltip stays visible after the cursor/focus leaves.
  static const Duration _kTooltipShowDuration = Duration(seconds: 1);

  /// Wraps [child] in a [SealTooltip] when [tooltip] is non-null.
  Widget wrapWithTooltip(Widget child, Widget? tooltip) {
    if (tooltip == null) return child;
    return SealTooltip(
      showDuration: _kTooltipShowDuration,
      message: tooltip,
      child: child,
    );
  }
}
