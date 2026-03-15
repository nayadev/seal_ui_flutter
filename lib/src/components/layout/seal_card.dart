import 'package:flutter/material.dart';

import '../../../seal_ui.dart';

/// A themed, elevated card with optional header, body, and footer sections.
///
/// Uses Seal design tokens for colors, spacing, border radius, and
/// typography. Supports optional gradient backgrounds.
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
  final BorderRadiusGeometry? borderRadius;

  /// Background color of the card.
  ///
  /// Defaults to the surface color from [ColorPalette].
  /// Ignored when [gradient] is provided.
  final Color? color;

  /// Optional gradient background for the card.
  ///
  /// When provided, [color] is ignored.
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
  static const double _kDividerOpacity = 0.5;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final effectiveRadius = borderRadius ?? SealRadius.borderRadiusLg;
    final effectivePadding = padding ?? EdgeInsets.all(dimension.lg);
    final effectiveShadowColor =
        shadowColor ?? Colors.black.withValues(alpha: _kShadowOpacity);

    final sections = <Widget>[];

    if (header != null) {
      sections.add(header!);
    }

    if (body != null) {
      if (sections.isNotEmpty) {
        sections.add(
          Divider(
            height: dimension.lg,
            thickness: dimension.scaled(1),
            color: colors.border.withValues(alpha: _kDividerOpacity),
          ),
        );
      }
      sections.add(body!);
    }

    if (footer != null) {
      if (sections.isNotEmpty) {
        sections.add(
          Divider(
            height: dimension.lg,
            thickness: dimension.scaled(1),
            color: colors.border.withValues(alpha: _kDividerOpacity),
          ),
        );
      }
      sections.add(footer!);
    }

    final content = Padding(
      padding: effectivePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: sections,
      ),
    );

    return Container(
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: gradient == null ? (color ?? colors.surface) : null,
        gradient: gradient,
        borderRadius: effectiveRadius,
        border: showBorder ? Border.all(color: colors.border) : null,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: effectiveShadowColor,
                  blurRadius: dimension.scaled(elevation * 2),
                  offset: Offset(0, dimension.scaled(elevation)),
                ),
              ]
            : null,
      ),
      child: onTap != null
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: effectiveRadius is BorderRadius
                    ? effectiveRadius
                    : null,
                onTap: onTap,
                child: content,
              ),
            )
          : content,
    );
  }
}
