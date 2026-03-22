import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../seal_ui.dart';

/// A themed, elevated card with optional header, body, and footer sections,
/// built on [ShadCard].
///
/// Uses Seal design tokens for colors, spacing, border radius, and
/// typography. Supports optional gradient backgrounds — in that case the
/// card is rendered as a [ShadCard] wrapped inside a gradient [DecoratedBox]
/// so the Seal visual identity is preserved.
///
/// ```dart
/// SealCard(
///   header: Text('Title'),
///   body: Text('Content goes here'),
///   footer: Row(
///     mainAxisAlignment: MainAxisAlignment.end,
///     children: [
///       SealFilledButton.primary(label: 'OK', onPressed: () {}),
///     ],
///   ),
/// )
/// ```
class SealCard extends StatelessWidget {
  /// Creates a Seal-themed card.
  ///
  /// At least one of [header], [body], or [footer] must be provided.
  const SealCard({
    super.key,
    this.header,
    this.body,
    this.footer,
    this.padding,
    this.margin,
    this.borderRadius,
    this.color,
    this.gradient,
    this.showBorder = true,
    this.elevation = _kDefaultElevation,
    this.shadowColor,
    this.width,
    this.onTap,
  }) : assert(
         header != null || body != null || footer != null,
         'At least one of header, body, or footer must be provided.',
       );

  /// Widget displayed in the card header area.
  final Widget? header;

  /// Widget displayed in the card body area.
  final Widget? body;

  /// Widget displayed in the card footer area.
  final Widget? footer;

  /// Padding applied to the entire card content.
  ///
  /// Defaults to `dimension.lg` on all sides.
  final EdgeInsetsGeometry? padding;

  /// Margin around the card.
  final EdgeInsetsGeometry? margin;

  /// Border radius of the card.
  ///
  /// Defaults to [SealRadius.borderRadiusLg].
  final BorderRadius? borderRadius;

  /// Background color of the card.
  ///
  /// Defaults to the surface color from [ColorPalette].
  /// Ignored when [gradient] is provided.
  final Color? color;

  /// Optional gradient background for the card.
  ///
  /// When provided, [color] is ignored and the gradient is applied via a
  /// wrapping [DecoratedBox].
  final Gradient? gradient;

  /// Whether to show a border around the card.
  final bool showBorder;

  /// Elevation of the card shadow.
  final double elevation;

  /// Color of the card shadow.
  ///
  /// Defaults to black with reduced opacity.
  final Color? shadowColor;

  /// Optional fixed width for the card.
  final double? width;

  /// Optional tap callback. When provided, the card shows an ink splash.
  final VoidCallback? onTap;

  static const double _kDefaultElevation = 2;
  static const double _kShadowOpacity = 0.25;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final effectiveRadius = borderRadius ?? SealRadius.borderRadiusLg;
    final effectivePadding = padding ?? EdgeInsets.all(dimension.lg);
    final effectiveShadowColor =
        shadowColor ?? ColorX.black.withValues(alpha: SealCard._kShadowOpacity);

    // Build the section content that ShadCard expects as child.
    final sections = <Widget>[];

    if (header != null) sections.add(header!);

    if (body != null) {
      if (sections.isNotEmpty) {
        sections.add(SealDivider(height: dimension.lg));
      }
      sections.add(body!);
    }

    // Build the ShadCard shadows list from the elevation token.
    final shadows = elevation > 0
        ? [
            BoxShadow(
              color: effectiveShadowColor,
              blurRadius: dimension.scaled(elevation * 2),
              offset: Offset(0, dimension.scaled(elevation)),
            ),
          ]
        : <BoxShadow>[];

    // Wrap the footer with top spacing so it doesn't crowd the body content.
    // ShadCard places child and footer consecutively in a Column with no gap.
    final wrappedFooter = footer != null
        ? Padding(
            padding: EdgeInsets.only(top: dimension.md),
            child: footer,
          )
        : null;

    Widget card = ShadCard(
      width: width,
      padding: effectivePadding,
      radius: effectiveRadius,
      backgroundColor: gradient == null ? (color ?? colors.surface) : null,
      border: showBorder
          ? ShadBorder.all(color: colors.border)
          : ShadBorder.none,
      shadows: shadows,
      footer: wrappedFooter,
      child: sections.isEmpty
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: sections,
            ),
    );

    // Wrap with a gradient container when a gradient is requested.
    if (gradient != null) {
      card = DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: effectiveRadius,
          border: showBorder ? Border.all(color: colors.border) : null,
          boxShadow: shadows,
        ),
        child: ClipRRect(
          borderRadius: effectiveRadius,
          child: ShadCard(
            padding: effectivePadding,
            radius: effectiveRadius,
            backgroundColor: ColorX.transparent,
            border: ShadBorder.none,
            shadows: const [],
            footer: wrappedFooter,
            child: sections.isEmpty
                ? null
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: sections,
                  ),
          ),
        ),
      );
    }

    if (margin != null || width != null) {
      card = Container(width: width, margin: margin, child: card);
    }

    if (onTap == null) return card;

    return SealPressable(onTap: onTap, child: card);
  }
}
