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
  /// Creates a Seal-styled tooltip with a [Widget] [message].
  ///
  /// The message widget is wrapped in a [DefaultTextStyle] so plain [Text]
  /// widgets inherit the correct Seal typography automatically.
  const SealTooltip({
    super.key,
    required this.child,
    required Widget message,
    this.waitDuration,
    this.showDuration,
    this.anchor,
  }) : _message = message,
       _builder = null;

  /// Creates a Seal-styled tooltip with a custom content [builder].
  const SealTooltip.custom({
    super.key,
    required this.child,
    required WidgetBuilder builder,
    this.waitDuration,
    this.showDuration,
    this.anchor,
  }) : _message = null,
       _builder = builder;

  /// The widget that triggers the tooltip on hover/focus.
  final Widget child;

  /// Delay before the tooltip appears after the pointer enters.
  final Duration? waitDuration;

  /// How long the tooltip stays visible after the cursor/focus leaves.
  final Duration? showDuration;

  /// Where the tooltip floats relative to [child].
  final ShadAnchorBase? anchor;

  final Widget? _message;
  final WidgetBuilder? _builder;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    final defaultStyle = typo.small.copyWith(color: colors.textPrimary);

    final effectiveBuilder =
        _builder ??
        (ctx) => DefaultTextStyle(
          style: defaultStyle,
          child: _message!,
        );

    return ShadTooltip(
      builder: effectiveBuilder,
      waitDuration: waitDuration,
      showDuration: showDuration,
      anchor:
          anchor ??
          ShadAnchor(
            childAlignment: Alignment.bottomCenter,
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
