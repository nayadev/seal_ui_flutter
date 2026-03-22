import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// A styled tooltip for the Seal UI design system, built on [ShadTooltip].
///
/// Shows a floating label when the user hovers over or focuses [child].
/// Use the default constructor for plain-text tips, or [SealTooltip.custom]
/// for richer content.
///
/// ```dart
/// SealTooltip(
///   message: 'Delete item',
///   child: SealIconButton.primary(icon: LucideIcons.trash2, onPressed: _onDelete),
/// )
///
/// SealTooltip.custom(
///   builder: (context) => const Text('More info here'),
///   child: const Icon(LucideIcons.info),
/// )
/// ```
class SealTooltip extends StatelessWidget {
  /// Creates a Seal-styled tooltip with a plain-text [message].
  const SealTooltip({
    super.key,
    required this.child,
    required String message,
    this.waitDuration,
    this.anchor,
  }) : _message = message,
       _builder = null;

  /// Creates a Seal-styled tooltip with a custom content [builder].
  const SealTooltip.custom({
    super.key,
    required this.child,
    required WidgetBuilder builder,
    this.waitDuration,
    this.anchor,
  }) : _message = null,
       _builder = builder;

  /// The widget that triggers the tooltip on hover/focus.
  final Widget child;

  /// Delay before the tooltip appears after the pointer enters.
  final Duration? waitDuration;

  /// Where the tooltip floats relative to [child].
  final ShadAnchorBase? anchor;

  final String? _message;
  final WidgetBuilder? _builder;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    final effectiveBuilder =
        _builder ??
        (ctx) => Text(
          _message!,
          style: typo.small.copyWith(color: colors.textPrimary),
        );

    return ShadTooltip(
      builder: effectiveBuilder,
      waitDuration: waitDuration,
      anchor:
          anchor ??
          ShadAnchor(
            overlayAlignment: Alignment.topCenter,
            offset: Offset(0, -dimension.xs),
          ),
      padding: EdgeInsets.symmetric(
        horizontal: dimension.sm,
        vertical: dimension.xxs,
      ),
      decoration: ShadDecoration(
        color: colors.surface,
        border: ShadBorder.all(
          color: colors.border,
          radius: SealRadius.borderRadiusSm,
        ),
      ),
      child: child,
    );
  }
}
